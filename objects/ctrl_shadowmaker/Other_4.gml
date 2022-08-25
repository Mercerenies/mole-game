
var spawnCount = 100;

repeat (spawnCount) {
  trySpawnShadow(0);
}

with (obj_Shadow) {
  y -= 99999;
}

repeat (spawnCount) {
  trySpawnShadow(1);
}

with (obj_Shadow) {
  if (y < -1000) {
    y += 99999;
  }
}
