
image_xscale = (selected ? 1.1 : 0.8);
image_yscale = (selected ? 1.1 : 0.8);

if (selected && isConfirmPressed()) {
  var target = getRoomFromLevel(_index);
  room_goto(target);
}

if (selected && !lag) {
  var nextTarget = undefined;
  switch (getKeyDirectionPressed()) {
    case Dir.DOWN:
      with (obj_ContinueCabbage) {
        if ((x == other.x) && (y > other.y)) {
          if (is_undefined(nextTarget) || (nextTarget.y > y)) {
            nextTarget = id;
          }
        }
      }
      if (is_undefined(nextTarget)) {
        with (obj_ContinueCabbage) {
          if (x == other.x) {
            if (is_undefined(nextTarget) || (nextTarget.y > y)) {
              nextTarget = id;
            }
          }
        }
      }
      break;
    case Dir.UP:
      with (obj_ContinueCabbage) {
        if ((x == other.x) && (y < other.y)) {
          if (is_undefined(nextTarget) || (nextTarget.y < y)) {
            nextTarget = id;
          }
        }
      }
      if (is_undefined(nextTarget)) {
        with (obj_ContinueCabbage) {
          if (x == other.x) {
            if (is_undefined(nextTarget) || (nextTarget.y < y)) {
              nextTarget = id;
            }
          }
        }
      }
      break;
    case Dir.RIGHT:
      with (obj_ContinueCabbage) {
        if ((y == other.y) && (x > other.x)) {
          if (is_undefined(nextTarget) || (nextTarget.x > x)) {
            nextTarget = id;
          }
        }
      }
      if (is_undefined(nextTarget)) {
        with (obj_ContinueCabbage) {
          if (y == other.y) {
            if (is_undefined(nextTarget) || (nextTarget.x > x)) {
              nextTarget = id;
            }
          }
        }
      }
      break;
    case Dir.LEFT:
      with (obj_ContinueCabbage) {
        if ((y == other.y) && (x < other.x)) {
          if (is_undefined(nextTarget) || (nextTarget.x < x)) {
            nextTarget = id;
          }
        }
      }
      if (is_undefined(nextTarget)) {
        with (obj_ContinueCabbage) {
          if (y == other.y) {
            if (is_undefined(nextTarget) || (nextTarget.x < x)) {
              nextTarget = id;
            }
          }
        }
      }
      break;
  }
  if (!is_undefined(nextTarget)) {
    selected = false;
    nextTarget.selected = true;
    nextTarget.lag = true;
  }
}