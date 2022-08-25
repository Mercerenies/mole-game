
function drawBackground() {
  var c = make_colour_rgb(145, 108, 34);
  draw_rectangle_colour(0, 85, room_width, room_height, c, c, c, c, false);

  with (obj_Shadow) {
    if (shadowLayer == 0)
      drawShadow(0.25);
  }

}
