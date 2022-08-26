
event_inherited();

_animating = false;
_rolling = false; // For animation purposes, plays a slightly different animation.
_animation = 0;
_prior_x = 0;
_prior_y = 0;

isAnimating = function() {
  return _animating;
}

canPlayerMoveOnto = function() {
  var px = obj_Mole.x;
  var py = obj_Mole.y;

  var grav = ctrl_Game.getGravityDegrees();
  var playerShoveDir = darctan2(y - py, x - px);

  // Player can only push physics objects perpendicular to gravity (so
  // left or right, not up or down, assuming gravity is downward).
  if (round(abs(playerShoveDir - grav)) != 90) {
    return false;
  }

  // Otherwise, if there's anything at that position, we're not
  // allowed to push.
  var targetX = 2 * x - px;
  var targetY = 2 * y - py;
  var atTarget = instance_position(targetX, targetY, par_SolidObject);
  if (instance_exists(atTarget)) {
    return false;
  }

  // Otherwise, go for it.
  return true;

}

onPlayerMoveOnto = function() {
  var px = obj_Mole.x;
  var py = obj_Mole.y;
  var targetX = 2 * x - px;
  var targetY = 2 * y - py;
  var grav = ctrl_Game.getGravityDegrees();

  _animating = true;
  _rolling = false;
  _animation = 0;
  _prior_x = x;
  _prior_y = y;

  // If we're about to fall anyway, convert the push to a roll (same
  // effect, but the animation looks better).
  var belowX = targetX + GRID_SIZE * dcos(grav);
  var belowY = targetY + GRID_SIZE * dsin(grav);
  var belowTarget = instance_position(belowX, belowY, par_SolidObject);
  if (!instance_exists(belowTarget)) {
    // Roll push
    targetX = belowX;
    targetY = belowY;
    _rolling = true;
  }
  var changeAction = new ObjectPositionUndoableChange(self.id, x, y, targetX, targetY);
  undo_stack_apply_change(changeAction);
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
  var below = instance_position(belowX, belowY, par_SolidObject);
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
  var below = instance_position(belowX, belowY, par_SolidObject);

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
  var side = instance_position(sideX, sideY, par_SolidObject);

  var sideDownX = sideX + GRID_SIZE * dcos(grav);
  var sideDownY = sideY + GRID_SIZE * dsin(grav);
  var sideDown = instance_position(sideDownX, sideDownY, par_SolidObject);

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
