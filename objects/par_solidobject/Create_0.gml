
dirtLevel = DirtLevel.NONE;
hasPhysics = false;

loadIntoGrid = function(grid) {
  if (dirtLevel == DirtLevel.NONE) {
    return;
  }
  var xx = floor(x / GRID_SIZE);
  var yy = floor(y / GRID_SIZE);
  if ((xx >= 0) && (yy >= 0) && (xx < ds_grid_width(grid)) && (yy < ds_grid_height(grid))) {
    grid[# xx, yy] = dirtLevel;
  }
}

isAnimating = function() {
  return false;
}

canPlayerMoveOnto = function() {
  return false;
}

// If this is true, then boulders and other objects will roll off it.
isRound = function() {
  return true;
}

// Called when something else lands on this object.
onObjectImpact = function() {

}

// Called immediately *before* the player moves onto this object.
onPlayerMoveOnto = function() {}

doPhysicsTick = function() {}

// Called when an undo action brings this object back to life.
onResurrect = function() {}

// Called when an undo action reverts a move on this object.
onUndoMove = function() {}

onExplode = function() {}
