
_nextGravity = -1;
_lagFrame = -1;
gravityDir = Dir.DOWN;

getGravityDegrees = function() {
  return gravityDir * 90;
}

queueGravityChange = function(newGravity) {
  _nextGravity = newGravity;
}

isAnimating = function() {
  return (_nextGravity >= 0) || (_lagFrame >= 0);
}
