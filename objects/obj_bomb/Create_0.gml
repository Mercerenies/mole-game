
event_inherited();

onArrive = function(wasFalling) {
  var grav = ctrl_Game.getGravityDegrees();
  var below = instance_place(x + GRID_SIZE * dcos(grav), y + GRID_SIZE * dsin(grav), par_SolidObject);

  if (wasFalling && instance_exists(below)) {
    _boom();
  }
}

onObjectImpact = function() {
  _boom();
}

_boom = function() {
  if (x < -100) {
    return;
  }

  var explosionX = x;
  var explosionY = y;

  var changeAction = new DestroyUndoableChange(self.id);
  undo_stack_apply_change(changeAction);

  for (var dx = -1; dx < 2; dx++) {
    for (var dy = -1; dy < 2; dy++) {
      var xx = explosionX + GRID_SIZE * dx;
      var yy = explosionY + GRID_SIZE * dy;
      instance_create_layer(xx + GRID_SIZE / 2, yy + GRID_SIZE / 2, "Instances_Particles", obj_Boom);
      var target = instance_position(xx, yy, par_SolidObject);
      if (instance_exists(target) && (target.object_index != obj_VeryHardDirt)) {
        target.onExplode();
        var destroyAction = new DestroyUndoableChange(target);
        undo_stack_apply_change(destroyAction);
      }
    }
  }

  if (!audio_is_playing(snd_Boom)) {
    sfx(snd_Boom);
  }

  ctrl_Game._lagFrame = 1;

}

onExplode = function() {
  _boom();
}
