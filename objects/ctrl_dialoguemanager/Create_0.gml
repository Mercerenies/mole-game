
_queue = ds_queue_create();

_face = DialogueFace.MARTY;
_display_text = "";
_text = "";

advance = function() {
  if (ds_queue_empty(_queue)) {
    _face = DialogueFace.MARTY;
    _text = "";
    _display_text = "";
  } else {
    var next = ds_queue_dequeue(_queue);
    if (next.isRun()) {
      next.run();
      advance();
    } else {
      _face = next.face;
      _text = next.text;
      _display_text = "";
    }
  }
}

advanceIfEmpty = function() {
  if (_text == "") {
    advance();
  }
}

// Initializer (will be set in creation code and called at room start)
init = function() {}