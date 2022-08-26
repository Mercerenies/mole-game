
function getKeyDirection() {
  if ((keyboard_check(ord("W"))) || (keyboard_check(vk_up))) {
    return Dir.UP;
  }
  if ((keyboard_check(ord("A"))) || (keyboard_check(vk_left))) {
    return Dir.LEFT;
  }
  if ((keyboard_check(ord("S"))) || (keyboard_check(vk_down))) {
    return Dir.DOWN;
  }
  if ((keyboard_check(ord("D"))) || (keyboard_check(vk_right))) {
    return Dir.RIGHT;
  }
  return undefined;
}

function isUndoPressed() {
  return keyboard_check_pressed(vk_backspace);
}

function canPlayerMove() {
  with (par_SolidObject) {
    if (isAnimating()) {
      return false;
    }
  }
  if (ctrl_Game._nextGravity >= 0) {
    return false;
  }
  return true;
}
