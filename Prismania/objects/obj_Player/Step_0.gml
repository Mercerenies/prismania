
var xprev = x;
var yprev = y;

x += velocity_x;
y += velocity_y;

// Gravity
velocity_y += 1.2;

// Inputs
if (keyLeft()) {
  velocity_x = toward(velocity_x, - max_speed, horizontal_acceleration);
}
if (keyRight()) {
  velocity_x = toward(velocity_x, max_speed, horizontal_acceleration);
}

// Friction
if ((!keyLeft()) && (!keyRight())) {
  velocity_x *= 0.85;
  if (abs(velocity_x) < 0.1) {
    velocity_x = 0;
  }
}

wall_jump_timer += 1;
last_ground_timer += 1;

// Collisions
if (collidesWith(self, par_Solid)) {
  var xcurrent = x;
  var ycurrent = y;
  y = yprev;
  if (collidesWith(self, par_Solid)) {
    y = ycurrent;
    x = xprev;
    if (collidesWith(self, par_Solid)) {
      x = xprev;
      y = yprev;
      // Corner collision
      velocity_x = 0;
      velocity_y = 0;
    } else {
      // X collision
      moveToCollision(self, sign(velocity_x) * 0.6, 0, par_Solid, 20);
      velocity_x = 0;
    }
  } else {
    // Y collision
    moveToCollision(self, 0, sign(velocity_y) * 0.6, par_Solid, 20);
    velocity_y = 0;
  }
}

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
if (sign(velocity_x) != 0) {
  last_x_dir = sign(velocity_x);
}

// Animation tick
sine_tick += 1;