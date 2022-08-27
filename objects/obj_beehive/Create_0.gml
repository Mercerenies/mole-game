
event_inherited();

onArrive = function(wasFalling) {
  var grav = ctrl_Game.getGravityDegrees();
  var below = instance_place(x + GRID_SIZE * dcos(grav), y + GRID_SIZE * dsin(grav), par_SolidObject);

  if (wasFalling && instance_exists(below)) {
    _destroy();
  }
}

onObjectImpact = function() {
  _destroy();
}

_destroy = function() {

  repeat (7) {
    var xx = x + random_range(0, GRID_SIZE);
    var yy = y + random_range(0, GRID_SIZE);
    part_particles_create(global.part_system, xx, yy, global.beehive_part, 1);
  }

  var changeAction = new DestroyUndoableChange(self.id);
  undo_stack_apply_change(changeAction);
  ctrl_Game.loseGame();

}

onResurrect = function() {
  with (obj_Bee) {
    if (_beehive.id == other.id) {
      resetPosition();
    }
  }
}

onUndoMove = function() {
  with (obj_Bee) {
    if (_beehive.id == other.id) {
      resetPosition();
    }
  }
}

onExplode = function() {
  ctrl_Game.loseGame();
}
