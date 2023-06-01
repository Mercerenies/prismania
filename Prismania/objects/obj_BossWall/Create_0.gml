
event_inherited();

getWorlds = function() {
  if (is_active) {
    return World.MIRROR | World.REGULAR;
  } else {
    return World.NONE;
  }
}

is_active = false;
image_alpha = 0;