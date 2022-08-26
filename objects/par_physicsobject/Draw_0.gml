
var xx = x;
var yy = y;
var angle = 0;

if (_animating) {
  xx = lerp(_prior_x, x, _animation);
  yy = lerp(_prior_y, y, _animation);
  angle = lerp(0, 360, _animation);

  var rot = 90 - ctrl_Game.getGravityDegrees();
  var dx = x - _prior_x;
  var dy = y - _prior_y;
  var transformedDx = dx * dcos(rot) - dy * dsin(rot);
  var transformedDy = dx * dsin(rot) + dy * dcos(rot);

  // Special case for rolling off the side of things (prettier
  // animation).
  if (_rolling) {
    var actualTransDx = _animation * transformedDx;
    var actualTransDy = _animation * _animation * transformedDy;
    var newDx = actualTransDx * dcos(- rot) - actualTransDy * dsin(- rot);
    var newDy = actualTransDx * dsin(- rot) + actualTransDy * dcos(- rot);
    xx = _prior_x + newDx;
    yy = _prior_y + newDy;
  }

  // If we're "falling" to the left (relative to gravity),
  // then rotate in reverse.
  if (transformedDx != 0) {
    _rotAnimDir = sign(transformedDx);
  }
  if (_rotAnimDir < 0) {
    angle *= -1;
  }

}

var centerX = xx + GRID_SIZE / 2;
var centerY = yy + GRID_SIZE / 2;

var adjustedUpperLeftX = centerX - (GRID_SIZE / 2) * dcos(angle) + (GRID_SIZE / 2) * dsin(angle);
var adjustedUpperLeftY = centerY - (GRID_SIZE / 2) * dsin(angle) - (GRID_SIZE / 2) * dcos(angle);

draw_sprite_ext(sprite_index, image_index, adjustedUpperLeftX, adjustedUpperLeftY, image_xscale, image_yscale, - angle, image_blend, image_alpha);
