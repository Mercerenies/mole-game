
if (canPlayerMove()) {
  var dir = getKeyDirection();
  if (!is_undefined(dir)) {
    var xx = x + GRID_SIZE * dcos(dir * 90);
    var yy = y + GRID_SIZE * dsin(dir * 90);
    xx = round(xx / GRID_SIZE) * GRID_SIZE;
    yy = round(yy / GRID_SIZE) * GRID_SIZE;

    _prior_x = x;
    _prior_y = y;
    x = xx;
    y = yy;
    _animating = true;
    _animation = 0;
    _facing = dir * 90;

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
  var angle_diff = angle_difference(_facing, image_angle);
  if (abs(angle_diff) < rot_speed) {
    image_angle = _facing;
  } else {
    image_angle += rot_speed * sign(angle_diff);
  }
} else {
  image_angle = _facing;
}
