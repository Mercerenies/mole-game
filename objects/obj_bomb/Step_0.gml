
var centerX = x + GRID_SIZE / 2;
var centerY = y + GRID_SIZE / 2;

var fuseX = centerX + 17 * dcos(_lastAngle) - (- 16) * dsin(_lastAngle);
var fuseY = centerY + 17 * dsin(_lastAngle) + (- 16) * dcos(_lastAngle);

repeat (10) {
  part_particles_create(global.part_system, fuseX, fuseY, global.player_fire, 1);
}
