
var wing_angle = 8 * sin(_angle_anim * 2 * pi);

var yy = y + 3 * sin(_angle_anim * 0.4 * pi);

draw_sprite_ext(spr_BeeLeftWing, 0, x, yy, 1, 1, wing_angle, c_white, 1);
draw_sprite_ext(spr_Bee, 0, x, yy, image_xscale, image_yscale, 0, c_white, 1);
draw_sprite_ext(spr_BeeRightWing, 0, x, yy, 1, 1, - wing_angle, c_white, 1);