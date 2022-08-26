
event_inherited();

canPlayerMoveOnto = function() {
  return true;
}

onPlayerMoveOnto = function() {
  alarm[0] = (floor(1 /ANIM_SPEED) - 1);
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

  var changeAction = new DestroyPhysicsObjectUndoableChange(self.id);
  undo_stack_apply_change(changeAction);
}

_obj_Cabbage_super_doPhysicsTick = doPhysicsTick;
doPhysicsTick = function() {
  if (x < -100) {
    // If we're offscreen, advance the animation but do nothing else.
    advanceAnim();
    if (_animation >= 1) {
      _animating = false;
      _rolling = false;
    }
  } else {
    // Super call.
    _obj_Cabbage_super_doPhysicsTick();
  }
}
