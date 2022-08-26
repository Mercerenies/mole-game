
function GameOverUndoableChange() : UndoableChange() constructor {

  static undo = function() {
    ctrl_Game.gameOver = false;
  }

  static can_apply = function() {
    return !ctrl_Game.gameOver;
  }

  static apply = function() {
    ctrl_Game.gameOver = true;
  }

}
