
function KillCabbageChange() : UndoableChange() constructor {

  static undo = function() {
    obj_CabbageCounter.cant_win = false;
  }

  static apply = function() {
    obj_CabbageCounter.cant_win = true;
  }

  static can_apply = function() {
    return !obj_CabbageCounter.cant_win;
  }

}
