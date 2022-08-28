
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

if (instance_exists(_beehive) && (_beehive.x < -100)) {
  // I'm mad, my house was destroyed :(
  if (is_undefined(_buzzSound)) {
    _buzzSound = audio_play_sound(snd_Buzz, 0, true);
  }
} else {
  if (!is_undefined(_buzzSound)) {
    audio_stop_sound(_buzzSound);
    _buzzSound = undefined;
  }
}