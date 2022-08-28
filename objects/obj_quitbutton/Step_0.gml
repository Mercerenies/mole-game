
if ((image_alpha >= 1) && selected && !lag) {
  var dir = getKeyDirectionPressed();
  if (dir == Dir.LEFT) {
    selected = false;
    obj_ContinueButton.selected = true;
    obj_ContinueButton.lag = true;
  } else if (dir == Dir.RIGHT) {
    selected = false;
    obj_NewGameButton.selected = true;
    obj_NewGameButton.lag = true;
  }
}