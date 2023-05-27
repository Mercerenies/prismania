
event_inherited();

// Inputs
if (keyLeft()) {
  velocity_x = toward(velocity_x, - max_speed, horizontal_acceleration);
}
if (keyRight()) {
  velocity_x = toward(velocity_x, max_speed, horizontal_acceleration);
}

// Friction
if ((!keyLeft()) && (!keyRight())) {
  velocity_x *= 0.8;
  if (abs(velocity_x) < 0.2) {
    velocity_x = 0;
  }
}

wall_jump_timer += 1;
last_ground_timer += 1;

// Jumping
if (keyUpPressed()) {
  if (last_ground_timer < 3) {
    // Regular jump
    velocity_y = -15;
  } else if ((wall_jump_timer < 3) && ctrl_UnlockedAbilities.wall_jump) {
    // Wall jump
    velocity_y = -15;
    velocity_x = 6 * wall_jump_dir;
    wall_jump_last_dir = wall_jump_dir;
    wall_jump_timer = 999; // Make sure we don't spam these in a short time period.
  } else if (double_jump_flag && ctrl_UnlockedAbilities.double_jump) {
    // Double jump
    double_jump_flag = false;
    velocity_y = -15;
  }
}

// Friction on walls
if (isPressedOnWall(self) && (velocity_y > 3)) {
  velocity_y = toward(velocity_y, 3, 2.2);
}

// Reset double jump flag and wall jump flag
if (isOnGround(self)) {
  double_jump_flag = true;
  wall_jump_last_dir = 0;
  last_ground_timer = 0;
}

// Check wall jump timer
if (isPressedOnWall(self)) {
    x -= 1;
    var left_wall = collidesWith(self, par_Solid);
    x += 2;
    var right_wall = collidesWith(self, par_Solid);
    x -= 1;
    if ((left_wall) && (wall_jump_last_dir != 1)) {
      // Wall jump to right
      wall_jump_dir = 1;
      wall_jump_timer = 0;
    }
    if ((right_wall) && (wall_jump_last_dir != -1)) {
      // Wall jump to right
      wall_jump_dir = -1;
      wall_jump_timer = 0;
    }
}

// Adjust facing direction
if (bow_out) {
  last_x_dir = sign(mouse_x - x);
  if (last_x_dir == 0) {
    last_x_dir = 1;
  }
} else if (sign(velocity_x) != 0) {
  last_x_dir = sign(velocity_x);
}

// Animation tick
sine_tick += 1;

// Melee attack
if (leftMouseReleased() && (melee_attack_cooldown <= 0) && !ctrl_UnlockedAbilities.archery) {
  with (instance_create_layer(x + 8 + last_x_dir * 28, y + 12, "Instances", obj_MeleeStrike)) {
    image_xscale = other.last_x_dir;
  }
  melee_attack_cooldown = 30;
}
if (melee_attack_cooldown > 0) {
  melee_attack_cooldown -= 1;
}

// Ranged attack
if (ctrl_UnlockedAbilities.archery) {
  if (bow_out) {
    if (leftMouseReleased()) {
      var dir = point_direction(x + 8, y + 12, mouse_x, mouse_y);
      with (instance_create_layer(x + 8, y + 12, "Instances", obj_Arrow)) {
        velocity_x = lengthdir_x(10, dir);
        velocity_y = lengthdir_y(10, dir);
      }
      bow_out = false;
    }
  } else {
    if (leftMousePressed() && (ranged_attack_cooldown <= 0) && (instance_number(obj_Arrow) < 3)) {
      bow_out = true;
    }
  }
}
if (ranged_attack_cooldown > 0) {
  ranged_attack_cooldown -= 1;
}

// Bow drawn animation
if (bow_out) {
  bow_out_time += 1;
} else {
  bow_out_time = 0;
}

// DEBUG CODE
if (keyboard_check(vk_f2)) {
  room_restart();
}