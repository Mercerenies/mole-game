
event_inherited();
dirtLevel = DirtLevel.SOFT;

canPlayerMoveOnto = function() {
  return true;
}

onPlayerMoveOnto = function() {

  repeat (4) {
    var xx = x + random_range(0, GRID_SIZE);
    var yy = y + random_range(0, GRID_SIZE);
    part_particles_create(global.part_system, xx, yy, global.soft_dirt_part, 1);
  }

  // Move out of sight and out of collisions (but don't destroy, so we
  // can still undo with this instance ID)
  x -= 9999;
}
