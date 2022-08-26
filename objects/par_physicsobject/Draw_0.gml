
var xx = x;
var yy = y;
var angle = 0;

if (_animating) {
  xx = lerp(_prior_x, x, _animation);
  yy = lerp(_prior_y, y, _animation);
  angle = lerp(0, 360, _animation);

  // If we're "falling" to the left (relative to gravity),
  // then rotate in reverse.
  var dx = x - _prior_x;
  var dy = y - _prior_y;
  var rot = 90 - ctrl_Game.getGravityDegrees();
  var transformedDx = dx * dcos(rot) - dy * dsin(rot);
  //var transformedDy = dx * dsin(rot) + dy * dcos(rot);
  if (transformedDx < 0) {
    angle *= -1;
  }

}

var centerX = xx + GRID_SIZE / 2;
var centerY = yy + GRID_SIZE / 2;

var adjustedUpperLeftX = centerX - (GRID_SIZE / 2) * dcos(angle) + (GRID_SIZE / 2) * dsin(angle);
var adjustedUpperLeftY = centerY - (GRID_SIZE / 2) * dsin(angle) - (GRID_SIZE / 2) * dcos(angle);

draw_sprite_ext(sprite_index, image_index, adjustedUpperLeftX, adjustedUpperLeftY, image_xscale, image_yscale, - angle, image_blend, image_alpha);
