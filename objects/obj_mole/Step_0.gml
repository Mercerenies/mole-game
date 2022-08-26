
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
      _prior_x = x;
      _prior_y = y;
      x = xx;
      y = yy;
      _animating = true;
      _animation = 0;
      _facing = dir * 90;

      if (instance_exists(atTarget)) {
        atTarget.onPlayerMoveOnto();
      }

    }

  }
}

if (_animating) {
  // Move X and Y.
  var anim_speed = 0.0667;
  _animation = min(_animation + anim_speed, 1);
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
