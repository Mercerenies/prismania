
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
      moveToCollision(self, sign(velocity_x) * 0.6, 0, par_Solid, 10);
      velocity_x = 0;
    }
  } else {
    // Y collision
    moveToCollision(self, 0, sign(velocity_y) * 0.6, par_Solid, 10);
    velocity_y = 0;
  }
}

// Jumping
if (keyUpPressed() && isOnGround(self)) {
  velocity_y = -15;
}
