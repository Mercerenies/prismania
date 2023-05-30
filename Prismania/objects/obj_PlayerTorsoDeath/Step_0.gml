
event_inherited();

if (isShowingModal()) {
  exit;
}

var bt = ctrl_BulletTimeManager.global_speed_multiplier;

x += velocity_x * bt;
y += velocity_y * bt;
image_angle -= 4 * bt;

velocity_y += GRAVITY_CONSTANT * bt;
