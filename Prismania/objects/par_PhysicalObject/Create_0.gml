
// Parent class of all physical objects

// Called when a melee strike or arrow hits this object.
// Returns true if the striking object should be consumed.
onStrike = function(is_player_attack) {
  return false;
}