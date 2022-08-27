
function enqueueDia(dia) {
  ds_queue_enqueue(ctrl_DialogueManager._queue, dia);
  ctrl_DialogueManager.advanceIfEmpty();
}