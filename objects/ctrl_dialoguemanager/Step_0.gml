
_display_text = string_copy(_text, 1, string_length(_display_text) + 2);

if (_text != "") {
  if (isConfirmPressed()) {
    if (_display_text == _text) {
      advance();
    } else {
      _display_text = _text;
    }
  }
}