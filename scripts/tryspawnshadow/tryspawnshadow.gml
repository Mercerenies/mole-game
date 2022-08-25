
function trySpawnShadow(shadowLayer) {
  var inst = instance_create_layer(0, 0, "Instances_Scenery", obj_Shadow);
  inst.shadowLayer = shadowLayer;
  with (inst) {
    repeat (10) {
      x = random_range(0, room_width);
      y = random_range(180, room_height);
      if (!place_meeting(x, y, obj_Shadow)) {
        return;
      }
    }
    // Failed to place, so delete
    instance_destroy();
  }
}
