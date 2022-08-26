
var xx = x;
var yy = y;

if (_animating) {
  xx = lerp(_prior_x, x, _animation);
  yy = lerp(_prior_y, y, _animation);
}

var centerX = xx + GRID_SIZE / 2;
var centerY = yy + GRID_SIZE / 2;

var adjustedUpperLeftX = centerX - (GRID_SIZE / 2) * dcos(- image_angle) - (GRID_SIZE / 2) * dsin(- image_angle);
var adjustedUpperLeftY = centerY + (GRID_SIZE / 2) * dsin(- image_angle) - (GRID_SIZE / 2) * dcos(- image_angle);

draw_sprite_ext(sprite_index, image_index, adjustedUpperLeftX, adjustedUpperLeftY, image_xscale, image_yscale, - image_angle, image_blend, image_alpha);
