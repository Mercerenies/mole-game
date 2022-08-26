
event_inherited();

_animating = false;
_animation = 0;
_prior_x = 0;
_prior_y = 0;

isAnimating = function() {
  return _animating;
}

doPhysicsTick = function() {

  if ((_animating) && (_animation >= 1)) {
    _animating = false;
  }

  if (!_animating) {
    // Consider moving.
    var grav = ctrl_Game.getGravityDegrees();
    var belowX = x + GRID_SIZE * dcos(grav);
    var belowY = y + GRID_SIZE * dsin(grav);
    var below = instance_place(belowX, belowY, par_SolidObject);
    if (!instance_exists(below)) {
      _animating = true;
      _animation = 0;
      _prior_x = x;
      _prior_y = y;
      x = belowX;
      y = belowY;
    }
  }

  if (_animating) {
    // We're currently moving.
    _animation = min(_animation + ANIM_SPEED, 1);
  }

}
