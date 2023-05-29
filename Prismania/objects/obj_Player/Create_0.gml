
event_inherited();

_super_onDraw = onDraw;
onDraw = function() {
  _super_onDraw();
  if (bow_out) {
    var bow_dir = getBowAngle();
    drawArrowTrajectory(x + 8, y + 12, bow_dir, c_red);
  }
}

getHead = function(world) {
  if (world == World.MIRROR) {
    return spr_PlayerHeadMirrored;
  } else {
    return spr_PlayerHead;
  }
}

getTorso = function(world) {
  if (world == World.MIRROR) {
    return spr_PlayerTorsoMirrored;
  } else {
    return spr_PlayerTorso;
  }
}

getBowIndex = function() {
  if (bow_out) {
    return clamp(bow_out_time / 5, 0, 2);
  } else {
    return undefined;
  }
}

getBowAngle = function() {
  return point_direction(x + 8, y + 12, mouse_x, mouse_y);
}

die = function() {
  instance_create_layer(x + 8, y + 8, "Instances", obj_PlayerHeadDeath);
  instance_create_layer(x + 8, y + 24, "Instances", obj_PlayerTorsoDeath);
  instance_destroy();
}

max_speed = 5;
horizontal_acceleration = 2;

// True if we can currently double jump. This is reset to true whenever we're on the
// ground and is set to false if we double jump. This is NOT the flag for whether the
// player has unlocked the double jump *ability*. That flag is in ctrl_UnlockedAbilities.
double_jump_flag = true;

// Counter since the last time we were wall sliding, and which wall we slid along. We give
// a few frames' grace period for wall jumps.
wall_jump_timer = 0;
wall_jump_dir = -1;
wall_jump_last_dir = 0;

// Timer for jump grace periods
last_ground_timer = 0;

melee_attack_cooldown = 0;

ranged_attack_cooldown = 0;
bow_out = false;
bow_out_time = 0;

// Re-used during step event to avoid unnecessary allocations.
tmp_list = ds_list_create();