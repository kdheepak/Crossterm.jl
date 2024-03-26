module Crossterm

using EnumX
using Dates
using JSON3

include("LibCrossterm.jl")

using .LibCrossterm

const COLOR_MAP = Dict(
  :reset => LibCrossterm.CROSSTERM_COLOR_RESET,
  :black => LibCrossterm.CROSSTERM_COLOR_BLACK,
  :dark_grey => LibCrossterm.CROSSTERM_COLOR_DARK_GREY,
  :red => LibCrossterm.CROSSTERM_COLOR_RED,
  :dark_red => LibCrossterm.CROSSTERM_COLOR_DARK_RED,
  :green => LibCrossterm.CROSSTERM_COLOR_GREEN,
  :dark_green => LibCrossterm.CROSSTERM_COLOR_DARK_GREEN,
  :yellow => LibCrossterm.CROSSTERM_COLOR_YELLOW,
  :dark_yellow => LibCrossterm.CROSSTERM_COLOR_DARK_YELLOW,
  :blue => LibCrossterm.CROSSTERM_COLOR_BLUE,
  :dark_blue => LibCrossterm.CROSSTERM_COLOR_DARK_BLUE,
  :magenta => LibCrossterm.CROSSTERM_COLOR_MAGENTA,
  :dark_magenta => LibCrossterm.CROSSTERM_COLOR_DARK_MAGENTA,
  :cyan => LibCrossterm.CROSSTERM_COLOR_CYAN,
  :dark_cyan => LibCrossterm.CROSSTERM_COLOR_DARK_CYAN,
  :white => LibCrossterm.CROSSTERM_COLOR_WHITE,
  :grey => LibCrossterm.CROSSTERM_COLOR_GREY,
)

macro crossterm_call(expr)
  s_expr = string(expr)
  esc(quote
    result = $(expr)
    if result != 0
      throw(ErrorException("Error occurred during `$($(s_expr))`: $(last_error_message())"))
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
line_wrap(switch::Bool = true) =
  if switch
    @crossterm_call crossterm_terminal_enable_line_wrap()
  else
    @crossterm_call crossterm_terminal_disable_line_wrap()
  end

"""
Enter or leave the alternate screen buffer of the terminal.
"""
alternate_screen(switch::Bool = true) =
  if switch
    @crossterm_call crossterm_terminal_enter_alternate_screen()
  else
    @crossterm_call crossterm_terminal_leave_alternate_screen()
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
Base.cconvert(::Type{LibCrossterm.crossterm_Attribute}, v::Attribute.T) = LibCrossterm.crossterm_Attribute(UInt32(v))

const ATTRIBUTES = Dict(
  :reset => Attribute.RESET,
  :bold => Attribute.BOLD,
  :dim => Attribute.DIM,
  :italic => Attribute.ITALIC,
  :underlined => Attribute.UNDERLINED,
  :double_underlined => Attribute.DOUBLE_UNDERLINED,
  :undercurled => Attribute.UNDERCURLED,
  :underdotted => Attribute.UNDERDOTTED,
  :underdashed => Attribute.UNDERDASHED,
  :slow_blink => Attribute.SLOW_BLINK,
  :rapid_blink => Attribute.RAPID_BLINK,
  :reverse => Attribute.REVERSE,
  :hidden => Attribute.HIDDEN,
  :crossed_out => Attribute.CROSSED_OUT,
  :fraktur => Attribute.FRAKTUR,
  :no_bold => Attribute.NO_BOLD,
  :normal_intensity => Attribute.NORMAL_INTENSITY,
  :no_italic => Attribute.NO_ITALIC,
  :no_underline => Attribute.NO_UNDERLINE,
  :no_blink => Attribute.NO_BLINK,
  :no_reverse => Attribute.NO_REVERSE,
  :no_hidden => Attribute.NO_HIDDEN,
  :not_crossed_out => Attribute.NOT_CROSSED_OUT,
  :framed => Attribute.FRAMED,
  :encircled => Attribute.ENCIRCLED,
  :over_lined => Attribute.OVER_LINED,
  :not_framed_or_encircled => Attribute.NOT_FRAMED_OR_ENCIRCLED,
  :not_over_lined => Attribute.NOT_OVER_LINED,
)

"""
Set the text attribute in the terminal.
"""
style(attr::Attribute.T) = @crossterm_call crossterm_style_attribute(attr)
function style(attr::Symbol = :reset)
  style(ATTRIBUTES[attr])
end

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

"""
Clear the terminal screen or a part of it.
"""
function clear(ct::ClearType.T = ClearType.ALL)
  @crossterm_call crossterm_terminal_clear(ct)
end

"""
Show or hide cursor in the terminal.
"""
cursor(switch::Bool = true) =
  if switch
    show()
  else
    hide()
  end

"""
Enable or disable raw mode in the terminal.
"""
raw_mode(switch::Bool = true) =
  if switch
    @crossterm_call crossterm_terminal_enable_raw_mode()
  else
    @crossterm_call crossterm_terminal_disable_raw_mode()
  end

"""
Scroll the terminal screen down by `n` lines.
"""
scroll_down(n::Integer = 1) = @crossterm_call crossterm_terminal_scroll_down(n)

"""
Scroll the terminal screen up by `n` lines.
"""
scroll_up(n::Integer = 1) = @crossterm_call crossterm_terminal_scroll_up(n)

"""
Set the size of the terminal.
"""
function size(s::NamedTuple{(:w, :h),Tuple{Int64,Int64}})
  (; w, h) = s
  @crossterm_call crossterm_terminal_size_set(w, h)
end

"""
Get the size of the terminal.
"""
function size()
  width = Ref{UInt16}(0)
  height = Ref{UInt16}(0)
  @crossterm_call crossterm_terminal_size(width, height)
  w = Int(width[])
  h = Int(height[])
  (; w, h)
end

"""
Set the title of the terminal.
"""
title(t::AbstractString) = @crossterm_call crossterm_terminal_title(t)

"""
Enable or disable bracketed paste mode in the terminal.
"""
bracketed_paste(switch::Bool = true) =
  if switch
    @crossterm_call crossterm_event_enable_bracketed_paste()
  else
    @crossterm_call crossterm_event_disable_bracketed_paste()
  end

"""
Enable or disable focus change event reporting in the terminal.
"""
focus_change(switch::Bool = true) =
  if switch
    @crossterm_call crossterm_event_enable_focus_change()
  else
    @crossterm_call crossterm_event_disable_focus_change()
  end

"""
Enable or disable mouse capture event reporting in the terminal.
"""
mouse_capture(switch::Bool = true) =
  if switch
    @crossterm_call crossterm_event_enable_mouse_capture()
  else
    @crossterm_call crossterm_event_disable_mouse_capture()
  end

"""
Poll the terminal for input events for duration (Dates.Period)
"""
function poll(duration::Period)
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
poll(duration::Number = 0) = poll(Nanosecond(round(duration * 1e9)))

"""
Push or pop the keyboard enhancement flags.
"""
enhance_keyboard(switch::Bool = true; flags = 0b0000_1000 | 0b0000_0100 | 0b0000_0010 | 0b0000_0001) =
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

struct ResizeEvent
  w::Int
  h::Int
end

_modifiers(value) = string.(split(value, '|'))
_state(value) = string.(split(value, '|'))

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
    code = if c isa Dict && only(keys(c)) == "Char"
      c["Char"]
    elseif c isa Dict && only(keys(c)) == "F"
      c = c["F"]
      "F$c"
    elseif c isa Dict && only(keys(c)) == "Modifier"
      c = c["Modifier"]
      c
    elseif c isa String
      c
    else
      @error "Unknown key $c"
      "UNKNOWN"
    end
    modifiers = _modifiers(data["modifiers"])
    kind = data["kind"]
    state = _state(data["state"])
    KeyEvent(code, modifiers, kind, state)
  elseif tag == EventTag.MOUSE
    kind = data["kind"]
    if kind isa Dict
      kind = "$(only(keys(kind)))$(only(values(kind)))"
    end
    column = data["column"]
    row = data["row"]
    modifiers = _modifiers(data["modifiers"])
    MouseEvent(kind, column, row, modifiers)
  elseif tag == EventTag.RESIZE
    ResizeEvent(data...)
  else
    data
  end
  Event(tag, data)
end

"""
Enable or disable cursor blinking in the terminal.
"""
blinking(switch::Bool = true) =
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
to(; x, y) = @crossterm_call crossterm_cursor_move_to(x, y)

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
  col = Ref{UInt16}(0)
  row = Ref{UInt16}(0)
  @crossterm_call crossterm_cursor_position(col, row)
  (; x = Int(col[]), y = Int(row[]))
end

"""
Set the position of the terminal cursor to `p` coordinates.
"""
function position(p::NamedTuple{(:x, :y),Tuple{Int64,Int64}})
  (; x, y) = p
  @crossterm_call crossterm_cursor_position_set(x, y)
end

"""
Set the position of the terminal cursor to `p` coordinates.
"""
function position(x, y)
  @crossterm_call crossterm_cursor_position_set(x, y)
end

"""
    CursorStyle

Different styles for the terminal cursor.
"""
@enumx CursorStyle::UInt32 begin
  DEFAULT_USER_SHAPE = 0
  BLINKING_BLOCK = 1
  STEADY_BLOCK = 2
  BLINKING_UNDER_SCORE = 3
  STEADY_UNDER_SCORE = 4
  BLINKING_BAR = 5
  STEADY_BAR = 6
end
Base.cconvert(::Type{LibCrossterm.crossterm_CursorStyle}, v::CursorStyle.T) = LibCrossterm.crossterm_CursorStyle(UInt32(v))

"""
Set the style of the terminal cursor.
"""
cursor_style(s::CursorStyle.T) = @crossterm_call crossterm_cursor_style(s)

"""
Flush the stdout stream
"""
flush() = @crossterm_call crossterm_flush()

function color(color::Symbol)
  data = zeros(UInt8, 8)
  color_tag = get(COLOR_MAP, color, nothing)
  if isnothing(color_tag)
    error("Invalid color name: $color")
  end
  data[1] = UInt8(color_tag)
  return LibCrossterm.crossterm_Color(tuple(data...))
end

function color(rgb::NamedTuple{(:r, :g, :b),Tuple{UInt8,UInt8,UInt8}})
  (; r, g, b) = rgb
  data = zeros(UInt8, 8)
  data[1] = UInt8(LibCrossterm.CROSSTERM_COLOR_RGB)
  data[5] = r
  data[6] = g
  data[7] = b
  return LibCrossterm.crossterm_Color(tuple(data...))
end

function color(ansi::UInt8)
  data = zeros(UInt8, 8)
  data[1] = UInt8(LibCrossterm.CROSSTERM_COLOR_ANSI_VALUE)
  data[5] = ansi
  return LibCrossterm.crossterm_Color(tuple(data...))
end

"""
Set background color
"""
background(c = :reset) = @crossterm_call crossterm_style_background_color(color(c))

"""
Set foreground color
"""
foreground(c = :reset) = @crossterm_call crossterm_style_foreground_color(color(c))

"""
Set underline color
"""
underline(c = :reset) = @crossterm_call crossterm_style_underline_color(color(c))

"""
Print to stdout
"""
print(s::String) = @crossterm_call crossterm_style_print(s)

"""
Print to stdout
"""
print(s::Char) = @crossterm_call crossterm_style_print_char(s)

bell() = @crossterm_call crossterm_terminal_ring_bell()

"""
Use stdout or stderr for all commands.
"""
stderr(stderr::Bool = true) =
  if stderr
    crossterm_use_stdout()
  else
    crossterm_use_stderr()
  end
end
