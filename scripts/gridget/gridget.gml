
function gridGet(grid, default_, xx, yy) {
  var w = ds_grid_width(grid);
  var h = ds_grid_height(grid);
  if ((xx < 0) || (yy < 0) || (xx >= w) || (yy >= h)) {
    return default_;
  }
  return grid[# xx, yy];
}
