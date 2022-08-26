
// Given a par_SolidObject instance, figure out where in the room
// order it should do its physics tick, and return a number indicating
// this. Physics ticks should be run from largest to smallest index.
function roomOrderIndex(obj) {
  var rot = 90 - ctrl_Game.getGravityDegrees();
  var objX = obj.x * dcos(rot) - obj.y * dsin(rot);
  var objY = obj.x * dsin(rot) + obj.y * dcos(rot);
  // After rotating the coordinates so that gravity is pointing down,
  // we want things with bigger Y coords to run first. In case of a
  // tie, the bigger X coord should run first.
  return objY * 10000 + objX;
}
