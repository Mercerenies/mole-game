
event_inherited();

_animating = false;
_rolling = false; // For animation purposes, plays a slightly different animation.
_animation = 0;
_prior_x = 0;
_prior_y = 0;

isAnimating = function() {
  return _animating;
}

doPhysicsTick = function() {

  if ((_animating) && (_animation >= 1)) {
    _animating = false;
    _rolling = false;
  }

  if (!_animating) {
    // Consider moving.
    var falling = _considerFalling();
    if (!falling) {
      // If we can't fall, try rolling.
      var rollingRight = _considerRolling(1);
      if (!rollingRight) {
        _considerRolling(-1);
      }
    }
  }

  if (_animating) {
    // We're currently moving.
    _animation = min(_animation + ANIM_SPEED, 1);
  }

}

_considerFalling = function() {
  var grav = ctrl_Game.getGravityDegrees();
  var belowX = x + GRID_SIZE * dcos(grav);
  var belowY = y + GRID_SIZE * dsin(grav);
  var below = instance_place(belowX, belowY, par_SolidObject);
  if (!instance_exists(below)) {
    _animating = true;
    _rolling = false;
    _animation = 0;
    _prior_x = x;
    _prior_y = y;
    var changeAction = new ObjectPositionUndoableChange(self.id, x, y, belowX, belowY);
    undo_stack_apply_change(changeAction);
    return true;
  }
  return false;
}

// dx shall be 1 or -1, indicating whether we're going right or left
// (relative to gravity).
_considerRolling = function(dx) {
  var grav = ctrl_Game.getGravityDegrees();

  var belowX = x + GRID_SIZE * dcos(grav);
  var belowY = y + GRID_SIZE * dsin(grav);
  var below = instance_place(belowX, belowY, par_SolidObject);

  if (!instance_exists(below)) {
    // Should be falling instead.
    return false;
  }
  if (!below.isRound()) {
    // Can't roll off things that aren't round.
    return false;
  }

  var sideX = x + dx * GRID_SIZE * dcos(grav - 90);
  var sideY = y + dx * GRID_SIZE * dsin(grav - 90);
  var side = instance_place(sideX, sideY, par_SolidObject);

  var sideDownX = sideX + GRID_SIZE * dcos(grav);
  var sideDownY = sideY + GRID_SIZE * dsin(grav);
  var sideDown = instance_place(sideDownX, sideDownY, par_SolidObject);

  if ((!instance_exists(side)) && (!instance_exists(sideDown))) {
    _animating = true;
    _rolling = true;
    _animation = 0;
    _prior_x = x;
    _prior_y = y;
    var changeAction = new ObjectPositionUndoableChange(self.id, x, y, sideDownX, sideDownY);
    undo_stack_apply_change(changeAction);
    return true;
  }
  return false;
}
