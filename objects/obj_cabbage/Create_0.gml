
_gravityDir = -1;

event_inherited();

canPlayerMoveOnto = function() {
  return true;
}

onPlayerMoveOnto = function() {
  alarm[0] = floor(1 / ANIM_SPEED) - 1;
}

canMoveOntoPlayer = function() {
  return true;
}

onArrive = function() {
  if (place_meeting(x, y, obj_Mole)) {
    _beEaten();
  }
}

_beEaten = function() {
  // Eat the cabbage.

  repeat (5) {
    var xx = x + random_range(0, GRID_SIZE);
    var yy = y + random_range(0, GRID_SIZE);
    part_particles_create(global.part_system, xx, yy, global.cabbage_leaf_part, 1);
  }

  var changeAction = new DestroyUndoableChange(self.id);
  undo_stack_apply_change(changeAction);

  if (_gravityDir >= 0) {
    ctrl_Game.queueGravityChange(_gravityDir);
  }

}
