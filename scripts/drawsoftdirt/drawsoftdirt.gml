
function drawSoftDirt(surface, grid) {
  surface_set_target(surface);

  // Clear surface
  draw_clear_alpha(c_white, 0);
  var c = make_colour_rgb(59, 31, 9);
  draw_rectangle_colour(0, 85, room_width, room_height, c, c, c, c, false);

  gpu_set_blendmode(bm_subtract);
  for (var xx = 0; xx < room_width / GRID_SIZE; xx++) {
    for (var yy = 0; yy < room_height / GRID_SIZE; yy++) {
      var img = dirtBitmask(grid, DirtLevel.SOFT, xx, yy);
      draw_sprite(spr_WallImage, img, xx * GRID_SIZE, yy * GRID_SIZE);
    }
  }
  gpu_set_blendmode(bm_normal);

  surface_reset_target();
  draw_surface(surface, 0, 0);
}
