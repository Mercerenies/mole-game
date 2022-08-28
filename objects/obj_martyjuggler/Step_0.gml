
var xPad = 220;

if (_reveal) {
  x += 4 * _dir;

  _tick += 0.01;
  image_angle = 20 * sin(_tick * 2 * pi);
  y = ystart - 25 * abs(cos(_tick * 2 * pi));

  if (abs(frac(_tick * 2 - 0.5)) < 0.03) {
    if (x < xPad) {
      _dir = 1;
    } else if (x >= room_width - xPad) {
      _dir = -1;
    }
  }

  for (var i = 0; i < array_length(_cabbage); i++) {
    _cabbage[i] += 0.0075;
  }

}
