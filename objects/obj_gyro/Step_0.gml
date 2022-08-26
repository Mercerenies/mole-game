
var grav = ctrl_Game.getGravityDegrees();
if (abs(angle_difference(angle, grav)) < rot_speed) {
  angle = grav;
} else {
  angle += rot_speed * sign(angle_difference(grav, angle));
}

image_angle = - angle;