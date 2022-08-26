
if (canPlayerMove()) {
  var dir = getKeyDirection();
  if (!is_undefined(dir)) {
    var xx = x + GRID_SIZE * dcos(dir * 90);
    var yy = y + GRID_SIZE * dsin(dir * 90);
    xx = round(xx / GRID_SIZE) * GRID_SIZE;
    yy = round(yy / GRID_SIZE) * GRID_SIZE;

    // Determine if there's something in the way.
    var atTarget = instance_position(xx, yy, par_SolidObject);
    if ((!instance_exists(atTarget)) || (atTarget.canPlayerMoveOnto())) {
      // Do the actual movement

      undo_stack_begin_move();

      _prior_x = x;
      _prior_y = y;
      _animating = true;
      _animation = 0;

      if (instance_exists(atTarget)) {
        atTarget.onPlayerMoveOnto();
      }

      var stateChange = new PlayerStateUndoableChange(x, y, _facing, xx, yy, dir * 90);
      undo_stack_apply_change(stateChange);

    }

  }
}

// Animate the player object.
if (_animating) {
  // Move X and Y.
  _animation = min(_animation + ANIM_SPEED, 1);
  if (_animation >= 1) {
    _animating = false;
  }
  // Shift angle.
  var rot_speed = 10;
  var angle_diff = angle_difference(_facing, _img_facing);
  if (abs(angle_diff) < rot_speed) {
    _img_facing = _facing;
  } else {
    _img_facing += rot_speed * sign(angle_diff);
  }
} else {
  _img_facing = _facing;
}

// Now run the physics tick on all objects.
with (par_SolidObject) { // TODO Correct order
  doPhysicsTick();
}
