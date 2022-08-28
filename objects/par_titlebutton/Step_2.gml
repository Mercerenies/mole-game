
image_xscale = (selected ? 1.1 : 0.8);
image_yscale = (selected ? 1.1 : 0.8);

if (_reveal) {
  if (image_alpha < 1) {
    image_alpha += 0.1;
  }
}

if (selected && isConfirmPressed() && (image_alpha >= 1)) {
  onClick();
}

lag = false;