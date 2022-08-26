
function DestroyUndoableChange(_obj) : UndoableChange() constructor {
  obj = _obj;

  static undo = function() {
    obj.x += DISAPPEAR_DIST;
  }

  static apply = function() {
    // Move out of sight and out of collisions (but don't destroy, so we
    // can still undo with this instance ID)
    obj.x -= DISAPPEAR_DIST;
  }

}
