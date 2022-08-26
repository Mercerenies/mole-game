
event_inherited();
dirtLevel = DirtLevel.SOFT;

isRound = function() {
  return false;
}

canPlayerMoveOnto = function() {
  return true;
}

onPlayerMoveOnto = function() {

  repeat (4) {
    var xx = x + random_range(0, GRID_SIZE);
    var yy = y + random_range(0, GRID_SIZE);
    part_particles_create(global.part_system, xx, yy, global.soft_dirt_part, 1);
  }

  var action = new DestroySoftDirtUndoableChange(self.id);
  undo_stack_apply_change(action);
}
