
function dirtBitmask(grid, level, xx, yy) {
  var right = (gridGet(grid, level, xx + 1, yy) == level) ? 1 : 0;
  var down = (gridGet(grid, level, xx, yy + 1) == level) ? 2 : 0;
  var left = (gridGet(grid, level, xx - 1, yy) == level) ? 4 : 0;
  var up = (gridGet(grid, level, xx, yy - 1) == level) ? 8 : 0;
  var me = (gridGet(grid, level, xx, yy) == level) ? 16 : 0;
  return right + down + left + up + me;
}
