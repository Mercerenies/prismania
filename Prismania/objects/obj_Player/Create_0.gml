
event_inherited();

onDraw = function(world) {
  var head = spr_PlayerHead;
  var torso = spr_PlayerTorso;
  if (world == World.MIRROR) {
    head = spr_PlayerHeadMirrored;
    torso = spr_PlayerTorsoMirrored;
  }

  var yadjust = 2 * sin(sine_tick * 2 * pi / 60);

  var facing_dir = last_x_dir;
  draw_sprite_ext(torso, 0, xprevious + 8, yprevious + 24 + yadjust, facing_dir, 1, 0, c_white, 1);
  draw_sprite_ext(head, 0, x + 8 , y + 8 + yadjust, facing_dir, 1, 0, c_white, 1);

  // Bow and arrow
  if (bow_out) {
    var image_frame = clamp(bow_out_time / 5, 0, 2);
    var dir = point_direction(x + 8, y + 12, mouse_x, mouse_y);
    draw_sprite_ext(spr_Bow, floor(image_frame), x + 8, y + 12 + yadjust, 1, 1, dir, c_white, 1);
  }

}

last_x_dir = 1;

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

sine_tick = 0;
