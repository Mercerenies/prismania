
// Parent class of all physical objects

// Called when a melee strike or arrow hits this object.
// Returns true if the striking object should be consumed.
onStrike = function(is_player_attack) {
  return false;
}

onDraw = function(world_version) {
  draw_self();
}

// If this physical object is or contains a ACTIVE crystal, return
// the data on that crystal. If not, return undefined.
getCrystalData = function() {
  return undefined;
}

// Return the bitmask of worlds this object exists in.
getWorlds = function() {
  return World.REGULAR | World.MIRROR;
}

// Set this to true on subobjects that should kill the player,
// such as enemies or spikes.
kills_player_on_contact = false;