
_angle_anim += 0.2;

var targetX = getTargetX();
var targetY = getTargetY();

if (x > targetX) {
  image_xscale = -1;
} else if (x < targetX) {
  image_xscale = 1;
}

if (point_distance(x, y, targetX, targetY) < move_speed) {
  x = targetX;
  y = targetY;
} else {
  var dir = arctan2(targetY - y, targetX - x);
  x += move_speed * cos(dir);
  y += move_speed * sin(dir);
}
