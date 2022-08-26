
dirtLevel = DirtLevel.NONE;

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

onPlayerMoveOnto = function() {}

doPhysicsTick = function() {}
