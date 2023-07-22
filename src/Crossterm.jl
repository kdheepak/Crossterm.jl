module Crossterm

using EnumX
using Dates

include("LibCrossterm.jl")

using .LibCrossterm

macro crossterm_call(expr)
  esc(quote
    result = $(expr)
    if result != 0
      throw(ErrorException("Error when calling $func. $(last_error_message())"))
    end
    nothing
  end)
end

"""
Return most recent error message.
"""
function last_error_message()
  ptr = LibCrossterm.crossterm_last_error_message()
  s = unsafe_string(ptr)
  LibCrossterm.crossterm_free_c_char(ptr)
  s
end

"""
Clear last error
"""
clear_last_error() = LibCrossterm.crossterm_clear_last_error()

line_wrap(switch = true) =
  if switch
    @crossterm_call crossterm_enable_line_wrap()
  else
    @crossterm_call crossterm_disable_line_wrap()
  end
alternate_screen(switch = true) =
  if switch
    @crossterm_call crossterm_enter_alternate_screen()
  else
    @crossterm_call crossterm_leave_alternate_screen()
  end

reset_color() = @crossterm_call crossterm_style_reset_color()

@enumx Attribute::UInt32 begin
  RESET = 0
  BOLD = 1
  DIM = 2
  ITALIC = 3
  UNDERLINED = 4
  DOUBLE_UNDERLINED = 5
  UNDERCURLED = 6
  UNDERDOTTED = 7
  UNDERDASHED = 8
  SLOW_BLINK = 9
  RAPID_BLINK = 10
  REVERSE = 11
  HIDDEN = 12
  CROSSED_OUT = 13
  FRAKTUR = 14
  NO_BOLD = 15
  NORMAL_INTENSITY = 16
  NO_ITALIC = 17
  NO_UNDERLINE = 18
  NO_BLINK = 19
  NO_REVERSE = 20
  NO_HIDDEN = 21
  NOT_CROSSED_OUT = 22
  FRAMED = 23
  ENCIRCLED = 24
  OVER_LINED = 25
  NOT_FRAMED_OR_ENCIRCLED = 26
  NOT_OVER_LINED = 27
end
Base.cconvert(::Type{LibCrossterm.crossterm_Attribute}, v::Attribute.T) = LibCrossterm.crossterm_Attribute(UInt32(v))

attribute(attr::Attribute.T) = @crossterm_call crossterm_style_set_attribute(attr)

"""
    crossterm_ClearType

Different ways to clear the terminal buffer.
"""
@enumx ClearType::UInt32 begin
  ALL = 0
  PURGE = 1
  FROM_CURSOR_DOWN = 2
  FROM_CURSOR_UP = 3
  CURRENT_LINE = 4
  UNTIL_NEW_LINE = 5
end
Base.cconvert(::Type{LibCrossterm.crossterm_ClearType}, v::ClearType.T) = LibCrossterm.crossterm_ClearType(UInt32(v))

function clear(ct::ClearType.T = ClearType.ALL)
  @crossterm_call crossterm_terminal_clear(ct)
end

raw_mode(switch = true) =
  if switch
    @crossterm_call crossterm_terminal_enable_raw_mode()
  else
    @crossterm_call crossterm_terminal_disable_raw_mode()
  end

scroll_down(n = 1) = @crossterm_call crossterm_terminal_scroll_down(n)
scroll_up(n = 1) = @crossterm_call crossterm_terminal_scroll_up(n)
function size(s::NamedTuple{(:x, :y),Tuple{Int64,Int64}})
  (; x, y) = s
  @crossterm_call crossterm_terminal_set_size(x, y)
end
function size()
  s = crossterm_TerminalSize()
  @crossterm_call crossterm_terminal_size(Ref(s))
  x = s.columns
  y = s.columns
  (; x, y)
end
title(t) = @crossterm_call crossterm_terminal_set_title(t)

bracketed_paste(switch = true) =
  if switch
    @crossterm_call crossterm_event_enable_bracketed_paste()
  else
    @crossterm_call crossterm_event_disable_bracketed_paste()
  end
focus_change(switch = true) =
  if switch
    @crossterm_call crossterm_event_enable_focus_change()
  else
    @crossterm_call crossterm_event_disable_focus_change()
  end
mouse_capture(switch = true) =
  if switch
    @crossterm_call crossterm_event_enable_mouse_capture()
  else
    @crossterm_call crossterm_event_disable_mouse_capture()
  end
function poll(duration::Period = Second(0))
  nanos_total = Nanosecond(duration).value
  secs = trunc(Int, nanos_total ÷ (10^9))
  nanos = trunc(Int, nanos_total % (10^9))
  result = LibCrossterm.crossterm_event_poll(secs, nanos)
  if result == -1
    throw(ErrorException("Error when calling crossterm_event_poll. $(last_error_message())"))
  end
  result != 0
end
keyboard_enchancement_flags(switch = true) =
  if switch
    @crossterm_call crossterm_event_push_keyboard_enhancement_flags()
  else
    @crossterm_call crossterm_event_pop_keyboard_enhancement_flags()
  end
function read()
  ptr = LibCrossterm.crossterm_event_read()
  s = unsafe_string(ptr)
  LibCrossterm.crossterm_free_c_char(ptr)
  s
end

blinking(switch = true) =
  if switch
    @crossterm_call crossterm_cursor_enable_blinking()
  else
    @crossterm_call crossterm_cursor_disable_blinking()
  end
hide() = @crossterm_call crossterm_cursor_hide()
down(rows = 1) = @crossterm_call crossterm_cursor_move_down(rows)
up(rows = 1) = @crossterm_call crossterm_cursor_move_up(rows)
left(columns = 1) = @crossterm_call crossterm_cursor_move_left(columns)
right(columns = 1) = @crossterm_call crossterm_cursor_move_right(columns)
column(column = 0) = @crossterm_call crossterm_cursor_move_to_column(column)
row(row = 0) = @crossterm_call crossterm_cursor_move_to_row(row)
to(; x, y) = @crossterm_call crossterm_cursor_moveto(x, y)
next(n = 1) = @crossterm_call crossterm_cursor_move_to_next_line(n)
prev(n = 1) = @crossterm_call crossterm_cursor_move_to_previous_line(n)
save() = @crossterm_call crossterm_cursor_save_position()
restore() = @crossterm_call crossterm_cursor_restore_position()

function position()
  p = LibCrossterm.crossterm_CursorPosition()
  @crossterm_call crossterm_get_cursor_position(Ref(p))
  (; x = Int(p.column), y = Int(p.row))
end

function position(p::NamedTuple{(:x, :y),Tuple{Int64,Int64}})
  (; x, y) = p
  p = LibCrossterm.crossterm_CursorPosition()
  p.column = x
  p.row = y
  @crossterm_call crossterm_set_cursor_position(p)
end

@enumx Style::UInt32 begin
  DEFAULT_USER_SHAPE = 0
  BLINKING_BLOCK = 1
  STEADY_BLOCK = 2
  BLINKING_UNDER_SCORE = 3
  STEADY_UNDER_SCORE = 4
  BLINKING_BAR = 5
  STEADY_BAR = 6
end
Base.cconvert(::Type{LibCrossterm.crossterm_CursorStyle}, v::Style.T) = LibCrossterm.crossterm_CursorStyle(UInt32(v))

style(s::Style.T) = @crossterm_call crossterm_cursor_set_style(s)
show() = @crossterm_call crossterm_cursor_show()

end
