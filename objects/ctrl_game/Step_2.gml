
if (_nextGravity >= 0) {
  undo_stack_apply_change(new SetGravityUndoableChange(gravityDir, _nextGravity));
}
