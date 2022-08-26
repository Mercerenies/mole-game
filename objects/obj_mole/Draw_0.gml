
var xx = x;
var yy = y;

if (_animating) {
  xx = lerp(_prior_x, x, _animation);
  yy = lerp(_prior_y, y, _animation);
}

var centerX = xx + GRID_SIZE / 2;
var centerY = yy + GRID_SIZE / 2;

var adjustedUpperLeftX = centerX - (GRID_SIZE / 2) * dcos(_img_facing) + (GRID_SIZE / 2) * dsin(_img_facing);
var adjustedUpperLeftY = centerY - (GRID_SIZE / 2) * dsin(_img_facing) - (GRID_SIZE / 2) * dcos(_img_facing);

var leftArmX = centerX + 2 * dcos(_img_facing) - (- 7) * dsin(_img_facing);
var leftArmY = centerY + 2 * dsin(_img_facing) + (- 7) * dcos(_img_facing);
var leftArmAngle = _img_facing + 30 * sin(_animation * 2 * pi);

var leftLegX = centerX + (- 19) * dcos(_img_facing) - (- 8) * dsin(_img_facing);
var leftLegY = centerY + (- 19) * dsin(_img_facing) + (- 8) * dcos(_img_facing);
var leftLegAngle = _img_facing - 30 * sin(_animation * 2 * pi);

var rightArmX = centerX + 2 * dcos(_img_facing) - 6 * dsin(_img_facing);
var rightArmY = centerY + 2 * dsin(_img_facing) + 6 * dcos(_img_facing);
var rightArmAngle = _img_facing + 30 * sin(_animation * 2 * pi);

var rightLegX = centerX + (- 19) * dcos(_img_facing) - 8 * dsin(_img_facing);
var rightLegY = centerY + (- 19) * dsin(_img_facing) + 8 * dcos(_img_facing);
var rightLegAngle = _img_facing - 30 * sin(_animation * 2 * pi);

draw_sprite_ext(spr_MoleLeftArm, 0, leftArmX, leftArmY, 1, 1, - leftArmAngle, c_white, 1);
draw_sprite_ext(spr_MoleRightArm, 0, rightArmX, rightArmY, 1, 1, - rightArmAngle, c_white, 1);
draw_sprite_ext(spr_MoleLeftLeg, 0, leftLegX, leftLegY, 1, 1, - leftLegAngle, c_white, 1);
draw_sprite_ext(spr_MoleRightLeg, 0, rightLegX, rightLegY, 1, 1, - rightLegAngle, c_white, 1);
draw_sprite_ext(sprite_index, image_index, adjustedUpperLeftX, adjustedUpperLeftY, image_xscale, image_yscale, - _img_facing, image_blend, image_alpha);
