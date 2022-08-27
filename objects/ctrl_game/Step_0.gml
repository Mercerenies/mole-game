
if (canPlayerMove()) {
  if (isUndoPressed()) {
    undo_stack_undo();
  } else {

    if (!gameOver) {
      // Check if we've won.
      if (obj_CabbageCounter.cabbages_collected == obj_CabbageCounter.total_cabbages) {
        show_debug_message("Win"); /////
      }
    }

  }
}