
_anim += ANIM_SPEED;

image_xscale = _anim;
image_yscale = _anim;
image_alpha = 1;
if (_anim > 0.5) {
  image_alpha = lerp(1, 0, (_anim - 0.5) * 2);
}

if (_anim >= 1) {
  instance_destroy();
}