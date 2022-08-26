
function drawDirtImage(grid, level, xx, yy) {

  // 3x3 grid around the current position:
  // abc
  // def
  // ghi
  var a = (gridGet(grid, level, xx - 1, yy - 1) >= level);
  var b = (gridGet(grid, level, xx    , yy - 1) >= level);
  var c = (gridGet(grid, level, xx + 1, yy - 1) >= level);
  var d = (gridGet(grid, level, xx - 1, yy    ) >= level);
  var e = (gridGet(grid, level, xx    , yy    ) >= level);
  var f = (gridGet(grid, level, xx + 1, yy    ) >= level);
  var g = (gridGet(grid, level, xx - 1, yy + 1) >= level);
  var h = (gridGet(grid, level, xx    , yy + 1) >= level);
  var i = (gridGet(grid, level, xx + 1, yy + 1) >= level);

  // Draw base image if empty
  if (!e) {
    draw_sprite(spr_WallImageSplit, 0, xx * GRID_SIZE, yy * GRID_SIZE);
  }

  // Trust me on these, I drew Karnaugh maps and it was fun :)

  // Lower right corner
  if (!((e && h) || (e && f) || (f && h && i))) {
    draw_sprite(spr_WallImageSplit, 1, xx * GRID_SIZE, yy * GRID_SIZE);
  }

  // Lower left corner
  if (!((e && d) || (e && h) || (h && d && g))) {
    draw_sprite(spr_WallImageSplit, 2, xx * GRID_SIZE, yy * GRID_SIZE);
  }

  // Upper left corner
  if (!((e && b) || (e && d) || (d && b && a))) {
    draw_sprite(spr_WallImageSplit, 3, xx * GRID_SIZE, yy * GRID_SIZE);
  }

  // Upper right corner
  if (!((e && f) || (e && b) || (b && f && c))) {
    draw_sprite(spr_WallImageSplit, 4, xx * GRID_SIZE, yy * GRID_SIZE);
  }

}
