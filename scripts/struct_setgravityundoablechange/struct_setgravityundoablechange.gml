
function SetGravityUndoableChange(_oldGrav, _newGrav) : UndoableChange() constructor {
  oldGrav = _oldGrav;
  newGrav = _newGrav;

  static undo = function() {
    ctrl_Game.gravityDir = oldGrav;
    ctrl_Game._nextGravity = -1;
    ctrl_Game._lagFrame = -1;
  }

  static apply = function() {
    ctrl_Game.gravityDir = newGrav;
    ctrl_Game._nextGravity = -1;
    ctrl_Game._lagFrame = -1;
  }

}
