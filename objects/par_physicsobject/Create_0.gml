
event_inherited();

hasPhysics = true;
_animating = false;
_rolling = false; // For animation purposes, plays a slightly different animation.
_animation = 0;
_prior_x = 0;
_prior_y = 0;
_rotAnimDir = 1;
_lastAngle = 0;

moveTo = function(xx, yy, isRolling) {
  _animating = true;
  _animation = 0;
  _rolling = isRolling;
  _prior_x = x;
  _prior_y = y;
  var changeAction = new ObjectPositionUndoableChange(self.id, x, y, xx, yy);
  undo_stack_apply_change(changeAction);
}

isAnimating = function() {
  return _animating;
}

canMoveOntoPlayer = function() {
  return false;
}

onMoveOntoPlayer = function() {}

canPlayerMoveOnto = function() {
  var px = obj_Mole.x;
  var py = obj_Mole.y;

  var grav = ctrl_Game.getGravityDegrees();
  var playerShoveDir = darctan2(y - py, x - px);

  // Player can only push physics objects perpendicular to gravity (so
  // left or right, not up or down, assuming gravity is downward).
  var angleDiff = ((playerShoveDir - grav) % 360 + 360) % 360;
  if ((angleDiff != 90) && (angleDiff != 270)) {
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

onArrive = function(wasFalling) {}

onPlayerMoveOnto = function() {
  var px = obj_Mole.x;
  var py = obj_Mole.y;
  var targetX = 2 * x - px;
  var targetY = 2 * y - py;
  var grav = ctrl_Game.getGravityDegrees();

  // If we're about to fall anyway, convert the push to a roll (same
  // effect, but the animation looks better).
  var belowX = targetX + GRID_SIZE * dcos(grav);
  var belowY = targetY + GRID_SIZE * dsin(grav);
  var belowTarget = instance_position(belowX, belowY, par_SolidObject);
  var rolling = false;
  if (!instance_exists(belowTarget)) {
    // Roll push
    targetX = belowX;
    targetY = belowY;
    rolling = true;
  }
  moveTo(targetX, targetY, rolling);
}

doPhysicsTick = function() {

  if ((_animating) && (_animation >= 1)) {
    _animating = false;
    _rolling = false;

    // Determine if we were falling.
    var grav = ctrl_Game.getGravityDegrees();
    var rot = 90 - grav;
    var dx = x - _prior_x;
    var dy = y - _prior_y;
    //var transformedDx = dx * dcos(rot) - dy * dsin(rot);
    var transformedDy = dx * dsin(rot) + dy * dcos(rot);
    var isFalling = (transformedDy > 0);

    onArrive(isFalling);

    if (x > -100) {
      var below = instance_position(x + GRID_SIZE * dcos(grav), y + GRID_SIZE * dsin(grav), par_SolidObject);
      if (instance_exists(below) && isFalling) {
        below.onObjectImpact();
      }
    }
  }

  if ((!_animating) && (x >= -100)) {
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

  advanceAnim();

}

advanceAnim = function() {
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
  if (instance_exists(below)) {
    // If there's something in the way, see if it's the player and if
    // we're allowed to fall on them.
    if (below.object_index != obj_Mole) {
      // Can't fall onto other objects.
      return false;
    }
    if (!canMoveOntoPlayer()) {
      // Can't fall onto player (object-specific rule).
      return false;
    }
    // We fell on the player, so handle that event.
    onMoveOntoPlayer();
  }
  moveTo(belowX, belowY, false);
  return true;
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

  if (instance_exists(side)) {
    // Super weird corner case: If the player is next to us, we can
    // move onto the player, and there's nothing below the player,
    // then we do a weird one-sided roll onto the player.
    if ((side.object_index == obj_Mole) && (canMoveOntoPlayer()) && (!instance_exists(sideDown))) {
      onMoveOntoPlayer();
      moveTo(sideX, sideY, false);
    }
    return false;
  }

  if (instance_exists(sideDown)) {
    // Can we move onto it?
    if (sideDown.object_index != obj_Mole) {
      // Can't fall onto other objects.
      return false;
    }
    if (!canMoveOntoPlayer()) {
      // Can't fall onto player (object-specific rule).
      return false;
    }
    // We fell on the player, so handle that event.
    onMoveOntoPlayer();
  }

  moveTo(sideDownX, sideDownY, true);
  return true;
}
