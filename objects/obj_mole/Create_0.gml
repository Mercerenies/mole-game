
event_inherited();

// Angle in degrees
_facing = 0;
_img_facing = 0;

_prior_x = 0;
_prior_y = 0;
_animating = false;
_animation = 0;

isAnimating = function() {
  return _animating;
}

isRound = function() {
  return false;
}
