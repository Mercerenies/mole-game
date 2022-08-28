
if (_reveal) {
  if (y < ystart) {
    y += _dy;
    _dy += 0.2;
  }
}

_tick += 0.002;
//image_angle = 5 * sin(_tick * 2 * pi);