
if ((image_alpha >= 1) && selected && !lag) {
  var dir = getKeyDirectionPressed();
  if (dir == Dir.LEFT) {
    selected = false;
    obj_NewGameButton.selected = true;
    obj_NewGameButton.lag = true;
  } else if (dir == Dir.RIGHT) {
    selected = false;
    obj_QuitButton.selected = true;
    obj_QuitButton.lag = true;
  }
}