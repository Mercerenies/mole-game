
function dirtBitmask(grid, level, xx, yy) {
  var right = (gridGet(grid, xx + 1, yy) == level) ? 1 : 0;
  var down = (gridGet(grid, xx, yy + 1) == level) ? 2 : 0;
  var left = (gridGet(grid, xx - 1, yy) == level) ? 4 : 0;
  var up = (gridGet(grid, xx, yy - 1) == level) ? 8 : 0;
  var me = (gridGet(grid, xx, yy) == level) ? 16 : 0;
  return right + down + left + up + me;
}
