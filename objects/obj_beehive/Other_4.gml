
// Spawn the bees
for (var i = 0; i < 3; i++) {
  var dy = GRID_SIZE * (- 0.3 + 0.3 * i);
  with (instance_create_layer(x + GRID_SIZE / 2, y + GRID_SIZE / 2 + dy, "Instances_Particles", obj_Bee)) {
    _beehiveDy = dy;
    _beehive = other.id;
  }
}