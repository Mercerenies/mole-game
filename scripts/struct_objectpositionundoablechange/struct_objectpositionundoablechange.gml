
// Should be used with a par_PhysicsObject only.
function ObjectPositionUndoableChange(_obj, _oldX, _oldY, _x, _y) : UndoableChange() constructor {
  obj = _obj;
  oldX = _oldX;
  oldY = _oldY;
  xx = _x;
  yy = _y;

  static undo = function() {
    obj.x = oldX;
    obj.y = oldY;
    obj.onUndoMove();
  }

  static apply = function() {
    obj.x = xx;
    obj.y = yy;
  }

}
