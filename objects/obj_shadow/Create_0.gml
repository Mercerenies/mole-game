
// Choose image index
if (random(1) < 0.1) {
  // Jam callback
  image_index = choose(4, 5, 10, 11, 12, 13, 14);
} else {
  // Standard image
  image_index = choose(0, 1, 2, 3, 6, 7, 8, 9);
}

image_speed = 0;

shadowLayer = choose(0, 1);

image_xscale = choose(-1, 1);

drawShadow = function(alpha) {
  image_alpha = alpha;
  draw_self();
  image_alpha = 1;
}
