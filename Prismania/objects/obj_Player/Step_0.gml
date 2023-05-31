
event_inherited();

if (isShowingModal()) {
  exit;
}

var bt = ctrl_BulletTimeManager.global_speed_multiplier;

// Inputs
if (keyLeft()) {
  velocity_x = toward(velocity_x, - max_speed, horizontal_acceleration * bt);
}
if (keyRight()) {
  velocity_x = toward(velocity_x, max_speed, horizontal_acceleration * bt);
}

// Friction
if ((!keyLeft()) && (!keyRight())) {
  velocity_x *= (1 - 0.2 * bt);
  if (abs(velocity_x) < 0.2) {
    velocity_x = 0;
  }
}

wall_jump_timer += 1 * bt;
last_ground_timer += 1 * bt;

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
  velocity_y = toward(velocity_y, 3, 2.2 * bt);
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
  facing_dir = sign(mouse_x - x);
  if (facing_dir == 0) {
    facing_dir = 1;
  }
} else if (sign(velocity_x) != 0) {
  facing_dir = sign(velocity_x);
}

// Melee attack
if (leftMouseReleased() && (melee_attack_cooldown <= 0) && !ctrl_UnlockedAbilities.archery) {
  with (instance_create_layer(x + 8 + facing_dir * 28, y + 12, "Instances", obj_MeleeStrike)) {
    image_xscale = other.facing_dir;
    attack_velocity_x = other.facing_dir * other.attack_velocity;
  }
  melee_attack_cooldown = 30;
}
if (melee_attack_cooldown > 0) {
  melee_attack_cooldown -= 1 * bt;
}

// Ranged attack
if (ctrl_UnlockedAbilities.archery) {
  if (bow_out) {
    if (leftMouseReleased()) {
      fireArrow();
      bow_out = false;
    }
  } else {
    if (leftMousePressed() && (ranged_attack_cooldown <= 0) && (instance_number(obj_Arrow) < 3)) {
      bow_out = true;
      if ((!isOnGround(self)) && (ctrl_UnlockedAbilities.bullet_time)) {
        ctrl_BulletTimeManager.enterBulletTime();
      }
    }
  }
}
if (ranged_attack_cooldown > 0) {
  ranged_attack_cooldown -= 1 * bt;
}

// End bullet time
if (isOnGround(self) || !bow_out) {
  ctrl_BulletTimeManager.exitBulletTime();
}

// Bow drawn animation
if (bow_out) {
  bow_out_time += 1 * bt;
} else {
  bow_out_time = 0;
}

/*
// Pick up or drop an object
if (rightMousePressed()) {
  if (is_undefined(carrying)) {
    // Look for something to pick up
    x += facing_dir * 2;
    var target_object = getFirstCollision(self, par_Block);
    x -= facing_dir * 2;
    if (!is_undefined(target_object)) {
      carrying = target_object.intoCarriedBlock();
      with (target_object) {
        instance_destroy();
      }
    }
  } else {
    // Throw the currently held object
    var block = carrying.intoBlock(x + 8, y - 18);
    block.velocity_x = facing_dir * 5;
    block.velocity_y = -5;
    carrying = undefined;
  }
}
*/

// Update personal crystal
if (has_personal_crystal) {
  if (rightMouseDown()) {
    personal_crystal_radius = toward(personal_crystal_radius, PLAYER_PERSONAL_CRYSTAL_RADIUS, bt * 5);
  } else {
    personal_crystal_radius = toward(personal_crystal_radius, 0, bt * 5);
  }
  is_personal_crystal_active = (personal_crystal_radius > 0);
} else {
  is_personal_crystal_active = false;
}

// Update invincibility frames
if (invincibility_timer > 0) {
  invincibility_timer -= bt;
}

// Check if we're outside the room
if (bbox_top > room_height) {
  die(true);
  exit;
}

// Check if we're colliding with an enemy or other insta-kill hazard
ds_list_clear(tmp_list);
getCollisions(self, par_PhysicalObject, tmp_list);
for (var i = 0; i < ds_list_size(tmp_list); i++) {
  if (tmp_list[| i].kills_player_on_contact) {
    die(false);
    exit;
  }
}

// "Restart" button
if (backspacePressed()) {
  die(true);
  exit;
}
