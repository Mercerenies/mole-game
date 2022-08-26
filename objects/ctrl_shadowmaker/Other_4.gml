
var spawnCount = 100;

repeat (spawnCount) {
  trySpawnShadow(0);
}

with (obj_Shadow) {
  y -= DISAPPEAR_DIST;
}

repeat (spawnCount) {
  trySpawnShadow(1);
}

with (obj_Shadow) {
  if (y < -1000) {
    y += DISAPPEAR_DIST;
  }
}
