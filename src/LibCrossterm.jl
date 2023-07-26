module LibCrossterm

using libcrossterm_jll
export libcrossterm_jll

"""
    crossterm_KeyModifiers

Represents key modifiers (shift, control, alt, etc.).

**Note:** `SUPER`, `HYPER`, and `META` can only be read if [`KeyboardEnhancementFlags::DISAMBIGUATE\\_ESCAPE\\_CODES`] has been enabled with [`PushKeyboardEnhancementFlags`].
"""
mutable struct crossterm_KeyModifiers
  bits::UInt8
end

"""
    crossterm_KeyEventState

Represents extra state about the key event.

**Note:** This state can only be read if [`KeyboardEnhancementFlags::DISAMBIGUATE\\_ESCAPE\\_CODES`] has been enabled with [[`crossterm_event_push_keyboard_enhancement_flags`](@ref)].
"""
mutable struct crossterm_KeyEventState
  bits::UInt8
end

@enum crossterm_Attribute::UInt32 begin
  CROSSTERM_ATTRIBUTE_RESET = 0
  CROSSTERM_ATTRIBUTE_BOLD = 1
  CROSSTERM_ATTRIBUTE_DIM = 2
  CROSSTERM_ATTRIBUTE_ITALIC = 3
  CROSSTERM_ATTRIBUTE_UNDERLINED = 4
  CROSSTERM_ATTRIBUTE_DOUBLE_UNDERLINED = 5
  CROSSTERM_ATTRIBUTE_UNDERCURLED = 6
  CROSSTERM_ATTRIBUTE_UNDERDOTTED = 7
  CROSSTERM_ATTRIBUTE_UNDERDASHED = 8
  CROSSTERM_ATTRIBUTE_SLOW_BLINK = 9
  CROSSTERM_ATTRIBUTE_RAPID_BLINK = 10
  CROSSTERM_ATTRIBUTE_REVERSE = 11
  CROSSTERM_ATTRIBUTE_HIDDEN = 12
  CROSSTERM_ATTRIBUTE_CROSSED_OUT = 13
  CROSSTERM_ATTRIBUTE_FRAKTUR = 14
  CROSSTERM_ATTRIBUTE_NO_BOLD = 15
  CROSSTERM_ATTRIBUTE_NORMAL_INTENSITY = 16
  CROSSTERM_ATTRIBUTE_NO_ITALIC = 17
  CROSSTERM_ATTRIBUTE_NO_UNDERLINE = 18
  CROSSTERM_ATTRIBUTE_NO_BLINK = 19
  CROSSTERM_ATTRIBUTE_NO_REVERSE = 20
  CROSSTERM_ATTRIBUTE_NO_HIDDEN = 21
  CROSSTERM_ATTRIBUTE_NOT_CROSSED_OUT = 22
  CROSSTERM_ATTRIBUTE_FRAMED = 23
  CROSSTERM_ATTRIBUTE_ENCIRCLED = 24
  CROSSTERM_ATTRIBUTE_OVER_LINED = 25
  CROSSTERM_ATTRIBUTE_NOT_FRAMED_OR_ENCIRCLED = 26
  CROSSTERM_ATTRIBUTE_NOT_OVER_LINED = 27
end

"""
    crossterm_ClearType

Different ways to clear the terminal buffer.
"""
@enum crossterm_ClearType::UInt32 begin
  CROSSTERM_CLEAR_TYPE_ALL = 0
  CROSSTERM_CLEAR_TYPE_PURGE = 1
  CROSSTERM_CLEAR_TYPE_FROM_CURSOR_DOWN = 2
  CROSSTERM_CLEAR_TYPE_FROM_CURSOR_UP = 3
  CROSSTERM_CLEAR_TYPE_CURRENT_LINE = 4
  CROSSTERM_CLEAR_TYPE_UNTIL_NEW_LINE = 5
end

"""
    crossterm_CursorStyle

Style of the cursor. It uses two types of escape codes, one to control blinking, and the other the shape.
"""
@enum crossterm_CursorStyle::UInt32 begin
  CROSSTERM_CURSOR_STYLE_DEFAULT_USER_SHAPE = 0
  CROSSTERM_CURSOR_STYLE_BLINKING_BLOCK = 1
  CROSSTERM_CURSOR_STYLE_STEADY_BLOCK = 2
  CROSSTERM_CURSOR_STYLE_BLINKING_UNDER_SCORE = 3
  CROSSTERM_CURSOR_STYLE_STEADY_UNDER_SCORE = 4
  CROSSTERM_CURSOR_STYLE_BLINKING_BAR = 5
  CROSSTERM_CURSOR_STYLE_STEADY_BAR = 6
end

"""
    crossterm_KeyEventKind

Represents a keyboard event kind.
"""
@enum crossterm_KeyEventKind::UInt32 begin
  CROSSTERM_KEY_EVENT_KIND_PRESS = 0
  CROSSTERM_KEY_EVENT_KIND_REPEAT = 1
  CROSSTERM_KEY_EVENT_KIND_RELEASE = 2
end

"""
    crossterm_MediaKeyCode

Represents a media key (as part of [`KeyCode::Media`]).
"""
@enum crossterm_MediaKeyCode::UInt32 begin
  CROSSTERM_MEDIA_KEY_CODE_PLAY = 0
  CROSSTERM_MEDIA_KEY_CODE_PAUSE = 1
  CROSSTERM_MEDIA_KEY_CODE_PLAY_PAUSE = 2
  CROSSTERM_MEDIA_KEY_CODE_REVERSE = 3
  CROSSTERM_MEDIA_KEY_CODE_STOP = 4
  CROSSTERM_MEDIA_KEY_CODE_FAST_FORWARD = 5
  CROSSTERM_MEDIA_KEY_CODE_REWIND = 6
  CROSSTERM_MEDIA_KEY_CODE_TRACK_NEXT = 7
  CROSSTERM_MEDIA_KEY_CODE_TRACK_PREVIOUS = 8
  CROSSTERM_MEDIA_KEY_CODE_RECORD = 9
  CROSSTERM_MEDIA_KEY_CODE_LOWER_VOLUME = 10
  CROSSTERM_MEDIA_KEY_CODE_RAISE_VOLUME = 11
  CROSSTERM_MEDIA_KEY_CODE_MUTE_VOLUME = 12
end

"""
    crossterm_ModifierKeyCode

Represents a modifier key (as part of [`KeyCode::Modifier`]).
"""
@enum crossterm_ModifierKeyCode::UInt32 begin
  CROSSTERM_MODIFIER_KEY_CODE_LEFT_SHIFT = 0
  CROSSTERM_MODIFIER_KEY_CODE_LEFT_CONTROL = 1
  CROSSTERM_MODIFIER_KEY_CODE_LEFT_ALT = 2
  CROSSTERM_MODIFIER_KEY_CODE_LEFT_SUPER = 3
  CROSSTERM_MODIFIER_KEY_CODE_LEFT_HYPER = 4
  CROSSTERM_MODIFIER_KEY_CODE_LEFT_META = 5
  CROSSTERM_MODIFIER_KEY_CODE_RIGHT_SHIFT = 6
  CROSSTERM_MODIFIER_KEY_CODE_RIGHT_CONTROL = 7
  CROSSTERM_MODIFIER_KEY_CODE_RIGHT_ALT = 8
  CROSSTERM_MODIFIER_KEY_CODE_RIGHT_SUPER = 9
  CROSSTERM_MODIFIER_KEY_CODE_RIGHT_HYPER = 10
  CROSSTERM_MODIFIER_KEY_CODE_RIGHT_META = 11
  CROSSTERM_MODIFIER_KEY_CODE_ISO_LEVEL3_SHIFT = 12
  CROSSTERM_MODIFIER_KEY_CODE_ISO_LEVEL5_SHIFT = 13
end

"""
    crossterm_MouseButton

Represents a mouse button.
"""
@enum crossterm_MouseButton::UInt32 begin
  CROSSTERM_MOUSE_BUTTON_LEFT = 0
  CROSSTERM_MOUSE_BUTTON_RIGHT = 1
  CROSSTERM_MOUSE_BUTTON_MIDDLE = 2
end

@enum crossterm_Color_Tag::UInt32 begin
  CROSSTERM_COLOR_RESET = 0
  CROSSTERM_COLOR_BLACK = 1
  CROSSTERM_COLOR_DARK_GREY = 2
  CROSSTERM_COLOR_RED = 3
  CROSSTERM_COLOR_DARK_RED = 4
  CROSSTERM_COLOR_GREEN = 5
  CROSSTERM_COLOR_DARK_GREEN = 6
  CROSSTERM_COLOR_YELLOW = 7
  CROSSTERM_COLOR_DARK_YELLOW = 8
  CROSSTERM_COLOR_BLUE = 9
  CROSSTERM_COLOR_DARK_BLUE = 10
  CROSSTERM_COLOR_MAGENTA = 11
  CROSSTERM_COLOR_DARK_MAGENTA = 12
  CROSSTERM_COLOR_CYAN = 13
  CROSSTERM_COLOR_DARK_CYAN = 14
  CROSSTERM_COLOR_WHITE = 15
  CROSSTERM_COLOR_GREY = 16
  CROSSTERM_COLOR_RGB = 17
  CROSSTERM_COLOR_ANSI_VALUE = 18
end

mutable struct crossterm_Rgb_Body
  r::UInt8
  g::UInt8
  b::UInt8
end

struct crossterm_Color
  data::NTuple{8,UInt8}
end

function Base.getproperty(x::Ptr{crossterm_Color}, f::Symbol)
  f === :tag && return Ptr{crossterm_Color_Tag}(x + 0)
  f === :RGB && return Ptr{crossterm_Rgb_Body}(x + 4)
  f === :ansi_value && return Ptr{UInt8}(x + 4)
  return getfield(x, f)
end

function Base.getproperty(x::crossterm_Color, f::Symbol)
  r = Ref{crossterm_Color}(x)
  ptr = Base.unsafe_convert(Ptr{crossterm_Color}, r)
  fptr = getproperty(ptr, f)
  GC.@preserve r unsafe_load(fptr)
end

function Base.setproperty!(x::Ptr{crossterm_Color}, f::Symbol, v)
  unsafe_store!(getproperty(x, f), v)
end

"""
    crossterm_KeyCode_Tag

Represents a key.
"""
@enum crossterm_KeyCode_Tag::UInt32 begin
  CROSSTERM_KEY_CODE_BACKSPACE = 0
  CROSSTERM_KEY_CODE_ENTER = 1
  CROSSTERM_KEY_CODE_LEFT = 2
  CROSSTERM_KEY_CODE_RIGHT = 3
  CROSSTERM_KEY_CODE_UP = 4
  CROSSTERM_KEY_CODE_DOWN = 5
  CROSSTERM_KEY_CODE_HOME = 6
  CROSSTERM_KEY_CODE_END = 7
  CROSSTERM_KEY_CODE_PAGE_UP = 8
  CROSSTERM_KEY_CODE_PAGE_DOWN = 9
  CROSSTERM_KEY_CODE_TAB = 10
  CROSSTERM_KEY_CODE_BACK_TAB = 11
  CROSSTERM_KEY_CODE_DELETE = 12
  CROSSTERM_KEY_CODE_INSERT = 13
  CROSSTERM_KEY_CODE_F = 14
  CROSSTERM_KEY_CODE_CHAR = 15
  CROSSTERM_KEY_CODE_NULL = 16
  CROSSTERM_KEY_CODE_ESC = 17
  CROSSTERM_KEY_CODE_CAPS_LOCK = 18
  CROSSTERM_KEY_CODE_SCROLL_LOCK = 19
  CROSSTERM_KEY_CODE_NUM_LOCK = 20
  CROSSTERM_KEY_CODE_PRINT_SCREEN = 21
  CROSSTERM_KEY_CODE_PAUSE = 22
  CROSSTERM_KEY_CODE_MENU = 23
  CROSSTERM_KEY_CODE_KEYPAD_BEGIN = 24
  CROSSTERM_KEY_CODE_MEDIA = 25
  CROSSTERM_KEY_CODE_MODIFIER = 26
end

struct crossterm_KeyCode
  data::NTuple{8,UInt8}
end

function Base.getproperty(x::Ptr{crossterm_KeyCode}, f::Symbol)
  f === :tag && return Ptr{crossterm_KeyCode_Tag}(x + 0)
  f === :f && return Ptr{UInt8}(x + 4)
  f === :char_ && return Ptr{UInt32}(x + 4)
  f === :media && return Ptr{crossterm_MediaKeyCode}(x + 4)
  f === :modifier && return Ptr{crossterm_ModifierKeyCode}(x + 4)
  return getfield(x, f)
end

function Base.getproperty(x::crossterm_KeyCode, f::Symbol)
  r = Ref{crossterm_KeyCode}(x)
  ptr = Base.unsafe_convert(Ptr{crossterm_KeyCode}, r)
  fptr = getproperty(ptr, f)
  GC.@preserve r unsafe_load(fptr)
end

function Base.setproperty!(x::Ptr{crossterm_KeyCode}, f::Symbol, v)
  unsafe_store!(getproperty(x, f), v)
end

"""
    crossterm_KeyEvent

Represents a key event.
"""
mutable struct crossterm_KeyEvent
  code::crossterm_KeyCode
  modifiers::crossterm_KeyModifiers
  kind::crossterm_KeyEventKind
  state::crossterm_KeyEventState
end

"""
    crossterm_MouseEventKind_Tag

A mouse event kind.

# Platform-specific Notes

## Mouse Buttons

Some platforms/terminals do not report mouse button for the `MouseEventKind::Up` and `MouseEventKind::Drag` events. `MouseButton::Left` is returned if we don't know which button was used.
"""
@enum crossterm_MouseEventKind_Tag::UInt32 begin
  CROSSTERM_MOUSE_EVENT_KIND_DOWN = 0
  CROSSTERM_MOUSE_EVENT_KIND_UP = 1
  CROSSTERM_MOUSE_EVENT_KIND_DRAG = 2
  CROSSTERM_MOUSE_EVENT_KIND_MOVED = 3
  CROSSTERM_MOUSE_EVENT_KIND_SCROLL_DOWN = 4
  CROSSTERM_MOUSE_EVENT_KIND_SCROLL_UP = 5
end

struct crossterm_MouseEventKind
  data::NTuple{8,UInt8}
end

function Base.getproperty(x::Ptr{crossterm_MouseEventKind}, f::Symbol)
  f === :tag && return Ptr{crossterm_MouseEventKind_Tag}(x + 0)
  f === :down && return Ptr{crossterm_MouseButton}(x + 4)
  f === :up && return Ptr{crossterm_MouseButton}(x + 4)
  f === :drag && return Ptr{crossterm_MouseButton}(x + 4)
  return getfield(x, f)
end

function Base.getproperty(x::crossterm_MouseEventKind, f::Symbol)
  r = Ref{crossterm_MouseEventKind}(x)
  ptr = Base.unsafe_convert(Ptr{crossterm_MouseEventKind}, r)
  fptr = getproperty(ptr, f)
  GC.@preserve r unsafe_load(fptr)
end

function Base.setproperty!(x::Ptr{crossterm_MouseEventKind}, f::Symbol, v)
  unsafe_store!(getproperty(x, f), v)
end

"""
    crossterm_MouseEvent

Represents a mouse event.

# Platform-specific Notes

## Mouse Buttons

Some platforms/terminals do not report mouse button for the `MouseEventKind::Up` and `MouseEventKind::Drag` events. `MouseButton::Left` is returned if we don't know which button was used.

## Key Modifiers

Some platforms/terminals does not report all key modifiers combinations for all mouse event types. For example - macOS reports `Ctrl` + left mouse button click as a right mouse button click.
"""
mutable struct crossterm_MouseEvent
  kind::crossterm_MouseEventKind
  col::UInt16
  row::UInt16
  modifiers::crossterm_KeyModifiers
end

"""
    crossterm_Event_Tag

Represents an event.
"""
@enum crossterm_Event_Tag::UInt32 begin
  CROSSTERM_EVENT_FOCUS_GAINED = 0
  CROSSTERM_EVENT_FOCUS_LOST = 1
  CROSSTERM_EVENT_KEY = 2
  CROSSTERM_EVENT_MOUSE = 3
  CROSSTERM_EVENT_PASTE = 4
  CROSSTERM_EVENT_RESIZE = 5
end

mutable struct crossterm_Resize_Body
  _0::UInt16
  _1::UInt16
end

struct crossterm_Event
  data::NTuple{32,UInt8}
end

function Base.getproperty(x::Ptr{crossterm_Event}, f::Symbol)
  f === :tag && return Ptr{crossterm_Event_Tag}(x + 0)
  f === :key && return Ptr{crossterm_KeyEvent}(x + 8)
  f === :mouse && return Ptr{crossterm_MouseEvent}(x + 8)
  f === :paste && return Ptr{Ptr{Cchar}}(x + 8)
  f === :RESIZE && return Ptr{crossterm_Resize_Body}(x + 8)
  return getfield(x, f)
end

function Base.getproperty(x::crossterm_Event, f::Symbol)
  r = Ref{crossterm_Event}(x)
  ptr = Base.unsafe_convert(Ptr{crossterm_Event}, r)
  fptr = getproperty(ptr, f)
  GC.@preserve r unsafe_load(fptr)
end

function Base.setproperty!(x::Ptr{crossterm_Event}, f::Symbol, v)
  unsafe_store!(getproperty(x, f), v)
end

function crossterm_clear_last_error()
  @ccall libcrossterm.crossterm_clear_last_error()::Cvoid
end

"""
    crossterm_colors()

Returns colors as a UTF-8 JSON string.

Null character is stored in the last location of buffer. Caller is responsible for memory associated with string buffer. Use [[`crossterm_free_c_char`](@ref)] to free data.
"""
function crossterm_colors()
  @ccall libcrossterm.crossterm_colors()::Ptr{Cchar}
end

"""
    crossterm_cursor_disable_blinking()

Disables blinking of the terminal cursor.
"""
function crossterm_cursor_disable_blinking()
  @ccall libcrossterm.crossterm_cursor_disable_blinking()::Cint
end

"""
    crossterm_cursor_enable_blinking()

Enables blinking of the terminal cursor.
"""
function crossterm_cursor_enable_blinking()
  @ccall libcrossterm.crossterm_cursor_enable_blinking()::Cint
end

"""
    crossterm_cursor_hide()

Hides the terminal cursor.
"""
function crossterm_cursor_hide()
  @ccall libcrossterm.crossterm_cursor_hide()::Cint
end

"""
    crossterm_cursor_move_down(rows)

Moves the terminal cursor a given number of rows down.
"""
function crossterm_cursor_move_down(rows)
  @ccall libcrossterm.crossterm_cursor_move_down(rows::UInt16)::Cint
end

"""
    crossterm_cursor_move_left(cols)

Moves the terminal cursor a given number of cols to the left.
"""
function crossterm_cursor_move_left(cols)
  @ccall libcrossterm.crossterm_cursor_move_left(cols::UInt16)::Cint
end

"""
    crossterm_cursor_move_right(cols)

Moves the terminal cursor a given number of cols to the right.
"""
function crossterm_cursor_move_right(cols)
  @ccall libcrossterm.crossterm_cursor_move_right(cols::UInt16)::Cint
end

"""
    crossterm_cursor_move_to(col, row)

Moves the terminal cursor to the given position (col, row).

# Notes * Top left cell is represented as `0,0`.
"""
function crossterm_cursor_move_to(col, row)
  @ccall libcrossterm.crossterm_cursor_move_to(col::UInt16, row::UInt16)::Cint
end

"""
    crossterm_cursor_move_to_column(col)

Moves the terminal cursor to the given col on the current row.
"""
function crossterm_cursor_move_to_column(col)
  @ccall libcrossterm.crossterm_cursor_move_to_column(col::UInt16)::Cint
end

"""
    crossterm_cursor_move_to_next_line(n)

Moves the terminal cursor down the given number of lines and moves it to the first col.

# Notes * This command is 1 based, meaning `[`crossterm_cursor_move_to_next_line`](@ref)(1)` moves to the next line. * Most terminals default 0 argument to 1.
"""
function crossterm_cursor_move_to_next_line(n)
  @ccall libcrossterm.crossterm_cursor_move_to_next_line(n::UInt16)::Cint
end

"""
    crossterm_cursor_move_to_previous_line(n)

Moves the terminal cursor up the given number of lines and moves it to the first col.
"""
function crossterm_cursor_move_to_previous_line(n)
  @ccall libcrossterm.crossterm_cursor_move_to_previous_line(n::UInt16)::Cint
end

"""
    crossterm_cursor_move_to_row(row)

Moves the terminal cursor to the given row on the current col.
"""
function crossterm_cursor_move_to_row(row)
  @ccall libcrossterm.crossterm_cursor_move_to_row(row::UInt16)::Cint
end

"""
    crossterm_cursor_move_up(rows)

Moves the terminal cursor a given number of rows up.
"""
function crossterm_cursor_move_up(rows)
  @ccall libcrossterm.crossterm_cursor_move_up(rows::UInt16)::Cint
end

"""
    crossterm_cursor_position(col, row)

Get cursor position (col, row)

# Notes * Top left cell is represented as `0,0`.
"""
function crossterm_cursor_position(col, row)
  @ccall libcrossterm.crossterm_cursor_position(col::Ptr{UInt16}, row::Ptr{UInt16})::Cint
end

"""
    crossterm_cursor_position_set(col, row)

Set cursor position (col, row)

# Notes * Top left cell is represented as `0,0`.
"""
function crossterm_cursor_position_set(col, row)
  @ccall libcrossterm.crossterm_cursor_position_set(col::UInt16, row::UInt16)::Cint
end

"""
    crossterm_cursor_restore_position()

Restores the saved terminal cursor position.
"""
function crossterm_cursor_restore_position()
  @ccall libcrossterm.crossterm_cursor_restore_position()::Cint
end

"""
    crossterm_cursor_save_position()

Saves the current terminal cursor position.
"""
function crossterm_cursor_save_position()
  @ccall libcrossterm.crossterm_cursor_save_position()::Cint
end

"""
    crossterm_cursor_show()

Shows the terminal cursor.
"""
function crossterm_cursor_show()
  @ccall libcrossterm.crossterm_cursor_show()::Cint
end

"""
    crossterm_cursor_style(cursor_style)

Sets the style of the cursor.
"""
function crossterm_cursor_style(cursor_style)
  @ccall libcrossterm.crossterm_cursor_style(cursor_style::crossterm_CursorStyle)::Cint
end

"""
    crossterm_cursor_style_blinking_bar()

Sets the style of the cursor to a blinking bar.
"""
function crossterm_cursor_style_blinking_bar()
  @ccall libcrossterm.crossterm_cursor_style_blinking_bar()::Cint
end

"""
    crossterm_cursor_style_blinking_block()

Sets the style of the cursor to a blinking block.
"""
function crossterm_cursor_style_blinking_block()
  @ccall libcrossterm.crossterm_cursor_style_blinking_block()::Cint
end

"""
    crossterm_cursor_style_blinking_underscore()

Sets the style of the cursor to a blinking underscore.
"""
function crossterm_cursor_style_blinking_underscore()
  @ccall libcrossterm.crossterm_cursor_style_blinking_underscore()::Cint
end

"""
    crossterm_cursor_style_default_user_shape()

Sets the style of the cursor to default user shape.
"""
function crossterm_cursor_style_default_user_shape()
  @ccall libcrossterm.crossterm_cursor_style_default_user_shape()::Cint
end

"""
    crossterm_cursor_style_steady_bar()

Sets the style of the cursor to a steady bar.
"""
function crossterm_cursor_style_steady_bar()
  @ccall libcrossterm.crossterm_cursor_style_steady_bar()::Cint
end

"""
    crossterm_cursor_style_steady_block()

Sets the style of the cursor to a steady block.
"""
function crossterm_cursor_style_steady_block()
  @ccall libcrossterm.crossterm_cursor_style_steady_block()::Cint
end

"""
    crossterm_cursor_style_steady_underscore()

Sets the style of the cursor to a steady underscore.
"""
function crossterm_cursor_style_steady_underscore()
  @ccall libcrossterm.crossterm_cursor_style_steady_underscore()::Cint
end

"""
    crossterm_event_disable_bracketed_paste()

Disables bracketed paste mode.
"""
function crossterm_event_disable_bracketed_paste()
  @ccall libcrossterm.crossterm_event_disable_bracketed_paste()::Cint
end

"""
    crossterm_event_disable_focus_change()

Disable focus event emission.
"""
function crossterm_event_disable_focus_change()
  @ccall libcrossterm.crossterm_event_disable_focus_change()::Cint
end

"""
    crossterm_event_disable_mouse_capture()

Disable mouse event capturing.
"""
function crossterm_event_disable_mouse_capture()
  @ccall libcrossterm.crossterm_event_disable_mouse_capture()::Cint
end

"""
    crossterm_event_enable_bracketed_paste()

Enables [bracketed paste mode](https://en.wikipedia.org/wiki/Bracketed-paste).

It should be paired with [[`crossterm_event_disable_bracketed_paste`](@ref)] at the end of execution.

This is not supported in older Windows terminals without [virtual terminal sequences](https://docs.microsoft.com/en-us/windows/console/console-virtual-terminal-sequences).
"""
function crossterm_event_enable_bracketed_paste()
  @ccall libcrossterm.crossterm_event_enable_bracketed_paste()::Cint
end

"""
    crossterm_event_enable_focus_change()

Enable focus event emission.

It should be paired with [[`crossterm_event_disable_focus_change`](@ref)] at the end of execution.

Focus events can be captured with [[`crossterm_event_read`](@ref)].
"""
function crossterm_event_enable_focus_change()
  @ccall libcrossterm.crossterm_event_enable_focus_change()::Cint
end

"""
    crossterm_event_enable_mouse_capture()

Enable mouse event capturing.
"""
function crossterm_event_enable_mouse_capture()
  @ccall libcrossterm.crossterm_event_enable_mouse_capture()::Cint
end

"""
    crossterm_event_poll(secs, nanos)

Checks if there is an [`Event`] available.

Returns `1` if an [`Event`] is available, it returns `0` if no [`Event`] is available, returns -1 if error has occurred.

When it returns `1`, that guarantees that subsequent call to the [[`crossterm_event_read`](@ref)] function won't block.

# Arguments

  - `timeout_secs` - maximum waiting time for event availability * `timeout_nanos` - maximum waiting time for event availability
"""
function crossterm_event_poll(secs, nanos)
  @ccall libcrossterm.crossterm_event_poll(secs::UInt64, nanos::UInt32)::Cint
end

"""
    crossterm_event_pop_keyboard_enhancement_flags()

Disables extra kinds of keyboard events.
"""
function crossterm_event_pop_keyboard_enhancement_flags()
  @ccall libcrossterm.crossterm_event_pop_keyboard_enhancement_flags()::Cint
end

"""
    crossterm_event_push_keyboard_enhancement_flags(flags)

Enables the [kitty keyboard protocol](https://sw.kovidgoyal.net/kitty/keyboard-protocol/), which adds extra information to keyboard events and removes ambiguity for modifier keys. It should be paired with [`crossterm_pop_keyboard_enhancement_flags`] at the end of execution.
"""
function crossterm_event_push_keyboard_enhancement_flags(flags)
  @ccall libcrossterm.crossterm_event_push_keyboard_enhancement_flags(flags::UInt8)::Cint
end

"""
    crossterm_event_read()

Reads a single [`Event`] as a UTF-8 JSON string. If error occurs during read, error will be returned as a UTF-8 JSON string.

This function blocks until an [`Event`] is available. Combine it with the [[`crossterm_event_poll`](@ref)] function to get non-blocking reads.

Caller is responsible for memory associated with string buffer. Use [[`crossterm_free_c_char`](@ref)] to free data.
"""
function crossterm_event_read()
  @ccall libcrossterm.crossterm_event_read()::Ptr{Cchar}
end

"""
    crossterm_flush()

Flush the stdout stream, ensuring that all intermediately buffered contents reach their destination.

It is considered an error if not all bytes could be written due to I/O errors or EOF being reached.
"""
function crossterm_flush()
  @ccall libcrossterm.crossterm_flush()::Cint
end

"""
    crossterm_free_c_char(s)

Frees data behind pointer to UTF-8 string allocated by this crate

Null character is stored in the last location of buffer.
"""
function crossterm_free_c_char(s)
  @ccall libcrossterm.crossterm_free_c_char(s::Ptr{Cchar})::Cint
end

"""
    crossterm_has_error()

Check whether error has been set.
"""
function crossterm_has_error()
  @ccall libcrossterm.crossterm_has_error()::Bool
end

"""
    crossterm_last_error_length()

Calculate the number of bytes in the last error's error message including a trailing `null` character. If there are no recent error, then this returns `0`.
"""
function crossterm_last_error_length()
  @ccall libcrossterm.crossterm_last_error_length()::Cint
end

"""
    crossterm_last_error_message()

Return most recent error message into a UTF-8 string buffer.

Null character is stored in the last location of buffer. Caller is responsible for memory associated with string buffer. Use [[`crossterm_free_c_char`](@ref)] to free data.
"""
function crossterm_last_error_message()
  @ccall libcrossterm.crossterm_last_error_message()::Ptr{Cchar}
end

"""
    crossterm_sleep(seconds)

Sleeps for n seconds where n is the argument to this function
"""
function crossterm_sleep(seconds)
  @ccall libcrossterm.crossterm_sleep(seconds::Cdouble)::Cvoid
end

"""
    crossterm_style_attribute(attr)

Sets an attribute.

See [`Attribute`] for more info.
"""
function crossterm_style_attribute(attr)
  @ccall libcrossterm.crossterm_style_attribute(attr::crossterm_Attribute)::Cint
end

"""
    crossterm_style_attribute_bold()

Sets the `Bold` attribute.
"""
function crossterm_style_attribute_bold()
  @ccall libcrossterm.crossterm_style_attribute_bold()::Cint
end

"""
    crossterm_style_attribute_crossed_out()

Sets the `CrossedOut` attribute.
"""
function crossterm_style_attribute_crossed_out()
  @ccall libcrossterm.crossterm_style_attribute_crossed_out()::Cint
end

"""
    crossterm_style_attribute_dim()

Sets the `Dim` attribute.
"""
function crossterm_style_attribute_dim()
  @ccall libcrossterm.crossterm_style_attribute_dim()::Cint
end

"""
    crossterm_style_attribute_double_underlined()

Sets the `DoubleUnderlined` attribute.
"""
function crossterm_style_attribute_double_underlined()
  @ccall libcrossterm.crossterm_style_attribute_double_underlined()::Cint
end

"""
    crossterm_style_attribute_fraktur()

Sets the `Fraktur` attribute.
"""
function crossterm_style_attribute_fraktur()
  @ccall libcrossterm.crossterm_style_attribute_fraktur()::Cint
end

"""
    crossterm_style_attribute_hidden()

Sets the `Hidden` attribute.
"""
function crossterm_style_attribute_hidden()
  @ccall libcrossterm.crossterm_style_attribute_hidden()::Cint
end

"""
    crossterm_style_attribute_italic()

Sets the `Italic` attribute.
"""
function crossterm_style_attribute_italic()
  @ccall libcrossterm.crossterm_style_attribute_italic()::Cint
end

"""
    crossterm_style_attribute_no_blink()

Sets the `NoBlink` attribute.
"""
function crossterm_style_attribute_no_blink()
  @ccall libcrossterm.crossterm_style_attribute_no_blink()::Cint
end

"""
    crossterm_style_attribute_no_bold()

Sets the `NoBold` attribute.
"""
function crossterm_style_attribute_no_bold()
  @ccall libcrossterm.crossterm_style_attribute_no_bold()::Cint
end

"""
    crossterm_style_attribute_no_hidden()

Sets the `NoHidden` attribute.
"""
function crossterm_style_attribute_no_hidden()
  @ccall libcrossterm.crossterm_style_attribute_no_hidden()::Cint
end

"""
    crossterm_style_attribute_no_italic()

Sets the `NoItalic` attribute.
"""
function crossterm_style_attribute_no_italic()
  @ccall libcrossterm.crossterm_style_attribute_no_italic()::Cint
end

"""
    crossterm_style_attribute_no_reverse()

Sets the `NoReverse` attribute.
"""
function crossterm_style_attribute_no_reverse()
  @ccall libcrossterm.crossterm_style_attribute_no_reverse()::Cint
end

"""
    crossterm_style_attribute_no_underline()

Sets the `NoUnderline` attribute.
"""
function crossterm_style_attribute_no_underline()
  @ccall libcrossterm.crossterm_style_attribute_no_underline()::Cint
end

"""
    crossterm_style_attribute_normal_intensity()

Sets the `NormalIntensity` attribute.
"""
function crossterm_style_attribute_normal_intensity()
  @ccall libcrossterm.crossterm_style_attribute_normal_intensity()::Cint
end

"""
    crossterm_style_attribute_not_crossed_out()

Sets the `NotCrossedOut` attribute.
"""
function crossterm_style_attribute_not_crossed_out()
  @ccall libcrossterm.crossterm_style_attribute_not_crossed_out()::Cint
end

"""
    crossterm_style_attribute_rapid_blink()

Sets the `RapidBlink` attribute.
"""
function crossterm_style_attribute_rapid_blink()
  @ccall libcrossterm.crossterm_style_attribute_rapid_blink()::Cint
end

"""
    crossterm_style_attribute_reset()

Sets the `Reset` attribute.
"""
function crossterm_style_attribute_reset()
  @ccall libcrossterm.crossterm_style_attribute_reset()::Cint
end

"""
    crossterm_style_attribute_reverse()

Sets the `Reverse` attribute.
"""
function crossterm_style_attribute_reverse()
  @ccall libcrossterm.crossterm_style_attribute_reverse()::Cint
end

"""
    crossterm_style_attribute_slow_blink()

Sets the `SlowBlink` attribute.
"""
function crossterm_style_attribute_slow_blink()
  @ccall libcrossterm.crossterm_style_attribute_slow_blink()::Cint
end

"""
    crossterm_style_attribute_undercurled()

Sets the `Undercurled` attribute.
"""
function crossterm_style_attribute_undercurled()
  @ccall libcrossterm.crossterm_style_attribute_undercurled()::Cint
end

"""
    crossterm_style_attribute_underdashed()

Sets the `Underdashed` attribute.
"""
function crossterm_style_attribute_underdashed()
  @ccall libcrossterm.crossterm_style_attribute_underdashed()::Cint
end

"""
    crossterm_style_attribute_underdotted()

Sets the `Underdotted` attribute.
"""
function crossterm_style_attribute_underdotted()
  @ccall libcrossterm.crossterm_style_attribute_underdotted()::Cint
end

"""
    crossterm_style_attribute_underlined()

Sets the `Underlined` attribute.
"""
function crossterm_style_attribute_underlined()
  @ccall libcrossterm.crossterm_style_attribute_underlined()::Cint
end

"""
    crossterm_style_background_color(color)

Sets the the background color.

See [`Color`] for more info.
"""
function crossterm_style_background_color(color)
  @ccall libcrossterm.crossterm_style_background_color(color::crossterm_Color)::Cint
end

"""
    crossterm_style_background_color_ansi(value)

Sets the the background color to an ANSI value.
"""
function crossterm_style_background_color_ansi(value)
  @ccall libcrossterm.crossterm_style_background_color_ansi(value::UInt8)::Cint
end

"""
    crossterm_style_background_color_black()

Sets the the background color to Black.
"""
function crossterm_style_background_color_black()
  @ccall libcrossterm.crossterm_style_background_color_black()::Cint
end

"""
    crossterm_style_background_color_blue()

Sets the the background color to Blue.
"""
function crossterm_style_background_color_blue()
  @ccall libcrossterm.crossterm_style_background_color_blue()::Cint
end

"""
    crossterm_style_background_color_cyan()

Sets the the background color to Cyan.
"""
function crossterm_style_background_color_cyan()
  @ccall libcrossterm.crossterm_style_background_color_cyan()::Cint
end

"""
    crossterm_style_background_color_dark_blue()

Sets the the background color to DarkBlue.
"""
function crossterm_style_background_color_dark_blue()
  @ccall libcrossterm.crossterm_style_background_color_dark_blue()::Cint
end

"""
    crossterm_style_background_color_dark_cyan()

Sets the the background color to DarkCyan.
"""
function crossterm_style_background_color_dark_cyan()
  @ccall libcrossterm.crossterm_style_background_color_dark_cyan()::Cint
end

"""
    crossterm_style_background_color_dark_green()

Sets the the background color to DarkGreen.
"""
function crossterm_style_background_color_dark_green()
  @ccall libcrossterm.crossterm_style_background_color_dark_green()::Cint
end

"""
    crossterm_style_background_color_dark_grey()

Sets the the background color to DarkGrey.
"""
function crossterm_style_background_color_dark_grey()
  @ccall libcrossterm.crossterm_style_background_color_dark_grey()::Cint
end

"""
    crossterm_style_background_color_dark_magenta()

Sets the the background color to DarkMagenta.
"""
function crossterm_style_background_color_dark_magenta()
  @ccall libcrossterm.crossterm_style_background_color_dark_magenta()::Cint
end

"""
    crossterm_style_background_color_dark_red()

Sets the the background color to DarkRed.
"""
function crossterm_style_background_color_dark_red()
  @ccall libcrossterm.crossterm_style_background_color_dark_red()::Cint
end

"""
    crossterm_style_background_color_dark_yellow()

Sets the the background color to DarkYellow.
"""
function crossterm_style_background_color_dark_yellow()
  @ccall libcrossterm.crossterm_style_background_color_dark_yellow()::Cint
end

"""
    crossterm_style_background_color_green()

Sets the the background color to Green.
"""
function crossterm_style_background_color_green()
  @ccall libcrossterm.crossterm_style_background_color_green()::Cint
end

"""
    crossterm_style_background_color_grey()

Sets the the background color to Grey.
"""
function crossterm_style_background_color_grey()
  @ccall libcrossterm.crossterm_style_background_color_grey()::Cint
end

"""
    crossterm_style_background_color_magenta()

Sets the the background color to Magenta.
"""
function crossterm_style_background_color_magenta()
  @ccall libcrossterm.crossterm_style_background_color_magenta()::Cint
end

"""
    crossterm_style_background_color_red()

Sets the the background color to Red.
"""
function crossterm_style_background_color_red()
  @ccall libcrossterm.crossterm_style_background_color_red()::Cint
end

"""
    crossterm_style_background_color_reset()

Sets the the background color to Reset.
"""
function crossterm_style_background_color_reset()
  @ccall libcrossterm.crossterm_style_background_color_reset()::Cint
end

"""
    crossterm_style_background_color_rgb(r, g, b)

Sets the the background color in RGB.
"""
function crossterm_style_background_color_rgb(r, g, b)
  @ccall libcrossterm.crossterm_style_background_color_rgb(r::UInt8, g::UInt8, b::UInt8)::Cint
end

"""
    crossterm_style_background_color_white()

Sets the the background color to White.
"""
function crossterm_style_background_color_white()
  @ccall libcrossterm.crossterm_style_background_color_white()::Cint
end

"""
    crossterm_style_background_color_yellow()

Sets the the background color to Yellow.
"""
function crossterm_style_background_color_yellow()
  @ccall libcrossterm.crossterm_style_background_color_yellow()::Cint
end

"""
    crossterm_style_foreground_color(color)

Sets the the foreground color.

See [`Color`] for more info.
"""
function crossterm_style_foreground_color(color)
  @ccall libcrossterm.crossterm_style_foreground_color(color::crossterm_Color)::Cint
end

"""
    crossterm_style_foreground_color_ansi(value)

Sets the the foreground color to an ANSI value.
"""
function crossterm_style_foreground_color_ansi(value)
  @ccall libcrossterm.crossterm_style_foreground_color_ansi(value::UInt8)::Cint
end

"""
    crossterm_style_foreground_color_black()

Sets the the foreground color to Black.
"""
function crossterm_style_foreground_color_black()
  @ccall libcrossterm.crossterm_style_foreground_color_black()::Cint
end

"""
    crossterm_style_foreground_color_blue()

Sets the the foreground color to Blue.
"""
function crossterm_style_foreground_color_blue()
  @ccall libcrossterm.crossterm_style_foreground_color_blue()::Cint
end

"""
    crossterm_style_foreground_color_cyan()

Sets the the foreground color to Cyan.
"""
function crossterm_style_foreground_color_cyan()
  @ccall libcrossterm.crossterm_style_foreground_color_cyan()::Cint
end

"""
    crossterm_style_foreground_color_dark_blue()

Sets the the foreground color to DarkBlue.
"""
function crossterm_style_foreground_color_dark_blue()
  @ccall libcrossterm.crossterm_style_foreground_color_dark_blue()::Cint
end

"""
    crossterm_style_foreground_color_dark_cyan()

Sets the the foreground color to DarkCyan.
"""
function crossterm_style_foreground_color_dark_cyan()
  @ccall libcrossterm.crossterm_style_foreground_color_dark_cyan()::Cint
end

"""
    crossterm_style_foreground_color_dark_green()

Sets the the foreground color to DarkGreen.
"""
function crossterm_style_foreground_color_dark_green()
  @ccall libcrossterm.crossterm_style_foreground_color_dark_green()::Cint
end

"""
    crossterm_style_foreground_color_dark_grey()

Sets the the foreground color to DarkGrey.
"""
function crossterm_style_foreground_color_dark_grey()
  @ccall libcrossterm.crossterm_style_foreground_color_dark_grey()::Cint
end

"""
    crossterm_style_foreground_color_dark_magenta()

Sets the the foreground color to DarkMagenta.
"""
function crossterm_style_foreground_color_dark_magenta()
  @ccall libcrossterm.crossterm_style_foreground_color_dark_magenta()::Cint
end

"""
    crossterm_style_foreground_color_dark_red()

Sets the the foreground color to DarkRed.
"""
function crossterm_style_foreground_color_dark_red()
  @ccall libcrossterm.crossterm_style_foreground_color_dark_red()::Cint
end

"""
    crossterm_style_foreground_color_dark_yellow()

Sets the the foreground color to DarkYellow.
"""
function crossterm_style_foreground_color_dark_yellow()
  @ccall libcrossterm.crossterm_style_foreground_color_dark_yellow()::Cint
end

"""
    crossterm_style_foreground_color_green()

Sets the the foreground color to Green.
"""
function crossterm_style_foreground_color_green()
  @ccall libcrossterm.crossterm_style_foreground_color_green()::Cint
end

"""
    crossterm_style_foreground_color_grey()

Sets the the foreground color to Grey.
"""
function crossterm_style_foreground_color_grey()
  @ccall libcrossterm.crossterm_style_foreground_color_grey()::Cint
end

"""
    crossterm_style_foreground_color_magenta()

Sets the the foreground color to Magenta.
"""
function crossterm_style_foreground_color_magenta()
  @ccall libcrossterm.crossterm_style_foreground_color_magenta()::Cint
end

"""
    crossterm_style_foreground_color_red()

Sets the the foreground color to Red.
"""
function crossterm_style_foreground_color_red()
  @ccall libcrossterm.crossterm_style_foreground_color_red()::Cint
end

"""
    crossterm_style_foreground_color_reset()

Sets the the foreground color to Reset.
"""
function crossterm_style_foreground_color_reset()
  @ccall libcrossterm.crossterm_style_foreground_color_reset()::Cint
end

"""
    crossterm_style_foreground_color_rgb(r, g, b)

Sets the the foreground color in RGB.
"""
function crossterm_style_foreground_color_rgb(r, g, b)
  @ccall libcrossterm.crossterm_style_foreground_color_rgb(r::UInt8, g::UInt8, b::UInt8)::Cint
end

"""
    crossterm_style_foreground_color_white()

Sets the the foreground color to White.
"""
function crossterm_style_foreground_color_white()
  @ccall libcrossterm.crossterm_style_foreground_color_white()::Cint
end

"""
    crossterm_style_foreground_color_yellow()

Sets the the foreground color to Yellow.
"""
function crossterm_style_foreground_color_yellow()
  @ccall libcrossterm.crossterm_style_foreground_color_yellow()::Cint
end

"""
    crossterm_style_print(s)

Print string to stdout

# Safety

This function takes a raw pointer as argument. As such, the caller must ensure that: - The `title` pointer points to a valid null-terminated string. - This function borrows a slice to a valid null-terminated string and the memory referenced by `title` won't be deallocated or modified for the duration of the function call.. - The `title` pointer is correctly aligned and `title` points to an initialized memory.

If these conditions are not met, the behavior is undefined.
"""
function crossterm_style_print(s)
  @ccall libcrossterm.crossterm_style_print(s::Ptr{Cchar})::Cint
end

"""
    crossterm_style_print_char(c)

Print char to stdout
"""
function crossterm_style_print_char(c)
  @ccall libcrossterm.crossterm_style_print_char(c::UInt32)::Cint
end

"""
    crossterm_style_print_string(s)

Print string to stdout

# Safety

This function takes a raw pointer as argument. As such, the caller must ensure that: - The `title` pointer points to a valid null-terminated string. - This function borrows a slice to a valid null-terminated string and the memory referenced by `title` won't be deallocated or modified for the duration of the function call.. - The `title` pointer is correctly aligned and `title` points to an initialized memory.

If these conditions are not met, the behavior is undefined.
"""
function crossterm_style_print_string(s)
  @ccall libcrossterm.crossterm_style_print_string(s::Ptr{Cchar})::Cint
end

"""
    crossterm_style_reset_color()

Resets the colors back to default.
"""
function crossterm_style_reset_color()
  @ccall libcrossterm.crossterm_style_reset_color()::Cint
end

"""
    crossterm_style_underline_color(color)

Sets the the underline color.

See [`Color`] for more info.
"""
function crossterm_style_underline_color(color)
  @ccall libcrossterm.crossterm_style_underline_color(color::crossterm_Color)::Cint
end

"""
    crossterm_style_underline_color_ansi(value)

Sets the the underline color to an ANSI value.
"""
function crossterm_style_underline_color_ansi(value)
  @ccall libcrossterm.crossterm_style_underline_color_ansi(value::UInt8)::Cint
end

"""
    crossterm_style_underline_color_black()

Sets the the underline color to Black.
"""
function crossterm_style_underline_color_black()
  @ccall libcrossterm.crossterm_style_underline_color_black()::Cint
end

"""
    crossterm_style_underline_color_blue()

Sets the the underline color to Blue.
"""
function crossterm_style_underline_color_blue()
  @ccall libcrossterm.crossterm_style_underline_color_blue()::Cint
end

"""
    crossterm_style_underline_color_cyan()

Sets the the underline color to Cyan.
"""
function crossterm_style_underline_color_cyan()
  @ccall libcrossterm.crossterm_style_underline_color_cyan()::Cint
end

"""
    crossterm_style_underline_color_dark_blue()

Sets the the underline color to DarkBlue.
"""
function crossterm_style_underline_color_dark_blue()
  @ccall libcrossterm.crossterm_style_underline_color_dark_blue()::Cint
end

"""
    crossterm_style_underline_color_dark_cyan()

Sets the the underline color to DarkCyan.
"""
function crossterm_style_underline_color_dark_cyan()
  @ccall libcrossterm.crossterm_style_underline_color_dark_cyan()::Cint
end

"""
    crossterm_style_underline_color_dark_green()

Sets the the underline color to DarkGreen.
"""
function crossterm_style_underline_color_dark_green()
  @ccall libcrossterm.crossterm_style_underline_color_dark_green()::Cint
end

"""
    crossterm_style_underline_color_dark_grey()

Sets the the underline color to DarkGrey.
"""
function crossterm_style_underline_color_dark_grey()
  @ccall libcrossterm.crossterm_style_underline_color_dark_grey()::Cint
end

"""
    crossterm_style_underline_color_dark_magenta()

Sets the the underline color to DarkMagenta.
"""
function crossterm_style_underline_color_dark_magenta()
  @ccall libcrossterm.crossterm_style_underline_color_dark_magenta()::Cint
end

"""
    crossterm_style_underline_color_dark_red()

Sets the the underline color to DarkRed.
"""
function crossterm_style_underline_color_dark_red()
  @ccall libcrossterm.crossterm_style_underline_color_dark_red()::Cint
end

"""
    crossterm_style_underline_color_dark_yellow()

Sets the the underline color to DarkYellow.
"""
function crossterm_style_underline_color_dark_yellow()
  @ccall libcrossterm.crossterm_style_underline_color_dark_yellow()::Cint
end

"""
    crossterm_style_underline_color_green()

Sets the the underline color to Green.
"""
function crossterm_style_underline_color_green()
  @ccall libcrossterm.crossterm_style_underline_color_green()::Cint
end

"""
    crossterm_style_underline_color_grey()

Sets the the underline color to Grey.
"""
function crossterm_style_underline_color_grey()
  @ccall libcrossterm.crossterm_style_underline_color_grey()::Cint
end

"""
    crossterm_style_underline_color_magenta()

Sets the the underline color to Magenta.
"""
function crossterm_style_underline_color_magenta()
  @ccall libcrossterm.crossterm_style_underline_color_magenta()::Cint
end

"""
    crossterm_style_underline_color_red()

Sets the the underline color to Red.
"""
function crossterm_style_underline_color_red()
  @ccall libcrossterm.crossterm_style_underline_color_red()::Cint
end

"""
    crossterm_style_underline_color_reset()

Sets the the underline color to Reset.
"""
function crossterm_style_underline_color_reset()
  @ccall libcrossterm.crossterm_style_underline_color_reset()::Cint
end

"""
    crossterm_style_underline_color_rgb(r, g, b)

Sets the the underline color in RGB.
"""
function crossterm_style_underline_color_rgb(r, g, b)
  @ccall libcrossterm.crossterm_style_underline_color_rgb(r::UInt8, g::UInt8, b::UInt8)::Cint
end

"""
    crossterm_style_underline_color_white()

Sets the the underline color to White.
"""
function crossterm_style_underline_color_white()
  @ccall libcrossterm.crossterm_style_underline_color_white()::Cint
end

"""
    crossterm_style_underline_color_yellow()

Sets the the underline color to Yellow.
"""
function crossterm_style_underline_color_yellow()
  @ccall libcrossterm.crossterm_style_underline_color_yellow()::Cint
end

"""
    crossterm_terminal_begin_synchronized_update()

Instructs the terminal emulator to begin a synchronized frame.

# Notes

  - Commands must be executed/queued for execution otherwise they do nothing. * Use [[`crossterm_terminal_end_synchronized_update`](@ref)] command to leave the entered alternate screen.

When rendering the screen of the terminal, the Emulator usually iterates through each visible grid cell and renders its current state. With applications updating the screen a at higher frequency this can cause tearing.

This mode attempts to mitigate that.

When the synchronization mode is enabled following render calls will keep rendering the last rendered state. The terminal Emulator keeps processing incoming text and sequences. When the synchronized update mode is disabled again the renderer may fetch the latest screen buffer state again, effectively avoiding the tearing effect by unintentionally rendering in the middle a of an application screen update.
"""
function crossterm_terminal_begin_synchronized_update()
  @ccall libcrossterm.crossterm_terminal_begin_synchronized_update()::Cint
end

"""
    crossterm_terminal_clear(ct)

Clear screen command.
"""
function crossterm_terminal_clear(ct)
  @ccall libcrossterm.crossterm_terminal_clear(ct::crossterm_ClearType)::Cint
end

"""
    crossterm_terminal_disable_line_wrap()

Disables line wrapping.
"""
function crossterm_terminal_disable_line_wrap()
  @ccall libcrossterm.crossterm_terminal_disable_line_wrap()::Cint
end

"""
    crossterm_terminal_disable_raw_mode()

Disables raw mode.
"""
function crossterm_terminal_disable_raw_mode()
  @ccall libcrossterm.crossterm_terminal_disable_raw_mode()::Cint
end

"""
    crossterm_terminal_enable_line_wrap()

Enables line wrapping.
"""
function crossterm_terminal_enable_line_wrap()
  @ccall libcrossterm.crossterm_terminal_enable_line_wrap()::Cint
end

"""
    crossterm_terminal_enable_raw_mode()

Enables raw mode.
"""
function crossterm_terminal_enable_raw_mode()
  @ccall libcrossterm.crossterm_terminal_enable_raw_mode()::Cint
end

"""
    crossterm_terminal_end_synchronized_update()

Instructs the terminal to end a synchronized frame.

# Notes

  - Commands must be executed/queued for execution otherwise they do nothing. * Use [[`crossterm_terminal_begin_synchronized_update`](@ref)] to enter the alternate screen.

When rendering the screen of the terminal, the Emulator usually iterates through each visible grid cell and renders its current state. With applications updating the screen a at higher frequency this can cause tearing.

This mode attempts to mitigate that.

When the synchronization mode is enabled following render calls will keep rendering the last rendered state. The terminal Emulator keeps processing incoming text and sequences. When the synchronized update mode is disabled again the renderer may fetch the latest screen buffer state again, effectively avoiding the tearing effect by unintentionally rendering in the middle a of an application screen update.
"""
function crossterm_terminal_end_synchronized_update()
  @ccall libcrossterm.crossterm_terminal_end_synchronized_update()::Cint
end

"""
    crossterm_terminal_enter_alternate_screen()

Enters alternate screen.
"""
function crossterm_terminal_enter_alternate_screen()
  @ccall libcrossterm.crossterm_terminal_enter_alternate_screen()::Cint
end

"""
    crossterm_terminal_leave_alternate_screen()

Leaves alternate screen.
"""
function crossterm_terminal_leave_alternate_screen()
  @ccall libcrossterm.crossterm_terminal_leave_alternate_screen()::Cint
end

"""
    crossterm_terminal_scroll_down(n)

Scroll down command.
"""
function crossterm_terminal_scroll_down(n)
  @ccall libcrossterm.crossterm_terminal_scroll_down(n::Cushort)::Cint
end

"""
    crossterm_terminal_scroll_up(n)

Scroll up command.
"""
function crossterm_terminal_scroll_up(n)
  @ccall libcrossterm.crossterm_terminal_scroll_up(n::Cushort)::Cint
end

"""
    crossterm_terminal_size(width, height)

Get terminal size
"""
function crossterm_terminal_size(width, height)
  @ccall libcrossterm.crossterm_terminal_size(width::Ptr{UInt16}, height::Ptr{UInt16})::Cint
end

"""
    crossterm_terminal_size_set(cols, rows)

Sets the terminal buffer size `(cols, rows)`.
"""
function crossterm_terminal_size_set(cols, rows)
  @ccall libcrossterm.crossterm_terminal_size_set(cols::UInt16, rows::UInt16)::Cint
end

"""
    crossterm_terminal_title(title)

Sets terminal title.

# Safety

This function takes a raw pointer as argument. As such, the caller must ensure that: - The `title` pointer points to a valid null-terminated string. - This function borrows a slice to a valid null-terminated string and the memory referenced by `title` won't be deallocated or modified for the duration of the function call.. - The `title` pointer is correctly aligned and `title` points to an initialized memory.

If these conditions are not met, the behavior is undefined.
"""
function crossterm_terminal_title(title)
  @ccall libcrossterm.crossterm_terminal_title(title::Ptr{Cchar})::Cint
end

# Skipping MacroDefinition: crossterm_KeyModifiers_SHIFT ( crossterm_KeyModifiers ) { . bits = ( uint8_t ) 1 }

# Skipping MacroDefinition: crossterm_KeyModifiers_CONTROL ( crossterm_KeyModifiers ) { . bits = ( uint8_t ) 2 }

# Skipping MacroDefinition: crossterm_KeyModifiers_ALT ( crossterm_KeyModifiers ) { . bits = ( uint8_t ) 4 }

# Skipping MacroDefinition: crossterm_KeyModifiers_SUPER ( crossterm_KeyModifiers ) { . bits = ( uint8_t ) 8 }

# Skipping MacroDefinition: crossterm_KeyModifiers_HYPER ( crossterm_KeyModifiers ) { . bits = ( uint8_t ) 16 }

# Skipping MacroDefinition: crossterm_KeyModifiers_META ( crossterm_KeyModifiers ) { . bits = ( uint8_t ) 32 }

# Skipping MacroDefinition: crossterm_KeyModifiers_NONE ( crossterm_KeyModifiers ) { . bits = ( uint8_t ) 0 }

# Skipping MacroDefinition: crossterm_KeyEventState_KEYPAD ( crossterm_KeyEventState ) { . bits = ( uint8_t ) 1 }

# Skipping MacroDefinition: crossterm_KeyEventState_CAPS_LOCK ( crossterm_KeyEventState ) { . bits = ( uint8_t ) 8 }

# Skipping MacroDefinition: crossterm_KeyEventState_NUM_LOCK ( crossterm_KeyEventState ) { . bits = ( uint8_t ) 8 }

# Skipping MacroDefinition: crossterm_KeyEventState_NONE ( crossterm_KeyEventState ) { . bits = ( uint8_t ) 0 }

# exports
const PREFIXES = ["crossterm_"]
for name in names(@__MODULE__; all = true), prefix in PREFIXES
  if startswith(string(name), prefix)
    @eval export $name
  end
end

end # module
