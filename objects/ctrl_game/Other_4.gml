
undo_stack_create();

if (room == rm_CakeLevel) {
  obj_Gyro.visible = false;
  obj_CabbageCounter.visible = false;
} else {
  instance_create_layer(room_width / 2, room_height - 60, "Instances_Particles", obj_NameBox);
}
