
function DestroySoftDirtUndoableChange(_dirtObject) : UndoableChange() constructor {
  dirtObject = _dirtObject;

  static undo = function() {
    dirtObject.x += 99999;
  }

  static apply = function() {
    // Move out of sight and out of collisions (but don't destroy, so we
    // can still undo with this instance ID)
    dirtObject.x -= 99999;
  }

}
