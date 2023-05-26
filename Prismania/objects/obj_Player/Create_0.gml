
event_inherited();

onDraw = function(world) {
  var head = spr_PlayerHead;
  var torso = spr_PlayerTorso;
  if (world == World.MIRROR) {
    head = spr_PlayerHeadMirrored;
    torso = spr_PlayerTorsoMirrored;
  }

  var yadjust = 2 * sin(sine_tick * 2 * pi / 60);

  draw_sprite_ext(torso, 0, xprevious + 8, yprevious + 24 + yadjust, last_x_dir, 1, 0, c_white, 1);
  draw_sprite_ext(head, 0, x + 8 , y + 8 + yadjust, last_x_dir, 1, 0, c_white, 1);
}

_repelAwayFrom = function(collisions) {
  // Calculate average direction to the collided objects.
  var center_x = mean(bbox_left, bbox_right);
  var center_y = mean(bbox_top, bbox_bottom);
  var xx = 0;
  var yy = 0;
  for (var i = 0; i < ds_list_size(collisions); i++) {
    var c = collisions[| i];
    xx += (mean(c.bbox_left, c.bbox_right) - center_x);
    yy += (mean(c.bbox_top, c.bbox_bottom) - center_y);
  }
  if ((xx != 0) || (yy != 0)) {
    var length = sqrt(sqr(xx) + sqr(yy));
    velocity_x = - 2 * xx / length;
    velocity_y = - 2 * yy / length;
  }
}

velocity_x = 0;
velocity_y = 0;

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

sine_tick = 0;
