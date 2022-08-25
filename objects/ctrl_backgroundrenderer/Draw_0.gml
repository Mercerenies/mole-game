
ds_grid_clear(grid, DirtLevel.NONE);

with (par_SolidObject) {
  loadIntoGrid(other.grid);
}

if ((is_undefined(surface)) || (!surface_exists(surface))) {
  surface = surface_create(room_width, room_height);
}

drawHardDirt(surface, grid);