
// Level is the highest level number you have unlocked. A level number of 28 is taken to mean "all levels".

function loadGame() {
  ini_open("save.dat");
  var level = ini_read_real("data", "level", 1);
  ini_close();
  return level;
}

function saveGame(newLevel) {
  var savedLevel = loadGame();
  ini_open("save.dat");
  ini_write_real("data", "level", max(savedLevel, newLevel));
  ini_close();
}

function getLevelFromRoom(room_id) {
  var name = room_get_name(room_id);
  var digits = string_digits(name);
  if (digits != "") {
    return real(digits);
  } else if (room == rm_CakeLevel) {
    return 28;
  } else {
    return 1;
  }
}

function getRoomFromLevel(level_number) {
  level_number = floor(level_number);
  if (level_number == 1) {
    return rm_RansomNote;
  } else if (level_number == 28) {
    return rm_Epilogue;
  } else if (level_number < 10) {
    return asset_get_index("rm_Level0" + string(level_number));
  } else if (level_number < 28) {
    return asset_get_index("rm_Level" + string(level_number));
  } else {
    // Default :)
    return rm_RansomNote;
  }
}