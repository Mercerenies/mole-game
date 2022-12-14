
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

function getKeyDirectionPressed() {
  if ((keyboard_check_pressed(ord("W"))) || (keyboard_check_pressed(vk_up))) {
    return Dir.UP;
  }
  if ((keyboard_check_pressed(ord("A"))) || (keyboard_check_pressed(vk_left))) {
    return Dir.LEFT;
  }
  if ((keyboard_check_pressed(ord("S"))) || (keyboard_check_pressed(vk_down))) {
    return Dir.DOWN;
  }
  if ((keyboard_check_pressed(ord("D"))) || (keyboard_check_pressed(vk_right))) {
    return Dir.RIGHT;
  }
  return undefined;
}

function isFullscreenPressed() {
  return keyboard_check_pressed(vk_f6);
}

function isUndoPressed() {
  return keyboard_check_pressed(vk_backspace);
}

function isRestartPressed() {
  return keyboard_check_pressed(vk_escape);
}

function isDialoguePressed() {
  return keyboard_check_pressed(vk_f1);
}

function canPlayerMove() {
  with (par_SolidObject) {
    if (isAnimating()) {
      return false;
    }
  }
  if (ctrl_Game.isAnimating()) {
    return false;
  }
  if (ctrl_DialogueManager._text != "") {
    return false;
  }
  return true;
}

function isConfirmPressed() {
  return keyboard_check_pressed(vk_space) || keyboard_check_pressed(vk_enter);
}