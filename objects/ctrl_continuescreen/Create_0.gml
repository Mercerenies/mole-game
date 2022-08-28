
var maxLoaded = loadGame();
for (var i = 1; i <= 28; i++) {
  if (i > maxLoaded) {
    continue;
  }

  var xFrac = (((i - 1) % 7) + 1) * room_width / 8;
  var yFrac = (((i - 1) div 7) + 1) * room_height / 5;
  with (instance_create_layer(xFrac, yFrac, "Instances", obj_ContinueCabbage)) {
    _index = i;
    if (i == 1) {
      selected = true;
    }
  }

}