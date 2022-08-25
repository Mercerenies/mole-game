
function drawHardDirt(surface, grid) {
  surface_set_target(surface);

  // Clear surface
  draw_clear_alpha(c_white, 0);
  draw_sprite(spr_Background, 0, 0, 0);

  gpu_set_blendmode(bm_subtract);
  for (var xx = 0; xx < room_width / GRID_SIZE; xx++) {
    for (var yy = 0; yy < room_height / GRID_SIZE; yy++) {
      if (grid[# xx, yy] != DirtLevel.HARD) {
        var img = dirtBitmask(grid, xx, yy, DirtLevel.HARD);
        draw_sprite(spr_WallImage, img, xx * GRID_SIZE, yy * GRID_SIZE);
      }
    }
  }
  gpu_set_blendmode(bm_normal);

  surface_reset_target();
  draw_surface(surface, 0, 0);
}