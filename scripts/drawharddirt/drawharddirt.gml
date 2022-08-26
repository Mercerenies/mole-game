
function drawHardDirt(surface, grid) {
  surface_set_target(surface);

  // Clear surface
  draw_clear_alpha(c_white, 0);
  draw_sprite(spr_Background, 0, 0, 0);

  gpu_set_blendmode(bm_subtract);

  with (obj_Shadow) {
    if (shadowLayer == 1)
      drawShadow(0.2);
  }

  for (var xx = 0; xx < room_width / GRID_SIZE; xx++) {
    for (var yy = 0; yy < room_height / GRID_SIZE; yy++) {
      drawDirtImage(grid, DirtLevel.HARD, xx, yy);
    }
  }
  gpu_set_blendmode(bm_normal);

  surface_reset_target();
  draw_surface(surface, 0, 0);
}
