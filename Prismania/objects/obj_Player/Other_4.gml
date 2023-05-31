
instance_create_layer(-128, 0, "Instances", obj_ArrowMaskSimulator);

// Set spawn position
if ((!is_undefined(ctrl_UnlockedAbilities.spawn_x)) && (!is_undefined(ctrl_UnlockedAbilities.spawn_y))) {
  x = ctrl_UnlockedAbilities.spawn_x;
  y = ctrl_UnlockedAbilities.spawn_y;
  facing_dir = (x > room_width / 2) ? -1 : 1;

  if ((!is_undefined(ctrl_UnlockedAbilities.respawn_x)) && (!is_undefined(ctrl_UnlockedAbilities.respawn_y))) {
    ctrl_UnlockedAbilities.spawn_x = ctrl_UnlockedAbilities.respawn_x;
    ctrl_UnlockedAbilities.spawn_y = ctrl_UnlockedAbilities.respawn_y;
    ctrl_UnlockedAbilities.respawn_x = undefined;
    ctrl_UnlockedAbilities.respawn_y = undefined;
  }

}
