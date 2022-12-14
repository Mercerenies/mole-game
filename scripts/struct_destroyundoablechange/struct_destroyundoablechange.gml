
function DestroyUndoableChange(_obj) : UndoableChange() constructor {
  obj = _obj;

  static undo = function() {
    obj.x += DISAPPEAR_DIST;
    obj.onResurrect();
  }

  static apply = function() {
    // Move out of sight and out of collisions (but don't destroy, so we
    // can still undo with this instance ID)
    obj.x -= DISAPPEAR_DIST;
  }

  static can_apply = function() {
    return obj.x > -100;
  }

}
