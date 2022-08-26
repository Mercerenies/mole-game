
event_inherited();
dirtLevel = DirtLevel.SOFT;

canPlayerMoveOnto = function() {
  return true;
}

onPlayerMoveOnto = function() {
  // Move out of sight and out of collisions (but don't destroy, so we
  // can still undo with this instance ID)
  x -= 9999;
}
