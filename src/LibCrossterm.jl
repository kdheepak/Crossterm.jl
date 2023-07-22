module LibCrossterm

using libcrossterm_jll
export libcrossterm_jll

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
    crossterm_CursorPosition

CursorPosition struct
"""
struct crossterm_CursorPosition
  column::UInt16
  row::UInt16
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

struct crossterm_Rgb_Body
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
    crossterm_TerminalSize

TerminalSize
"""
struct crossterm_TerminalSize
  width::UInt16
  height::UInt16
end

"""
    crossterm_clear_last_error()

### Prototype

```c
void crossterm_clear_last_error(void);
```
"""
function crossterm_clear_last_error()
  @ccall libcrossterm.crossterm_clear_last_error()::Cvoid
end

"""
    crossterm_cursor_disable_blinking()

Disables blinking of the terminal cursor.

### Prototype

```c
int crossterm_cursor_disable_blinking(void);
```
"""
function crossterm_cursor_disable_blinking()
  @ccall libcrossterm.crossterm_cursor_disable_blinking()::Cint
end

"""
    crossterm_cursor_enable_blinking()

Enables blinking of the terminal cursor.

### Prototype

```c
int crossterm_cursor_enable_blinking(void);
```
"""
function crossterm_cursor_enable_blinking()
  @ccall libcrossterm.crossterm_cursor_enable_blinking()::Cint
end

"""
    crossterm_cursor_hide()

Hides the terminal cursor.

### Prototype

```c
int crossterm_cursor_hide(void);
```
"""
function crossterm_cursor_hide()
  @ccall libcrossterm.crossterm_cursor_hide()::Cint
end

"""
    crossterm_cursor_move_down(rows)

Moves the terminal cursor a given number of rows down.

### Prototype

```c
int crossterm_cursor_move_down(uint16_t rows);
```
"""
function crossterm_cursor_move_down(rows)
  @ccall libcrossterm.crossterm_cursor_move_down(rows::UInt16)::Cint
end

"""
    crossterm_cursor_move_left(columns)

Moves the terminal cursor a given number of columns to the left.

### Prototype

```c
int crossterm_cursor_move_left(uint16_t columns);
```
"""
function crossterm_cursor_move_left(columns)
  @ccall libcrossterm.crossterm_cursor_move_left(columns::UInt16)::Cint
end

"""
    crossterm_cursor_move_right(columns)

Moves the terminal cursor a given number of columns to the right.

### Prototype

```c
int crossterm_cursor_move_right(uint16_t columns);
```
"""
function crossterm_cursor_move_right(columns)
  @ccall libcrossterm.crossterm_cursor_move_right(columns::UInt16)::Cint
end

"""
    crossterm_cursor_move_to_column(column)

Moves the terminal cursor to the given column on the current row.

### Prototype

```c
int crossterm_cursor_move_to_column(uint16_t column);
```
"""
function crossterm_cursor_move_to_column(column)
  @ccall libcrossterm.crossterm_cursor_move_to_column(column::UInt16)::Cint
end

"""
    crossterm_cursor_move_to_next_line(n)

Moves the terminal cursor down the given number of lines and moves it to the first column.

# Notes * This command is 1 based, meaning `[`crossterm_cursor_move_to_next_line`](@ref)(1)` moves to the next line. * Most terminals default 0 argument to 1.

### Prototype

```c
int crossterm_cursor_move_to_next_line(uint16_t n);
```
"""
function crossterm_cursor_move_to_next_line(n)
  @ccall libcrossterm.crossterm_cursor_move_to_next_line(n::UInt16)::Cint
end

"""
    crossterm_cursor_move_to_previous_line(n)

Moves the terminal cursor up the given number of lines and moves it to the first column.

### Prototype

```c
int crossterm_cursor_move_to_previous_line(uint16_t n);
```
"""
function crossterm_cursor_move_to_previous_line(n)
  @ccall libcrossterm.crossterm_cursor_move_to_previous_line(n::UInt16)::Cint
end

"""
    crossterm_cursor_move_to_row(row)

Moves the terminal cursor to the given row on the current column.

### Prototype

```c
int crossterm_cursor_move_to_row(uint16_t row);
```
"""
function crossterm_cursor_move_to_row(row)
  @ccall libcrossterm.crossterm_cursor_move_to_row(row::UInt16)::Cint
end

"""
    crossterm_cursor_move_up(rows)

Moves the terminal cursor a given number of rows up.

### Prototype

```c
int crossterm_cursor_move_up(uint16_t rows);
```
"""
function crossterm_cursor_move_up(rows)
  @ccall libcrossterm.crossterm_cursor_move_up(rows::UInt16)::Cint
end

"""
    crossterm_cursor_moveto(x, y)

Moves the terminal cursor to the given position (column, row).

# Notes * Top left cell is represented as `0,0`.

### Prototype

```c
int crossterm_cursor_moveto(uint16_t x, uint16_t y);
```
"""
function crossterm_cursor_moveto(x, y)
  @ccall libcrossterm.crossterm_cursor_moveto(x::UInt16, y::UInt16)::Cint
end

"""
    crossterm_cursor_restore_position()

Restores the saved terminal cursor position.

### Prototype

```c
int crossterm_cursor_restore_position(void);
```
"""
function crossterm_cursor_restore_position()
  @ccall libcrossterm.crossterm_cursor_restore_position()::Cint
end

"""
    crossterm_cursor_save_position()

Saves the current terminal cursor position.

### Prototype

```c
int crossterm_cursor_save_position(void);
```
"""
function crossterm_cursor_save_position()
  @ccall libcrossterm.crossterm_cursor_save_position()::Cint
end

"""
    crossterm_cursor_set_style(cursor_style)

Sets the style of the cursor.

### Prototype

```c
int crossterm_cursor_set_style(crossterm_CursorStyle cursor_style);
```
"""
function crossterm_cursor_set_style(cursor_style)
  @ccall libcrossterm.crossterm_cursor_set_style(cursor_style::crossterm_CursorStyle)::Cint
end

"""
    crossterm_cursor_set_style_blinking_bar()

Sets the style of the cursor to a blinking bar.

### Prototype

```c
int crossterm_cursor_set_style_blinking_bar(void);
```
"""
function crossterm_cursor_set_style_blinking_bar()
  @ccall libcrossterm.crossterm_cursor_set_style_blinking_bar()::Cint
end

"""
    crossterm_cursor_set_style_blinking_block()

Sets the style of the cursor to a blinking block.

### Prototype

```c
int crossterm_cursor_set_style_blinking_block(void);
```
"""
function crossterm_cursor_set_style_blinking_block()
  @ccall libcrossterm.crossterm_cursor_set_style_blinking_block()::Cint
end

"""
    crossterm_cursor_set_style_blinking_underscore()

Sets the style of the cursor to a blinking underscore.

### Prototype

```c
int crossterm_cursor_set_style_blinking_underscore(void);
```
"""
function crossterm_cursor_set_style_blinking_underscore()
  @ccall libcrossterm.crossterm_cursor_set_style_blinking_underscore()::Cint
end

"""
    crossterm_cursor_set_style_default_user_shape()

Sets the style of the cursor to default user shape.

### Prototype

```c
int crossterm_cursor_set_style_default_user_shape(void);
```
"""
function crossterm_cursor_set_style_default_user_shape()
  @ccall libcrossterm.crossterm_cursor_set_style_default_user_shape()::Cint
end

"""
    crossterm_cursor_set_style_steady_bar()

Sets the style of the cursor to a steady bar.

### Prototype

```c
int crossterm_cursor_set_style_steady_bar(void);
```
"""
function crossterm_cursor_set_style_steady_bar()
  @ccall libcrossterm.crossterm_cursor_set_style_steady_bar()::Cint
end

"""
    crossterm_cursor_set_style_steady_block()

Sets the style of the cursor to a steady block.

### Prototype

```c
int crossterm_cursor_set_style_steady_block(void);
```
"""
function crossterm_cursor_set_style_steady_block()
  @ccall libcrossterm.crossterm_cursor_set_style_steady_block()::Cint
end

"""
    crossterm_cursor_set_style_steady_underscore()

Sets the style of the cursor to a steady underscore.

### Prototype

```c
int crossterm_cursor_set_style_steady_underscore(void);
```
"""
function crossterm_cursor_set_style_steady_underscore()
  @ccall libcrossterm.crossterm_cursor_set_style_steady_underscore()::Cint
end

"""
    crossterm_cursor_show()

Shows the terminal cursor.

### Prototype

```c
int crossterm_cursor_show(void);
```
"""
function crossterm_cursor_show()
  @ccall libcrossterm.crossterm_cursor_show()::Cint
end

"""
    crossterm_disable_line_wrap()

Disables line wrapping.

### Prototype

```c
int crossterm_disable_line_wrap(void);
```
"""
function crossterm_disable_line_wrap()
  @ccall libcrossterm.crossterm_disable_line_wrap()::Cint
end

"""
    crossterm_enable_line_wrap()

Enables line wrapping.

### Prototype

```c
int crossterm_enable_line_wrap(void);
```
"""
function crossterm_enable_line_wrap()
  @ccall libcrossterm.crossterm_enable_line_wrap()::Cint
end

"""
    crossterm_enter_alternate_screen()

Enters alternate screen.

### Prototype

```c
int crossterm_enter_alternate_screen(void);
```
"""
function crossterm_enter_alternate_screen()
  @ccall libcrossterm.crossterm_enter_alternate_screen()::Cint
end

"""
    crossterm_event_disable_bracketed_paste()

Disables bracketed paste mode.

### Prototype

```c
int crossterm_event_disable_bracketed_paste(void);
```
"""
function crossterm_event_disable_bracketed_paste()
  @ccall libcrossterm.crossterm_event_disable_bracketed_paste()::Cint
end

"""
    crossterm_event_disable_focus_change()

Disable focus event emission.

### Prototype

```c
int crossterm_event_disable_focus_change(void);
```
"""
function crossterm_event_disable_focus_change()
  @ccall libcrossterm.crossterm_event_disable_focus_change()::Cint
end

"""
    crossterm_event_disable_mouse_capture()

Disable mouse event capturing.

### Prototype

```c
int crossterm_event_disable_mouse_capture(void);
```
"""
function crossterm_event_disable_mouse_capture()
  @ccall libcrossterm.crossterm_event_disable_mouse_capture()::Cint
end

"""
    crossterm_event_enable_bracketed_paste()

Enables [bracketed paste mode](https://en.wikipedia.org/wiki/Bracketed-paste).

It should be paired with [[`crossterm_event_disable_bracketed_paste`](@ref)] at the end of execution.

This is not supported in older Windows terminals without [virtual terminal sequences](https://docs.microsoft.com/en-us/windows/console/console-virtual-terminal-sequences).

### Prototype

```c
int crossterm_event_enable_bracketed_paste(void);
```
"""
function crossterm_event_enable_bracketed_paste()
  @ccall libcrossterm.crossterm_event_enable_bracketed_paste()::Cint
end

"""
    crossterm_event_enable_focus_change()

Enable focus event emission.

It should be paired with [[`crossterm_event_disable_focus_change`](@ref)] at the end of execution.

Focus events can be captured with [[`crossterm_event_read`](@ref)].

### Prototype

```c
int crossterm_event_enable_focus_change(void);
```
"""
function crossterm_event_enable_focus_change()
  @ccall libcrossterm.crossterm_event_enable_focus_change()::Cint
end

"""
    crossterm_event_enable_mouse_capture()

Enable mouse event capturing.

### Prototype

```c
int crossterm_event_enable_mouse_capture(void);
```
"""
function crossterm_event_enable_mouse_capture()
  @ccall libcrossterm.crossterm_event_enable_mouse_capture()::Cint
end

"""
    crossterm_event_poll(secs, nanos)

Checks if there is an [`Event`](enum.Event.html) available.

Returns `Ok(true)` if an [`Event`](enum.Event.html) is available otherwise it returns `Ok(false)`.

`Ok(true)` guarantees that subsequent call to the [`read`](fn.read.html) function won't block.

# Arguments

  - `timeout_secs` - maximum waiting time for event availability * `timeout_nanos` - maximum waiting time for event availability

### Prototype

```c
int crossterm_event_poll(uint64_t secs, uint32_t nanos);
```
"""
function crossterm_event_poll(secs, nanos)
  @ccall libcrossterm.crossterm_event_poll(secs::UInt64, nanos::UInt32)::Cint
end

"""
    crossterm_event_pop_keyboard_enhancement_flags()

Disables extra kinds of keyboard events.

### Prototype

```c
int crossterm_event_pop_keyboard_enhancement_flags(void);
```
"""
function crossterm_event_pop_keyboard_enhancement_flags()
  @ccall libcrossterm.crossterm_event_pop_keyboard_enhancement_flags()::Cint
end

"""
    crossterm_event_push_keyboard_enhancement_flags(flags)

Enables the [kitty keyboard protocol](https://sw.kovidgoyal.net/kitty/keyboard-protocol/), which adds extra information to keyboard events and removes ambiguity for modifier keys. It should be paired with [`crossterm_pop_keyboard_enhancement_flags`] at the end of execution.

### Prototype

```c
int crossterm_event_push_keyboard_enhancement_flags(uint8_t flags);
```
"""
function crossterm_event_push_keyboard_enhancement_flags(flags)
  @ccall libcrossterm.crossterm_event_push_keyboard_enhancement_flags(flags::UInt8)::Cint
end

"""
    crossterm_event_read()

Reads a single Event as a string.

This function blocks until an Event is available. Combine it with the [[`crossterm_event_poll`](@ref)] function to get non-blocking reads. Use [[`crossterm_free_c_char`](@ref)] to free data

### Prototype

```c
const char *crossterm_event_read(void);
```
"""
function crossterm_event_read()
  @ccall libcrossterm.crossterm_event_read()::Ptr{Cchar}
end

"""
    crossterm_free_c_char(s)

### Prototype

```c
int crossterm_free_c_char(char *s);
```
"""
function crossterm_free_c_char(s)
  @ccall libcrossterm.crossterm_free_c_char(s::Ptr{Cchar})::Cint
end

"""
    crossterm_get_cursor_position(pos)

Get cursor position (column, row)

### Prototype

```c
int crossterm_get_cursor_position(crossterm_CursorPosition *pos);
```
"""
function crossterm_get_cursor_position(pos)
  @ccall libcrossterm.crossterm_get_cursor_position(pos::Ptr{crossterm_CursorPosition})::Cint
end

"""
    crossterm_has_error()

Check whether error has been set.

### Prototype

```c
bool crossterm_has_error(void);
```
"""
function crossterm_has_error()
  @ccall libcrossterm.crossterm_has_error()::Bool
end

"""
    crossterm_last_error_length()

Calculate the number of bytes in the last error's error message including a trailing `null` character. If there are no recent error, then this returns `0`.

### Prototype

```c
int crossterm_last_error_length(void);
```
"""
function crossterm_last_error_length()
  @ccall libcrossterm.crossterm_last_error_length()::Cint
end

"""
    crossterm_last_error_message()

Return most recent error message into a caller-provided buffer as a UTF-8 string

Null character is stored in the last location of buffer Use [[`crossterm_free_c_char`](@ref)] to free data

### Prototype

```c
const char *crossterm_last_error_message(void);
```
"""
function crossterm_last_error_message()
  @ccall libcrossterm.crossterm_last_error_message()::Ptr{Cchar}
end

"""
    crossterm_leave_alternate_screen()

Leaves alternate screen.

### Prototype

```c
int crossterm_leave_alternate_screen(void);
```
"""
function crossterm_leave_alternate_screen()
  @ccall libcrossterm.crossterm_leave_alternate_screen()::Cint
end

"""
    crossterm_set_cursor_position(pos)

Set cursor position (column, row)

### Prototype

```c
int crossterm_set_cursor_position(crossterm_CursorPosition pos);
```
"""
function crossterm_set_cursor_position(pos)
  @ccall libcrossterm.crossterm_set_cursor_position(pos::crossterm_CursorPosition)::Cint
end

"""
    crossterm_sleep(seconds)

Sleeps for `seconds` seconds

### Prototype

```c
void crossterm_sleep(double seconds);
```
"""
function crossterm_sleep(seconds)
  @ccall libcrossterm.crossterm_sleep(seconds::Cdouble)::Cvoid
end

"""
    crossterm_style_reset_color()

Resets the colors back to default.

### Prototype

```c
int crossterm_style_reset_color(void);
```
"""
function crossterm_style_reset_color()
  @ccall libcrossterm.crossterm_style_reset_color()::Cint
end

"""
    crossterm_style_set_attribute(attr)

Sets an attribute.

See [`Attribute`] for more info.

### Prototype

```c
int crossterm_style_set_attribute(crossterm_Attribute attr);
```
"""
function crossterm_style_set_attribute(attr)
  @ccall libcrossterm.crossterm_style_set_attribute(attr::crossterm_Attribute)::Cint
end

"""
    crossterm_style_set_background_color(color)

Sets the the background color.

See [`Color`] for more info.

### Prototype

```c
int crossterm_style_set_background_color(crossterm_Color color);
```
"""
function crossterm_style_set_background_color(color)
  @ccall libcrossterm.crossterm_style_set_background_color(color::crossterm_Color)::Cint
end

"""
    crossterm_style_set_foreground_color(color)

Sets the the foreground color.

See [`Color`] for more info.

### Prototype

```c
int crossterm_style_set_foreground_color(crossterm_Color color);
```
"""
function crossterm_style_set_foreground_color(color)
  @ccall libcrossterm.crossterm_style_set_foreground_color(color::crossterm_Color)::Cint
end

"""
    crossterm_style_set_underline_color(color)

Sets the the underline color.

See [`Color`] for more info.

### Prototype

```c
int crossterm_style_set_underline_color(crossterm_Color color);
```
"""
function crossterm_style_set_underline_color(color)
  @ccall libcrossterm.crossterm_style_set_underline_color(color::crossterm_Color)::Cint
end

"""
    crossterm_terminal_begin_synchronized_update()

A command that instructs the terminal emulator to being a synchronized frame.

# Notes

  - Commands must be executed/queued for execution otherwise they do nothing. * Use [[`crossterm_terminal_end_synchronized_update`](@ref)] command to leave the entered alternate screen.

When rendering the screen of the terminal, the Emulator usually iterates through each visible grid cell and renders its current state. With applications updating the screen a at higher frequency this can cause tearing.

This mode attempts to mitigate that.

When the synchronization mode is enabled following render calls will keep rendering the last rendered state. The terminal Emulator keeps processing incoming text and sequences. When the synchronized update mode is disabled again the renderer may fetch the latest screen buffer state again, effectively avoiding the tearing effect by unintentionally rendering in the middle a of an application screen update.

### Prototype

```c
int crossterm_terminal_begin_synchronized_update(void);
```
"""
function crossterm_terminal_begin_synchronized_update()
  @ccall libcrossterm.crossterm_terminal_begin_synchronized_update()::Cint
end

"""
    crossterm_terminal_clear(ct)

Clear screen command.

### Prototype

```c
int crossterm_terminal_clear(crossterm_ClearType ct);
```
"""
function crossterm_terminal_clear(ct)
  @ccall libcrossterm.crossterm_terminal_clear(ct::crossterm_ClearType)::Cint
end

"""
    crossterm_terminal_disable_raw_mode()

Disables raw mode.

### Prototype

```c
int crossterm_terminal_disable_raw_mode(void);
```
"""
function crossterm_terminal_disable_raw_mode()
  @ccall libcrossterm.crossterm_terminal_disable_raw_mode()::Cint
end

"""
    crossterm_terminal_enable_raw_mode()

Enables raw mode.

### Prototype

```c
int crossterm_terminal_enable_raw_mode(void);
```
"""
function crossterm_terminal_enable_raw_mode()
  @ccall libcrossterm.crossterm_terminal_enable_raw_mode()::Cint
end

"""
    crossterm_terminal_end_synchronized_update()

A command that instructs the terminal to end a synchronized frame.

# Notes

  - Commands must be executed/queued for execution otherwise they do nothing. * Use [[`crossterm_terminal_begin_synchronized_update`](@ref)] to enter the alternate screen.

When rendering the screen of the terminal, the Emulator usually iterates through each visible grid cell and renders its current state. With applications updating the screen a at higher frequency this can cause tearing.

This mode attempts to mitigate that.

When the synchronization mode is enabled following render calls will keep rendering the last rendered state. The terminal Emulator keeps processing incoming text and sequences. When the synchronized update mode is disabled again the renderer may fetch the latest screen buffer state again, effectively avoiding the tearing effect by unintentionally rendering in the middle a of an application screen update.

### Prototype

```c
int crossterm_terminal_end_synchronized_update(void);
```
"""
function crossterm_terminal_end_synchronized_update()
  @ccall libcrossterm.crossterm_terminal_end_synchronized_update()::Cint
end

"""
    crossterm_terminal_scroll_down(n)

Scroll down command.

### Prototype

```c
int crossterm_terminal_scroll_down(unsigned short n);
```
"""
function crossterm_terminal_scroll_down(n)
  @ccall libcrossterm.crossterm_terminal_scroll_down(n::Cushort)::Cint
end

"""
    crossterm_terminal_scroll_up(n)

Scroll up command.

### Prototype

```c
int crossterm_terminal_scroll_up(unsigned short n);
```
"""
function crossterm_terminal_scroll_up(n)
  @ccall libcrossterm.crossterm_terminal_scroll_up(n::Cushort)::Cint
end

"""
    crossterm_terminal_set_size(columns, rows)

Sets the terminal buffer size `(columns, rows)`.

### Prototype

```c
int crossterm_terminal_set_size(uint16_t columns, uint16_t rows);
```
"""
function crossterm_terminal_set_size(columns, rows)
  @ccall libcrossterm.crossterm_terminal_set_size(columns::UInt16, rows::UInt16)::Cint
end

"""
    crossterm_terminal_set_title(title)

Sets terminal title.

This function borrows a slice to title and expects the user to clean up the allocated memory

### Prototype

```c
int crossterm_terminal_set_title(const char *title);
```
"""
function crossterm_terminal_set_title(title)
  @ccall libcrossterm.crossterm_terminal_set_title(title::Ptr{Cchar})::Cint
end

"""
    crossterm_terminal_size(size)

Get terminal size

### Prototype

```c
int crossterm_terminal_size(crossterm_TerminalSize *size);
```
"""
function crossterm_terminal_size(size)
  @ccall libcrossterm.crossterm_terminal_size(size::Ptr{crossterm_TerminalSize})::Cint
end

# exports
const PREFIXES = ["crossterm_"]
for name in names(@__MODULE__; all = true), prefix in PREFIXES
  if startswith(string(name), prefix)
    @eval export $name
  end
end

end # module
