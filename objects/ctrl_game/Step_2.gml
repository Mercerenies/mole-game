
if (_lagFrame >= 0) {
  _lagFrame -= 1;
}

if (_nextGravity >= 0) {
  undo_stack_apply_change(new SetGravityUndoableChange(gravityDir, _nextGravity));
  _lagFrame = 0;
}
