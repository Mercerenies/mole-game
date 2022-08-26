
var anim_exception = (x < -100) && (isAnimating());
if (anim_exception) {
  x += DISAPPEAR_DIST;
}
event_inherited();
if (anim_exception) {
  x -= DISAPPEAR_DIST;
}