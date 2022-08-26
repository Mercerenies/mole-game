
function PlayerStateUndoableChange(_oldX, _oldY, _oldFacing, _x, _y, _facing) : UndoableChange() constructor {
  oldX = _oldX;
  oldY = _oldY;
  oldFacing = _oldFacing;
  xx = _x;
  yy = _y;
  facing = _facing;

  static undo = function() {
    obj_Mole.x = oldX;
    obj_Mole.y = oldY;
    obj_Mole._facing = oldFacing;
    obj_Mole._img_facing = oldFacing; // Prevents one frame of visual lag
  }

  static apply = function() {
    obj_Mole.x = xx;
    obj_Mole.y = yy;
    obj_Mole._facing = facing;
  }

}
