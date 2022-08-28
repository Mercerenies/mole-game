
if (canPlayerMove()) {
  if (isUndoPressed()) {
    undo_stack_undo();
  } else if (isDialoguePressed()) {
    ctrl_DialogueManager.init();
  } else {

    if (!gameOver) {
      // Check if we've won.
      if (room == rm_CakeLevel) {
        // TODO
      } else {
        if (obj_CabbageCounter.cabbages_collected == obj_CabbageCounter.total_cabbages) {
          room_goto_next();
        }
      }
    }

  }
}

if (isRestartPressed() && (ctrl_DialogueManager._text == "")) {
  global.skip_dia = true;
  room_restart();
}
