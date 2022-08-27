
function EatCabbageChange() : UndoableChange() constructor {

  static undo = function() {
    obj_CabbageCounter.cabbages_collected -= 1;
  }

  static apply = function() {
    obj_CabbageCounter.cabbages_collected += 1;
  }

}
