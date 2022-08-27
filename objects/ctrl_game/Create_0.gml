
_nextGravity = -1;
_lagFrame = -1;
gravityDir = Dir.DOWN;

gameOver = false;

getGravityDegrees = function() {
  return gravityDir * 90;
}

queueGravityChange = function(newGravity) {
  _nextGravity = newGravity;
}

isAnimating = function() {
  return (_nextGravity >= 0) || (_lagFrame >= 0);
}

loseGame = function() {
  undo_stack_apply_change(new GameOverUndoableChange());
}
