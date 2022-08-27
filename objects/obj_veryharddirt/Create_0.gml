
// Equivalent to hard dirt but is special cased to not react to bombs.
// This is only used as the outer edge of the map and is intended as a
// failsafe so you can't go out of bounds.

event_inherited();
dirtLevel = DirtLevel.HARD;

isRound = function() {
  return false;
}
