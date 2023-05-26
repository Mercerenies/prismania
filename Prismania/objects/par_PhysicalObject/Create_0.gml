
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