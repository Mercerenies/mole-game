
if (instance_exists(ctrl_Game)) {
  // Regular game level, so save.
  var levelNumber = getLevelFromRoom(room);
  saveGame(levelNumber);
}