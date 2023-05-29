event_inherited();

var bt = ctrl_BulletTimeManager.global_speed_multiplier;

// Friction
if (isOnGround(self)) {
  velocity_x *= (1 - 0.2 * bt);
  if (abs(velocity_x) < 0.2) {
    velocity_x = 0;
  }
}