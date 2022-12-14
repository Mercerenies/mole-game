
function drawSoftDirt(surface, grid) {
  surface_set_target(surface);

  // Clear surface
  draw_clear_alpha(c_white, 0);
  var c = make_colour_rgb(59, 31, 9);
  if (room == rm_CakeLevel) {
    draw_sprite(spr_Cake, 0, 0, 0);
  } else {
    draw_rectangle_colour(0, 85, room_width, room_height, c, c, c, c, false);
  }

  gpu_set_blendmode(bm_subtract);
  with (obj_Shadow) {
    if (shadowLayer == 1)
      drawShadow(0.2);
  }

  for (var xx = 0; xx < room_width / GRID_SIZE; xx++) {
    for (var yy = 0; yy < room_height / GRID_SIZE; yy++) {
      drawDirtImage(grid, DirtLevel.SOFT, xx, yy);
    }
  }
  gpu_set_blendmode(bm_normal);

  surface_reset_target();
  draw_surface(surface, 0, 0);
}
