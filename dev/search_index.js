var documenterSearchIndex = {"docs":
[{"location":"","page":"Home","title":"Home","text":"CurrentModule = Crossterm","category":"page"},{"location":"#Crossterm.jl:-A-Cross-platform-Terminal-Manipulation-Library-in-Julia","page":"Home","title":"Crossterm.jl: A Cross-platform Terminal Manipulation Library in Julia","text":"","category":"section"},{"location":"","page":"Home","title":"Home","text":"Crossterm is a Julia terminal manipulation library designed to write cross-platform text-based interfaces based on crossterm-rs/crossterm. It supports all UNIX and Windows terminals down to Windows 7.","category":"page"},{"location":"","page":"Home","title":"Home","text":"The Julia interface provides simpler interface with functions like:","category":"page"},{"location":"","page":"Home","title":"Home","text":"hide()\nshow()\nup()\ndown()\nleft()\nright()\nnext()\nprev()","category":"page"},{"location":"","page":"Home","title":"Home","text":"and more.","category":"page"},{"location":"","page":"Home","title":"Home","text":"See API documentation below.","category":"page"},{"location":"","page":"Home","title":"Home","text":"Modules = [Crossterm]","category":"page"},{"location":"#Crossterm.alternate_screen","page":"Home","title":"Crossterm.alternate_screen","text":"Enter or leave the alternate screen buffer of the terminal.\n\n\n\n\n\n","category":"function"},{"location":"#Crossterm.attribute-Tuple{Crossterm.Attribute.T}","page":"Home","title":"Crossterm.attribute","text":"Set the text attribute in the terminal.\n\n\n\n\n\n","category":"method"},{"location":"#Crossterm.blinking","page":"Home","title":"Crossterm.blinking","text":"Enable or disable cursor blinking in the terminal.\n\n\n\n\n\n","category":"function"},{"location":"#Crossterm.bracketed_paste","page":"Home","title":"Crossterm.bracketed_paste","text":"Enable or disable bracketed paste mode in the terminal.\n\n\n\n\n\n","category":"function"},{"location":"#Crossterm.clear","page":"Home","title":"Crossterm.clear","text":"Clear the terminal screen or a part of it.\n\n\n\n\n\n","category":"function"},{"location":"#Crossterm.clear_last_error-Tuple{}","page":"Home","title":"Crossterm.clear_last_error","text":"Clear the last error message stored by the crossterm library.\n\n\n\n\n\n","category":"method"},{"location":"#Crossterm.column","page":"Home","title":"Crossterm.column","text":"Move the terminal cursor to the column.\n\n\n\n\n\n","category":"function"},{"location":"#Crossterm.down","page":"Home","title":"Crossterm.down","text":"Move the terminal cursor down by rows number of rows.\n\n\n\n\n\n","category":"function"},{"location":"#Crossterm.focus_change","page":"Home","title":"Crossterm.focus_change","text":"Enable or disable focus change event reporting in the terminal.\n\n\n\n\n\n","category":"function"},{"location":"#Crossterm.hide-Tuple{}","page":"Home","title":"Crossterm.hide","text":"Hide the terminal cursor.\n\n\n\n\n\n","category":"method"},{"location":"#Crossterm.keyboard_enchancement_flags","page":"Home","title":"Crossterm.keyboard_enchancement_flags","text":"Push or pop the keyboard enhancement flags.\n\n\n\n\n\n","category":"function"},{"location":"#Crossterm.last_error_message-Tuple{}","page":"Home","title":"Crossterm.last_error_message","text":"Return the most recent error message from the crossterm library.\n\n\n\n\n\n","category":"method"},{"location":"#Crossterm.left","page":"Home","title":"Crossterm.left","text":"Move the terminal cursor left by columns number of columns.\n\n\n\n\n\n","category":"function"},{"location":"#Crossterm.line_wrap","page":"Home","title":"Crossterm.line_wrap","text":"Enable or disable line wrapping in the terminal.\n\n\n\n\n\n","category":"function"},{"location":"#Crossterm.mouse_capture","page":"Home","title":"Crossterm.mouse_capture","text":"Enable or disable mouse capture event reporting in the terminal.\n\n\n\n\n\n","category":"function"},{"location":"#Crossterm.next","page":"Home","title":"Crossterm.next","text":"Move the terminal cursor to the next line n times.\n\n\n\n\n\n","category":"function"},{"location":"#Crossterm.poll","page":"Home","title":"Crossterm.poll","text":"Poll the terminal for input events.\n\n\n\n\n\n","category":"function"},{"location":"#Crossterm.position-Tuple{NamedTuple{(:x, :y), Tuple{Int64, Int64}}}","page":"Home","title":"Crossterm.position","text":"Set the position of the terminal cursor to p coordinates.\n\n\n\n\n\n","category":"method"},{"location":"#Crossterm.position-Tuple{}","page":"Home","title":"Crossterm.position","text":"Get the current position of the terminal cursor.\n\n\n\n\n\n","category":"method"},{"location":"#Crossterm.prev","page":"Home","title":"Crossterm.prev","text":"Move the terminal cursor to the previous line n times.\n\n\n\n\n\n","category":"function"},{"location":"#Crossterm.raw_mode","page":"Home","title":"Crossterm.raw_mode","text":"Enable or disable raw mode in the terminal.\n\n\n\n\n\n","category":"function"},{"location":"#Crossterm.read-Tuple{}","page":"Home","title":"Crossterm.read","text":"Read an event from the terminal.\n\n\n\n\n\n","category":"method"},{"location":"#Crossterm.reset_color-Tuple{}","page":"Home","title":"Crossterm.reset_color","text":"Reset terminal colors to default.\n\n\n\n\n\n","category":"method"},{"location":"#Crossterm.restore-Tuple{}","page":"Home","title":"Crossterm.restore","text":"Restore the terminal cursor to the last saved position.\n\n\n\n\n\n","category":"method"},{"location":"#Crossterm.right","page":"Home","title":"Crossterm.right","text":"Move the terminal cursor right by columns number of columns.\n\n\n\n\n\n","category":"function"},{"location":"#Crossterm.row","page":"Home","title":"Crossterm.row","text":"Move the terminal cursor to the row.\n\n\n\n\n\n","category":"function"},{"location":"#Crossterm.save-Tuple{}","page":"Home","title":"Crossterm.save","text":"Save the current position of the terminal cursor.\n\n\n\n\n\n","category":"method"},{"location":"#Crossterm.scroll_down","page":"Home","title":"Crossterm.scroll_down","text":"Scroll the terminal screen down by n lines.\n\n\n\n\n\n","category":"function"},{"location":"#Crossterm.scroll_up","page":"Home","title":"Crossterm.scroll_up","text":"Scroll the terminal screen up by n lines.\n\n\n\n\n\n","category":"function"},{"location":"#Crossterm.show-Tuple{}","page":"Home","title":"Crossterm.show","text":"Show the terminal cursor.\n\n\n\n\n\n","category":"method"},{"location":"#Crossterm.size-Tuple{NamedTuple{(:x, :y), Tuple{Int64, Int64}}}","page":"Home","title":"Crossterm.size","text":"Set the size of the terminal.\n\n\n\n\n\n","category":"method"},{"location":"#Crossterm.size-Tuple{}","page":"Home","title":"Crossterm.size","text":"Get the size of the terminal.\n\n\n\n\n\n","category":"method"},{"location":"#Crossterm.style-Tuple{Crossterm.Style.T}","page":"Home","title":"Crossterm.style","text":"Set the style of the terminal cursor.\n\n\n\n\n\n","category":"method"},{"location":"#Crossterm.title-Tuple{Any}","page":"Home","title":"Crossterm.title","text":"Set the title of the terminal.\n\n\n\n\n\n","category":"method"},{"location":"#Crossterm.to-Tuple{}","page":"Home","title":"Crossterm.to","text":"Move the terminal cursor to the specified (x, y) coordinates.\n\n\n\n\n\n","category":"method"},{"location":"#Crossterm.up","page":"Home","title":"Crossterm.up","text":"Move the terminal cursor up by rows number of rows.\n\n\n\n\n\n","category":"function"},{"location":"","page":"Home","title":"Home","text":"Full C-API documentation is below","category":"page"},{"location":"","page":"Home","title":"Home","text":"Modules = [Crossterm.LibCrossterm]","category":"page"},{"location":"#Crossterm.LibCrossterm.crossterm_ClearType","page":"Home","title":"Crossterm.LibCrossterm.crossterm_ClearType","text":"crossterm_ClearType\n\nDifferent ways to clear the terminal buffer.\n\n\n\n\n\n","category":"type"},{"location":"#Crossterm.LibCrossterm.crossterm_CursorPosition","page":"Home","title":"Crossterm.LibCrossterm.crossterm_CursorPosition","text":"crossterm_CursorPosition\n\nCursorPosition struct\n\n\n\n\n\n","category":"type"},{"location":"#Crossterm.LibCrossterm.crossterm_CursorStyle","page":"Home","title":"Crossterm.LibCrossterm.crossterm_CursorStyle","text":"crossterm_CursorStyle\n\nStyle of the cursor. It uses two types of escape codes, one to control blinking, and the other the shape.\n\n\n\n\n\n","category":"type"},{"location":"#Crossterm.LibCrossterm.crossterm_TerminalSize","page":"Home","title":"Crossterm.LibCrossterm.crossterm_TerminalSize","text":"crossterm_TerminalSize\n\nTerminalSize\n\n\n\n\n\n","category":"type"},{"location":"#Crossterm.LibCrossterm.crossterm_clear_last_error-Tuple{}","page":"Home","title":"Crossterm.LibCrossterm.crossterm_clear_last_error","text":"crossterm_clear_last_error()\n\nPrototype\n\nvoid crossterm_clear_last_error(void);\n\n\n\n\n\n","category":"method"},{"location":"#Crossterm.LibCrossterm.crossterm_cursor_disable_blinking-Tuple{}","page":"Home","title":"Crossterm.LibCrossterm.crossterm_cursor_disable_blinking","text":"crossterm_cursor_disable_blinking()\n\nDisables blinking of the terminal cursor.\n\nPrototype\n\nint crossterm_cursor_disable_blinking(void);\n\n\n\n\n\n","category":"method"},{"location":"#Crossterm.LibCrossterm.crossterm_cursor_enable_blinking-Tuple{}","page":"Home","title":"Crossterm.LibCrossterm.crossterm_cursor_enable_blinking","text":"crossterm_cursor_enable_blinking()\n\nEnables blinking of the terminal cursor.\n\nPrototype\n\nint crossterm_cursor_enable_blinking(void);\n\n\n\n\n\n","category":"method"},{"location":"#Crossterm.LibCrossterm.crossterm_cursor_hide-Tuple{}","page":"Home","title":"Crossterm.LibCrossterm.crossterm_cursor_hide","text":"crossterm_cursor_hide()\n\nHides the terminal cursor.\n\nPrototype\n\nint crossterm_cursor_hide(void);\n\n\n\n\n\n","category":"method"},{"location":"#Crossterm.LibCrossterm.crossterm_cursor_move_down-Tuple{Any}","page":"Home","title":"Crossterm.LibCrossterm.crossterm_cursor_move_down","text":"crossterm_cursor_move_down(rows)\n\nMoves the terminal cursor a given number of rows down.\n\nPrototype\n\nint crossterm_cursor_move_down(uint16_t rows);\n\n\n\n\n\n","category":"method"},{"location":"#Crossterm.LibCrossterm.crossterm_cursor_move_left-Tuple{Any}","page":"Home","title":"Crossterm.LibCrossterm.crossterm_cursor_move_left","text":"crossterm_cursor_move_left(columns)\n\nMoves the terminal cursor a given number of columns to the left.\n\nPrototype\n\nint crossterm_cursor_move_left(uint16_t columns);\n\n\n\n\n\n","category":"method"},{"location":"#Crossterm.LibCrossterm.crossterm_cursor_move_right-Tuple{Any}","page":"Home","title":"Crossterm.LibCrossterm.crossterm_cursor_move_right","text":"crossterm_cursor_move_right(columns)\n\nMoves the terminal cursor a given number of columns to the right.\n\nPrototype\n\nint crossterm_cursor_move_right(uint16_t columns);\n\n\n\n\n\n","category":"method"},{"location":"#Crossterm.LibCrossterm.crossterm_cursor_move_to_column-Tuple{Any}","page":"Home","title":"Crossterm.LibCrossterm.crossterm_cursor_move_to_column","text":"crossterm_cursor_move_to_column(column)\n\nMoves the terminal cursor to the given column on the current row.\n\nPrototype\n\nint crossterm_cursor_move_to_column(uint16_t column);\n\n\n\n\n\n","category":"method"},{"location":"#Crossterm.LibCrossterm.crossterm_cursor_move_to_next_line-Tuple{Any}","page":"Home","title":"Crossterm.LibCrossterm.crossterm_cursor_move_to_next_line","text":"crossterm_cursor_move_to_next_line(n)\n\nMoves the terminal cursor down the given number of lines and moves it to the first column.\n\nNotes * This command is 1 based, meaning [crosstermcursormovetonext_line](@ref)(1) moves to the next line. * Most terminals default 0 argument to 1.\n\nPrototype\n\nint crossterm_cursor_move_to_next_line(uint16_t n);\n\n\n\n\n\n","category":"method"},{"location":"#Crossterm.LibCrossterm.crossterm_cursor_move_to_previous_line-Tuple{Any}","page":"Home","title":"Crossterm.LibCrossterm.crossterm_cursor_move_to_previous_line","text":"crossterm_cursor_move_to_previous_line(n)\n\nMoves the terminal cursor up the given number of lines and moves it to the first column.\n\nPrototype\n\nint crossterm_cursor_move_to_previous_line(uint16_t n);\n\n\n\n\n\n","category":"method"},{"location":"#Crossterm.LibCrossterm.crossterm_cursor_move_to_row-Tuple{Any}","page":"Home","title":"Crossterm.LibCrossterm.crossterm_cursor_move_to_row","text":"crossterm_cursor_move_to_row(row)\n\nMoves the terminal cursor to the given row on the current column.\n\nPrototype\n\nint crossterm_cursor_move_to_row(uint16_t row);\n\n\n\n\n\n","category":"method"},{"location":"#Crossterm.LibCrossterm.crossterm_cursor_move_up-Tuple{Any}","page":"Home","title":"Crossterm.LibCrossterm.crossterm_cursor_move_up","text":"crossterm_cursor_move_up(rows)\n\nMoves the terminal cursor a given number of rows up.\n\nPrototype\n\nint crossterm_cursor_move_up(uint16_t rows);\n\n\n\n\n\n","category":"method"},{"location":"#Crossterm.LibCrossterm.crossterm_cursor_moveto-Tuple{Any, Any}","page":"Home","title":"Crossterm.LibCrossterm.crossterm_cursor_moveto","text":"crossterm_cursor_moveto(x, y)\n\nMoves the terminal cursor to the given position (column, row).\n\nNotes * Top left cell is represented as 0,0.\n\nPrototype\n\nint crossterm_cursor_moveto(uint16_t x, uint16_t y);\n\n\n\n\n\n","category":"method"},{"location":"#Crossterm.LibCrossterm.crossterm_cursor_position_get-Tuple{Any}","page":"Home","title":"Crossterm.LibCrossterm.crossterm_cursor_position_get","text":"crossterm_cursor_position_get(pos)\n\nGet cursor position (column, row)\n\nPrototype\n\nint crossterm_cursor_position_get(crossterm_CursorPosition *pos);\n\n\n\n\n\n","category":"method"},{"location":"#Crossterm.LibCrossterm.crossterm_cursor_position_set-Tuple{Any}","page":"Home","title":"Crossterm.LibCrossterm.crossterm_cursor_position_set","text":"crossterm_cursor_position_set(pos)\n\nSet cursor position (column, row)\n\nPrototype\n\nint crossterm_cursor_position_set(crossterm_CursorPosition pos);\n\n\n\n\n\n","category":"method"},{"location":"#Crossterm.LibCrossterm.crossterm_cursor_restore_position-Tuple{}","page":"Home","title":"Crossterm.LibCrossterm.crossterm_cursor_restore_position","text":"crossterm_cursor_restore_position()\n\nRestores the saved terminal cursor position.\n\nPrototype\n\nint crossterm_cursor_restore_position(void);\n\n\n\n\n\n","category":"method"},{"location":"#Crossterm.LibCrossterm.crossterm_cursor_save_position-Tuple{}","page":"Home","title":"Crossterm.LibCrossterm.crossterm_cursor_save_position","text":"crossterm_cursor_save_position()\n\nSaves the current terminal cursor position.\n\nPrototype\n\nint crossterm_cursor_save_position(void);\n\n\n\n\n\n","category":"method"},{"location":"#Crossterm.LibCrossterm.crossterm_cursor_set_style-Tuple{Any}","page":"Home","title":"Crossterm.LibCrossterm.crossterm_cursor_set_style","text":"crossterm_cursor_set_style(cursor_style)\n\nSets the style of the cursor.\n\nPrototype\n\nint crossterm_cursor_set_style(crossterm_CursorStyle cursor_style);\n\n\n\n\n\n","category":"method"},{"location":"#Crossterm.LibCrossterm.crossterm_cursor_set_style_blinking_bar-Tuple{}","page":"Home","title":"Crossterm.LibCrossterm.crossterm_cursor_set_style_blinking_bar","text":"crossterm_cursor_set_style_blinking_bar()\n\nSets the style of the cursor to a blinking bar.\n\nPrototype\n\nint crossterm_cursor_set_style_blinking_bar(void);\n\n\n\n\n\n","category":"method"},{"location":"#Crossterm.LibCrossterm.crossterm_cursor_set_style_blinking_block-Tuple{}","page":"Home","title":"Crossterm.LibCrossterm.crossterm_cursor_set_style_blinking_block","text":"crossterm_cursor_set_style_blinking_block()\n\nSets the style of the cursor to a blinking block.\n\nPrototype\n\nint crossterm_cursor_set_style_blinking_block(void);\n\n\n\n\n\n","category":"method"},{"location":"#Crossterm.LibCrossterm.crossterm_cursor_set_style_blinking_underscore-Tuple{}","page":"Home","title":"Crossterm.LibCrossterm.crossterm_cursor_set_style_blinking_underscore","text":"crossterm_cursor_set_style_blinking_underscore()\n\nSets the style of the cursor to a blinking underscore.\n\nPrototype\n\nint crossterm_cursor_set_style_blinking_underscore(void);\n\n\n\n\n\n","category":"method"},{"location":"#Crossterm.LibCrossterm.crossterm_cursor_set_style_default_user_shape-Tuple{}","page":"Home","title":"Crossterm.LibCrossterm.crossterm_cursor_set_style_default_user_shape","text":"crossterm_cursor_set_style_default_user_shape()\n\nSets the style of the cursor to default user shape.\n\nPrototype\n\nint crossterm_cursor_set_style_default_user_shape(void);\n\n\n\n\n\n","category":"method"},{"location":"#Crossterm.LibCrossterm.crossterm_cursor_set_style_steady_bar-Tuple{}","page":"Home","title":"Crossterm.LibCrossterm.crossterm_cursor_set_style_steady_bar","text":"crossterm_cursor_set_style_steady_bar()\n\nSets the style of the cursor to a steady bar.\n\nPrototype\n\nint crossterm_cursor_set_style_steady_bar(void);\n\n\n\n\n\n","category":"method"},{"location":"#Crossterm.LibCrossterm.crossterm_cursor_set_style_steady_block-Tuple{}","page":"Home","title":"Crossterm.LibCrossterm.crossterm_cursor_set_style_steady_block","text":"crossterm_cursor_set_style_steady_block()\n\nSets the style of the cursor to a steady block.\n\nPrototype\n\nint crossterm_cursor_set_style_steady_block(void);\n\n\n\n\n\n","category":"method"},{"location":"#Crossterm.LibCrossterm.crossterm_cursor_set_style_steady_underscore-Tuple{}","page":"Home","title":"Crossterm.LibCrossterm.crossterm_cursor_set_style_steady_underscore","text":"crossterm_cursor_set_style_steady_underscore()\n\nSets the style of the cursor to a steady underscore.\n\nPrototype\n\nint crossterm_cursor_set_style_steady_underscore(void);\n\n\n\n\n\n","category":"method"},{"location":"#Crossterm.LibCrossterm.crossterm_cursor_show-Tuple{}","page":"Home","title":"Crossterm.LibCrossterm.crossterm_cursor_show","text":"crossterm_cursor_show()\n\nShows the terminal cursor.\n\nPrototype\n\nint crossterm_cursor_show(void);\n\n\n\n\n\n","category":"method"},{"location":"#Crossterm.LibCrossterm.crossterm_disable_line_wrap-Tuple{}","page":"Home","title":"Crossterm.LibCrossterm.crossterm_disable_line_wrap","text":"crossterm_disable_line_wrap()\n\nDisables line wrapping.\n\nPrototype\n\nint crossterm_disable_line_wrap(void);\n\n\n\n\n\n","category":"method"},{"location":"#Crossterm.LibCrossterm.crossterm_enable_line_wrap-Tuple{}","page":"Home","title":"Crossterm.LibCrossterm.crossterm_enable_line_wrap","text":"crossterm_enable_line_wrap()\n\nEnables line wrapping.\n\nPrototype\n\nint crossterm_enable_line_wrap(void);\n\n\n\n\n\n","category":"method"},{"location":"#Crossterm.LibCrossterm.crossterm_enter_alternate_screen-Tuple{}","page":"Home","title":"Crossterm.LibCrossterm.crossterm_enter_alternate_screen","text":"crossterm_enter_alternate_screen()\n\nEnters alternate screen.\n\nPrototype\n\nint crossterm_enter_alternate_screen(void);\n\n\n\n\n\n","category":"method"},{"location":"#Crossterm.LibCrossterm.crossterm_event_disable_bracketed_paste-Tuple{}","page":"Home","title":"Crossterm.LibCrossterm.crossterm_event_disable_bracketed_paste","text":"crossterm_event_disable_bracketed_paste()\n\nDisables bracketed paste mode.\n\nPrototype\n\nint crossterm_event_disable_bracketed_paste(void);\n\n\n\n\n\n","category":"method"},{"location":"#Crossterm.LibCrossterm.crossterm_event_disable_focus_change-Tuple{}","page":"Home","title":"Crossterm.LibCrossterm.crossterm_event_disable_focus_change","text":"crossterm_event_disable_focus_change()\n\nDisable focus event emission.\n\nPrototype\n\nint crossterm_event_disable_focus_change(void);\n\n\n\n\n\n","category":"method"},{"location":"#Crossterm.LibCrossterm.crossterm_event_disable_mouse_capture-Tuple{}","page":"Home","title":"Crossterm.LibCrossterm.crossterm_event_disable_mouse_capture","text":"crossterm_event_disable_mouse_capture()\n\nDisable mouse event capturing.\n\nPrototype\n\nint crossterm_event_disable_mouse_capture(void);\n\n\n\n\n\n","category":"method"},{"location":"#Crossterm.LibCrossterm.crossterm_event_enable_bracketed_paste-Tuple{}","page":"Home","title":"Crossterm.LibCrossterm.crossterm_event_enable_bracketed_paste","text":"crossterm_event_enable_bracketed_paste()\n\nEnables bracketed paste mode.\n\nIt should be paired with [crossterm_event_disable_bracketed_paste] at the end of execution.\n\nThis is not supported in older Windows terminals without virtual terminal sequences.\n\nPrototype\n\nint crossterm_event_enable_bracketed_paste(void);\n\n\n\n\n\n","category":"method"},{"location":"#Crossterm.LibCrossterm.crossterm_event_enable_focus_change-Tuple{}","page":"Home","title":"Crossterm.LibCrossterm.crossterm_event_enable_focus_change","text":"crossterm_event_enable_focus_change()\n\nEnable focus event emission.\n\nIt should be paired with [crossterm_event_disable_focus_change] at the end of execution.\n\nFocus events can be captured with [crossterm_event_read].\n\nPrototype\n\nint crossterm_event_enable_focus_change(void);\n\n\n\n\n\n","category":"method"},{"location":"#Crossterm.LibCrossterm.crossterm_event_enable_mouse_capture-Tuple{}","page":"Home","title":"Crossterm.LibCrossterm.crossterm_event_enable_mouse_capture","text":"crossterm_event_enable_mouse_capture()\n\nEnable mouse event capturing.\n\nPrototype\n\nint crossterm_event_enable_mouse_capture(void);\n\n\n\n\n\n","category":"method"},{"location":"#Crossterm.LibCrossterm.crossterm_event_poll-Tuple{Any, Any}","page":"Home","title":"Crossterm.LibCrossterm.crossterm_event_poll","text":"crossterm_event_poll(secs, nanos)\n\nChecks if there is an Event available.\n\nReturns true if an Event is available otherwise it returns false.\n\ntrue guarantees that subsequent call to the [crossterm_event_read] function won't block.\n\nArguments\n\ntimeout_secs - maximum waiting time for event availability * timeout_nanos - maximum waiting time for event availability\n\nPrototype\n\nint crossterm_event_poll(uint64_t secs, uint32_t nanos);\n\n\n\n\n\n","category":"method"},{"location":"#Crossterm.LibCrossterm.crossterm_event_pop_keyboard_enhancement_flags-Tuple{}","page":"Home","title":"Crossterm.LibCrossterm.crossterm_event_pop_keyboard_enhancement_flags","text":"crossterm_event_pop_keyboard_enhancement_flags()\n\nDisables extra kinds of keyboard events.\n\nPrototype\n\nint crossterm_event_pop_keyboard_enhancement_flags(void);\n\n\n\n\n\n","category":"method"},{"location":"#Crossterm.LibCrossterm.crossterm_event_push_keyboard_enhancement_flags-Tuple{Any}","page":"Home","title":"Crossterm.LibCrossterm.crossterm_event_push_keyboard_enhancement_flags","text":"crossterm_event_push_keyboard_enhancement_flags(flags)\n\nEnables the kitty keyboard protocol, which adds extra information to keyboard events and removes ambiguity for modifier keys. It should be paired with [crossterm_pop_keyboard_enhancement_flags] at the end of execution.\n\nPrototype\n\nint crossterm_event_push_keyboard_enhancement_flags(uint8_t flags);\n\n\n\n\n\n","category":"method"},{"location":"#Crossterm.LibCrossterm.crossterm_event_read-Tuple{}","page":"Home","title":"Crossterm.LibCrossterm.crossterm_event_read","text":"crossterm_event_read()\n\nReads a single Event as a UTF-8 json string.\n\nThis function blocks until an Event is available. Combine it with the [crossterm_event_poll] function to get non-blocking reads. User is responsible to free string. Use [crossterm_free_c_char] to free data\n\nPrototype\n\nconst char *crossterm_event_read(void);\n\n\n\n\n\n","category":"method"},{"location":"#Crossterm.LibCrossterm.crossterm_free_c_char-Tuple{Any}","page":"Home","title":"Crossterm.LibCrossterm.crossterm_free_c_char","text":"crossterm_free_c_char(s)\n\nPrototype\n\nint crossterm_free_c_char(char *s);\n\n\n\n\n\n","category":"method"},{"location":"#Crossterm.LibCrossterm.crossterm_has_error-Tuple{}","page":"Home","title":"Crossterm.LibCrossterm.crossterm_has_error","text":"crossterm_has_error()\n\nCheck whether error has been set.\n\nPrototype\n\nbool crossterm_has_error(void);\n\n\n\n\n\n","category":"method"},{"location":"#Crossterm.LibCrossterm.crossterm_last_error_length-Tuple{}","page":"Home","title":"Crossterm.LibCrossterm.crossterm_last_error_length","text":"crossterm_last_error_length()\n\nCalculate the number of bytes in the last error's error message including a trailing null character. If there are no recent error, then this returns 0.\n\nPrototype\n\nint crossterm_last_error_length(void);\n\n\n\n\n\n","category":"method"},{"location":"#Crossterm.LibCrossterm.crossterm_last_error_message-Tuple{}","page":"Home","title":"Crossterm.LibCrossterm.crossterm_last_error_message","text":"crossterm_last_error_message()\n\nReturn most recent error message into a UTF-8 string buffer.\n\nNull character is stored in the last location of buffer. Caller is responsible to memory associated with string buffer. Use [crossterm_free_c_char] to free data.\n\nPrototype\n\nconst char *crossterm_last_error_message(void);\n\n\n\n\n\n","category":"method"},{"location":"#Crossterm.LibCrossterm.crossterm_leave_alternate_screen-Tuple{}","page":"Home","title":"Crossterm.LibCrossterm.crossterm_leave_alternate_screen","text":"crossterm_leave_alternate_screen()\n\nLeaves alternate screen.\n\nPrototype\n\nint crossterm_leave_alternate_screen(void);\n\n\n\n\n\n","category":"method"},{"location":"#Crossterm.LibCrossterm.crossterm_sleep-Tuple{Any}","page":"Home","title":"Crossterm.LibCrossterm.crossterm_sleep","text":"crossterm_sleep(seconds)\n\nSleeps for seconds seconds\n\nPrototype\n\nvoid crossterm_sleep(double seconds);\n\n\n\n\n\n","category":"method"},{"location":"#Crossterm.LibCrossterm.crossterm_style_reset_color-Tuple{}","page":"Home","title":"Crossterm.LibCrossterm.crossterm_style_reset_color","text":"crossterm_style_reset_color()\n\nResets the colors back to default.\n\nPrototype\n\nint crossterm_style_reset_color(void);\n\n\n\n\n\n","category":"method"},{"location":"#Crossterm.LibCrossterm.crossterm_style_set_attribute-Tuple{Any}","page":"Home","title":"Crossterm.LibCrossterm.crossterm_style_set_attribute","text":"crossterm_style_set_attribute(attr)\n\nSets an attribute.\n\nSee [Attribute] for more info.\n\nPrototype\n\nint crossterm_style_set_attribute(crossterm_Attribute attr);\n\n\n\n\n\n","category":"method"},{"location":"#Crossterm.LibCrossterm.crossterm_style_set_background_color-Tuple{Any}","page":"Home","title":"Crossterm.LibCrossterm.crossterm_style_set_background_color","text":"crossterm_style_set_background_color(color)\n\nSets the the background color.\n\nSee [Color] for more info.\n\nPrototype\n\nint crossterm_style_set_background_color(crossterm_Color color);\n\n\n\n\n\n","category":"method"},{"location":"#Crossterm.LibCrossterm.crossterm_style_set_foreground_color-Tuple{Any}","page":"Home","title":"Crossterm.LibCrossterm.crossterm_style_set_foreground_color","text":"crossterm_style_set_foreground_color(color)\n\nSets the the foreground color.\n\nSee [Color] for more info.\n\nPrototype\n\nint crossterm_style_set_foreground_color(crossterm_Color color);\n\n\n\n\n\n","category":"method"},{"location":"#Crossterm.LibCrossterm.crossterm_style_set_underline_color-Tuple{Any}","page":"Home","title":"Crossterm.LibCrossterm.crossterm_style_set_underline_color","text":"crossterm_style_set_underline_color(color)\n\nSets the the underline color.\n\nSee [Color] for more info.\n\nPrototype\n\nint crossterm_style_set_underline_color(crossterm_Color color);\n\n\n\n\n\n","category":"method"},{"location":"#Crossterm.LibCrossterm.crossterm_terminal_begin_synchronized_update-Tuple{}","page":"Home","title":"Crossterm.LibCrossterm.crossterm_terminal_begin_synchronized_update","text":"crossterm_terminal_begin_synchronized_update()\n\nInstructs the terminal emulator to begin a synchronized frame.\n\nNotes\n\nCommands must be executed/queued for execution otherwise they do nothing. * Use [crossterm_terminal_end_synchronized_update] command to leave the entered alternate screen.\n\nWhen rendering the screen of the terminal, the Emulator usually iterates through each visible grid cell and renders its current state. With applications updating the screen a at higher frequency this can cause tearing.\n\nThis mode attempts to mitigate that.\n\nWhen the synchronization mode is enabled following render calls will keep rendering the last rendered state. The terminal Emulator keeps processing incoming text and sequences. When the synchronized update mode is disabled again the renderer may fetch the latest screen buffer state again, effectively avoiding the tearing effect by unintentionally rendering in the middle a of an application screen update.\n\nPrototype\n\nint crossterm_terminal_begin_synchronized_update(void);\n\n\n\n\n\n","category":"method"},{"location":"#Crossterm.LibCrossterm.crossterm_terminal_clear-Tuple{Any}","page":"Home","title":"Crossterm.LibCrossterm.crossterm_terminal_clear","text":"crossterm_terminal_clear(ct)\n\nClear screen command.\n\nPrototype\n\nint crossterm_terminal_clear(crossterm_ClearType ct);\n\n\n\n\n\n","category":"method"},{"location":"#Crossterm.LibCrossterm.crossterm_terminal_disable_raw_mode-Tuple{}","page":"Home","title":"Crossterm.LibCrossterm.crossterm_terminal_disable_raw_mode","text":"crossterm_terminal_disable_raw_mode()\n\nDisables raw mode.\n\nPrototype\n\nint crossterm_terminal_disable_raw_mode(void);\n\n\n\n\n\n","category":"method"},{"location":"#Crossterm.LibCrossterm.crossterm_terminal_enable_raw_mode-Tuple{}","page":"Home","title":"Crossterm.LibCrossterm.crossterm_terminal_enable_raw_mode","text":"crossterm_terminal_enable_raw_mode()\n\nEnables raw mode.\n\nPrototype\n\nint crossterm_terminal_enable_raw_mode(void);\n\n\n\n\n\n","category":"method"},{"location":"#Crossterm.LibCrossterm.crossterm_terminal_end_synchronized_update-Tuple{}","page":"Home","title":"Crossterm.LibCrossterm.crossterm_terminal_end_synchronized_update","text":"crossterm_terminal_end_synchronized_update()\n\nInstructs the terminal to end a synchronized frame.\n\nNotes\n\nCommands must be executed/queued for execution otherwise they do nothing. * Use [crossterm_terminal_begin_synchronized_update] to enter the alternate screen.\n\nWhen rendering the screen of the terminal, the Emulator usually iterates through each visible grid cell and renders its current state. With applications updating the screen a at higher frequency this can cause tearing.\n\nThis mode attempts to mitigate that.\n\nWhen the synchronization mode is enabled following render calls will keep rendering the last rendered state. The terminal Emulator keeps processing incoming text and sequences. When the synchronized update mode is disabled again the renderer may fetch the latest screen buffer state again, effectively avoiding the tearing effect by unintentionally rendering in the middle a of an application screen update.\n\nPrototype\n\nint crossterm_terminal_end_synchronized_update(void);\n\n\n\n\n\n","category":"method"},{"location":"#Crossterm.LibCrossterm.crossterm_terminal_scroll_down-Tuple{Any}","page":"Home","title":"Crossterm.LibCrossterm.crossterm_terminal_scroll_down","text":"crossterm_terminal_scroll_down(n)\n\nScroll down command.\n\nPrototype\n\nint crossterm_terminal_scroll_down(unsigned short n);\n\n\n\n\n\n","category":"method"},{"location":"#Crossterm.LibCrossterm.crossterm_terminal_scroll_up-Tuple{Any}","page":"Home","title":"Crossterm.LibCrossterm.crossterm_terminal_scroll_up","text":"crossterm_terminal_scroll_up(n)\n\nScroll up command.\n\nPrototype\n\nint crossterm_terminal_scroll_up(unsigned short n);\n\n\n\n\n\n","category":"method"},{"location":"#Crossterm.LibCrossterm.crossterm_terminal_set_size-Tuple{Any, Any}","page":"Home","title":"Crossterm.LibCrossterm.crossterm_terminal_set_size","text":"crossterm_terminal_set_size(columns, rows)\n\nSets the terminal buffer size (columns, rows).\n\nPrototype\n\nint crossterm_terminal_set_size(uint16_t columns, uint16_t rows);\n\n\n\n\n\n","category":"method"},{"location":"#Crossterm.LibCrossterm.crossterm_terminal_set_title-Tuple{Any}","page":"Home","title":"Crossterm.LibCrossterm.crossterm_terminal_set_title","text":"crossterm_terminal_set_title(title)\n\nSets terminal title.\n\nSafety\n\nThis function takes a raw pointer as argument. As such, the caller must ensure that: - The title pointer points to a valid null-terminated string. - This function borrows a slice to a valid null-terminated string and the memory referenced by title won't be deallocated or modified for the duration of the function call.. - The title pointer is correctly aligned and title points to an initialized memory.\n\nIf these conditions are not met, the behavior is undefined.\n\nPrototype\n\nint crossterm_terminal_set_title(const char *title);\n\n\n\n\n\n","category":"method"},{"location":"#Crossterm.LibCrossterm.crossterm_terminal_size-Tuple{Any}","page":"Home","title":"Crossterm.LibCrossterm.crossterm_terminal_size","text":"crossterm_terminal_size(size)\n\nGet terminal size\n\nPrototype\n\nint crossterm_terminal_size(crossterm_TerminalSize *size);\n\n\n\n\n\n","category":"method"}]
}
