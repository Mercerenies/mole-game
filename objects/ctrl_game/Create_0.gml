
_nextGravity = -1;
gravityDir = Dir.DOWN;

getGravityDegrees = function() {
  return gravityDir * 90;
}

queueGravityChange = function(newGravity) {
  _nextGravity = newGravity;
}