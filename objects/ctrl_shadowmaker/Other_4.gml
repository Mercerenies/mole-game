
random_set_seed(room);

var spawnCount = 100;

repeat (spawnCount) {
  trySpawnShadow(0);
}

if (room != rm_CakeLevel) {

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

  instance_create_layer(random(room_width), -48, "Instances_Particles", obj_Cloud);

}

var progress = getLevelFromRoom(room);
var bg = layer_background_get_id(layer_get_id("Background"));
progress = (progress - 1) / 28;
layer_background_blend(bg, make_color_hsv(135, 128, lerp(255, 102, progress)));