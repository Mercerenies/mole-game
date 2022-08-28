
draw_self();

var rightArmX = -120;
var rightArmY = -96;
var leftArmX = 114;
var leftArmY = -87;

for (var i = 0; i < array_length(_cabbage); i++) {
  var tick = _cabbage[i];
  var xLerp = 1 - 2 * abs(frac(tick) - 0.5);
  var xx = lerp(leftArmX, rightArmX, xLerp);
  var bottomY = lerp(leftArmY, rightArmY, xLerp);
  var topY = -300;
  var yFactor = 1 - sqr(2 * ((tick * 2) % 1 - 0.5));
  var yy = lerp(bottomY, topY, yFactor);
  var angle = tick * 400;

  var finalX = x + xx * dcos(- image_angle) - yy * dsin(- image_angle);
  var finalY = y + xx * dsin(- image_angle) + yy * dcos(- image_angle);

  draw_sprite_ext(spr_Cabbage, 0, finalX, finalY, 1, 1, angle, c_white, 1);
}