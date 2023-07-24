module Crossterm

using EnumX
using Dates
using JSON3

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
Return the most recent error message from the crossterm library.
"""
function last_error_message()
  ptr = LibCrossterm.crossterm_last_error_message()
  s = unsafe_string(ptr)
  LibCrossterm.crossterm_free_c_char(ptr)
  s
end

"""
Clear the last error message stored by the crossterm library.
"""
clear_last_error() = LibCrossterm.crossterm_clear_last_error()

"""
Enable or disable line wrapping in the terminal.
"""
line_wrap(switch = true) =
  if switch
    @crossterm_call crossterm_enable_line_wrap()
  else
    @crossterm_call crossterm_disable_line_wrap()
  end

"""
Enter or leave the alternate screen buffer of the terminal.
"""
alternate_screen(switch = true) =
  if switch
    @crossterm_call crossterm_enter_alternate_screen()
  else
    @crossterm_call crossterm_leave_alternate_screen()
  end

"""
Reset terminal colors to default.
"""
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

"""
Set the text attribute in the terminal.
"""
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

"""
Clear the terminal screen or a part of it.
"""
function clear(ct::ClearType.T = ClearType.ALL)
  @crossterm_call crossterm_terminal_clear(ct)
end

"""
Enable or disable raw mode in the terminal.
"""
raw_mode(switch = true) =
  if switch
    @crossterm_call crossterm_terminal_enable_raw_mode()
  else
    @crossterm_call crossterm_terminal_disable_raw_mode()
  end

"""
Scroll the terminal screen down by `n` lines.
"""
scroll_down(n = 1) = @crossterm_call crossterm_terminal_scroll_down(n)

"""
Scroll the terminal screen up by `n` lines.
"""
scroll_up(n = 1) = @crossterm_call crossterm_terminal_scroll_up(n)

"""
Set the size of the terminal.
"""
function size(s::NamedTuple{(:x, :y),Tuple{Int64,Int64}})
  (; x, y) = s
  @crossterm_call crossterm_terminal_set_size(x, y)
end

"""
Get the size of the terminal.
"""
function size()
  s = crossterm_TerminalSize(0, 0)
  @crossterm_call crossterm_terminal_size(Ref(s))
  x = Int(s.width)
  y = Int(s.height)
  (; x, y)
end

"""
Set the title of the terminal.
"""
title(t) = @crossterm_call crossterm_terminal_set_title(t)

"""
Enable or disable bracketed paste mode in the terminal.
"""
bracketed_paste(switch = true) =
  if switch
    @crossterm_call crossterm_event_enable_bracketed_paste()
  else
    @crossterm_call crossterm_event_disable_bracketed_paste()
  end

"""
Enable or disable focus change event reporting in the terminal.
"""
focus_change(switch = true) =
  if switch
    @crossterm_call crossterm_event_enable_focus_change()
  else
    @crossterm_call crossterm_event_disable_focus_change()
  end

"""
Enable or disable mouse capture event reporting in the terminal.
"""
mouse_capture(switch = true) =
  if switch
    @crossterm_call crossterm_event_enable_mouse_capture()
  else
    @crossterm_call crossterm_event_disable_mouse_capture()
  end

"""
Poll the terminal for input events for duration (Dates.Period)
"""
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
"""
Poll the terminal for input events for duration (seconds)
"""
poll(duration::Integer) = poll(Second(duration))

"""
Push or pop the keyboard enhancement flags.
"""
keyboard_enhancement_flags(switch = true; flags = 0b0000_1000 | 0b0000_0100 | 0b0000_0010 | 0b0000_0001) =
  if switch
    @crossterm_call crossterm_event_push_keyboard_enhancement_flags(flags)
  else
    @crossterm_call crossterm_event_pop_keyboard_enhancement_flags()
  end

@enumx EventTag::UInt32 begin
  FOCUS_GAINED = 0
  FOCUS_LOST = 1
  KEY = 2
  MOUSE = 3
  PASTE = 4
  RESIZE = 5
end

function EventTag.T(tag::String)
  if tag == "Key"
    EventTag.KEY
  elseif tag == "Mouse"
    EventTag.MOUSE
  elseif tag == "FocusLost"
    EventTag.FOCUS_LOST
  elseif tag == "FocusGained"
    EventTag.FOCUS_GAINED
  elseif tag == "Paste"
    EventTag.PASTE
  elseif tag == "Resize"
    EventTag.RESIZE
  end
end

struct Event{T}
  tag::EventTag.T
  data::T
end

struct MouseEvent
  kind::String
  column::Int
  row::Int
  modifiers::Vector{String}
end

struct KeyEvent
  code::String
  modifiers::Vector{String}
  kind::String
  state::Vector{String}
end

function _modifiers(value)
  SHIFT = 1
  CONTROL = 2
  ALT = 4
  SUPER = 8
  HYPER = 16
  META = 32
  NONE = 0
  modifiers = Dict("SHIFT" => SHIFT, "CONTROL" => CONTROL, "ALT" => ALT, "SUPER" => SUPER, "HYPER" => HYPER, "META" => META)

  active_modifiers = String[]

  for (modifier, bit_value) in modifiers
    if value & bit_value == bit_value
      push!(active_modifiers, modifier)
    end
  end

  return active_modifiers
end

function _state(value)
  KEYPAD = 1
  CAPS_LOCK = 8
  NUM_LOCK = 8
  NONE = 0

  event_states = Dict("KEYPAD" => KEYPAD, "CAPS_LOCK" => CAPS_LOCK, "NUM_LOCK" => NUM_LOCK)

  active_states = String[]

  for (event_state, bit_value) in event_states
    if value & bit_value == bit_value
      push!(active_states, event_state)
    end
  end

  return active_states
end

"""
Read an event from the terminal.
"""
function read()
  ptr = LibCrossterm.crossterm_event_read()
  s = unsafe_string(ptr)
  LibCrossterm.crossterm_free_c_char(ptr)
  d = JSON3.read(s, Dict)
  tag = EventTag.T(only(keys(d)))
  data = only(values(d))
  data = if tag == EventTag.KEY
    c = data["code"]
    @show data
    code = if c isa Dict && only(keys(c)) == "Char"
      c["Char"]
    elseif c isa Dict && only(keys(c)) == "F"
      c = c["F"]
      "F$c"
    else
      c
    end
    modifiers = _modifiers(data["modifiers"]["bits"])
    kind = data["kind"]
    state = _state(data["state"]["bits"])
    KeyEvent(code, modifiers, kind, state)
  elseif tag == EventTag.MOUSE
    kind = data["kind"]
    if kind isa Dict
      kind = "$(only(keys(kind)))$(only(values(kind)))"
    end
    column = data["column"]
    row = data["row"]
    modifiers = _modifiers(data["modifiers"]["bits"])
    MouseEvent(kind, column, row, modifiers)
  else
    data
  end
  Event(tag, data)
end

"""
Enable or disable cursor blinking in the terminal.
"""
blinking(switch = true) =
  if switch
    @crossterm_call crossterm_cursor_enable_blinking()
  else
    @crossterm_call crossterm_cursor_disable_blinking()
  end

"""
Show the terminal cursor.
"""
show() = @crossterm_call crossterm_cursor_show()

"""
Hide the terminal cursor.
"""
hide() = @crossterm_call crossterm_cursor_hide()

"""
Move the terminal cursor down by `rows` number of rows.
"""
down(rows = 1) = @crossterm_call crossterm_cursor_move_down(rows)

"""
Move the terminal cursor up by `rows` number of rows.
"""
up(rows = 1) = @crossterm_call crossterm_cursor_move_up(rows)

"""
Move the terminal cursor left by `columns` number of columns.
"""
left(columns = 1) = @crossterm_call crossterm_cursor_move_left(columns)

"""
Move the terminal cursor right by `columns` number of columns.
"""
right(columns = 1) = @crossterm_call crossterm_cursor_move_right(columns)

"""
Move the terminal cursor to the `column`.
"""
column(column = 0) = @crossterm_call crossterm_cursor_move_to_column(column)

"""
Move the terminal cursor to the `row`.
"""
row(row = 0) = @crossterm_call crossterm_cursor_move_to_row(row)

"""
Move the terminal cursor to the specified (x, y) coordinates.
"""
to(; x, y) = @crossterm_call crossterm_cursor_moveto(x, y)

"""
Move the terminal cursor to the next line `n` times.
"""
next(n = 1) = @crossterm_call crossterm_cursor_move_to_next_line(n)

"""
Move the terminal cursor to the previous line `n` times.
"""
prev(n = 1) = @crossterm_call crossterm_cursor_move_to_previous_line(n)

"""
Save the current position of the terminal cursor.
"""
save() = @crossterm_call crossterm_cursor_save_position()

"""
Restore the terminal cursor to the last saved position.
"""
restore() = @crossterm_call crossterm_cursor_restore_position()

"""
Get the current position of the terminal cursor.
"""
function position()
  p = LibCrossterm.crossterm_CursorPosition(0, 0)
  @crossterm_call crossterm_cursor_position_get(Ref(p))
  (; x = Int(p.column), y = Int(p.row))
end

"""
Set the position of the terminal cursor to `p` coordinates.
"""
function position(p::NamedTuple{(:x, :y),Tuple{Int64,Int64}})
  (; x, y) = p
  p = LibCrossterm.crossterm_CursorPosition(x, y)
  @crossterm_call crossterm_cursor_position_set(p)
end

"""
    Style

Different styles for the terminal cursor.
"""
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

"""
Set the style of the terminal cursor.
"""
style(s::Style.T) = @crossterm_call crossterm_cursor_set_style(s)

end