
_angle_anim = random(10);
_beehive = noone;
_beehiveDy = 0;

_buzzSound = undefined;

move_speed = 4;

getTargetX = function() {
  var targetX = x;
  if (instance_exists(_beehive)) {
    if (_beehive.x >= -100) {
      targetX = _beehive.x + GRID_SIZE / 2;
    } else if (obj_Mole.x > -100) {
      // Beehive was destroyed, attack player.
      targetX = obj_Mole.x + GRID_SIZE / 2;
    } else {
      // Beehive was destroyed and player is dead, just sit tight.
    }
  }
  targetX += 12 * sin(_angle_anim * 0.1 * pi);
  return targetX;
}

getTargetY = function() {
  var targetY = y;
  if (instance_exists(_beehive)) {
    if (_beehive.x >= -100) {
      targetY = _beehive.y + GRID_SIZE / 2;
    } else if (obj_Mole.x > -100) {
      // Beehive was destroyed, attack player.
      targetY = obj_Mole.y + GRID_SIZE / 2;
    } else {
      // Beehive was destroyed and player is dead, just sit tight.
    }
  }
  targetY += _beehiveDy;
  return targetY;
}

resetPosition = function() {
  x = getTargetX();
  y = getTargetY();
}
