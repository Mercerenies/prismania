
event_inherited();

_super_onDraw = onDraw;
onDraw = function(world) {

  if (invincibility_timer > 0) {
    draw_set_alpha(0.5);
  }

  var a = draw_get_alpha();
  if (has_shield) {
    var yadjust = getYAdjust();
    var head_sprite = spr_HeadOutline;
    var torso_sprite = spr_TorsoOutline;
    if (world == World.MIRROR) {
      head_sprite = spr_HeadOutlineMirrored;
      torso_sprite = spr_TorsoOutlineMirrored;
    }
    draw_sprite_ext(torso_sprite, 0, xprevious + 8, yprevious + 24 + yadjust, facing_dir, 1, 0, getTorsoBlend(world), a);
    draw_sprite_ext(head_sprite, 0, x + 8 , y + 8 + yadjust, facing_dir, 1, 0, getHeadBlend(world), a);
  }

  _super_onDraw(world);

  draw_set_alpha(1);

  // Held object
  if (!is_undefined(carrying)) {
    carrying.onDraw(world, x + 8, y - 18);
  }

  // Bow trajectory
  if (bow_out) {
    var bow_dir = getBowAngle();
    drawArrowTrajectory(x + 8, y + 12, bow_dir);
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

// A forced death is one that bypasses shield immunity and
// invincibility frames. Currently, the only forced death in this game
// is the one that occurs when you fall below the screen.
die = function(forced) {
  if ((invincibility_timer > 0) && !forced) {
    return;
  }
  if (has_shield && !forced) {
    has_shield = false;
    invincibility_timer = 120;
    return;
  }
  instance_create_layer(x + 8, y + 8, "Instances", obj_PlayerHeadDeath);
  instance_create_layer(x + 8, y + 24, "Instances", obj_PlayerTorsoDeath);
  instance_destroy();
}

onStrike = function(strike) {
  // Never react to AttackType.PLAYER. If it's AttackType.ENEMY,
  // it's going to kill us in the step event anyway, so don't
  // apply impulse.
  if (strike.attack_type == AttackType.NEUTRAL) {
    strike.applyImpulse(self);
    return true;
  }
  return false;
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

// Object being carried (if any)
carrying = undefined;

personal_crystal_radius = 0;

has_shield = false;
invincibility_timer = 0;
