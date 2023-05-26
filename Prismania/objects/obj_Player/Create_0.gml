
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

_repelAwayFrom = function(collisions) {
  // Calculate average direction to the collided objects.
  var center_x = mean(bbox_left, bbox_right);
  var center_y = mean(bbox_top, bbox_bottom);
  var xx = 0;
  var yy = 0;
  for (var i = 0; i < ds_list_size(collisions); i++) {
    var c = collisions[| i];
    var collision_center_x1 = mean(max(bbox_left, c.bbox_left));
    var collision_center_y1 = mean(max(bbox_top, c.bbox_top));
    var collision_center_x2 = mean(min(bbox_right, c.bbox_right));
    var collision_center_y2 = mean(min(bbox_bottom, c.bbox_bottom));
    xx += (mean(collision_center_x1, collision_center_x2) - center_x);
    yy += (mean(collision_center_y1, collision_center_y2) - center_y);
  }
  if ((xx != 0) || (yy != 0)) {
    var length = sqrt(sqr(xx) + sqr(yy));
    x -= 3 * xx / length;
    y -= 3 * yy / length;
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

ranged_attack_cooldown = 0;
bow_out = false;
bow_out_time = 0;

sine_tick = 0;
