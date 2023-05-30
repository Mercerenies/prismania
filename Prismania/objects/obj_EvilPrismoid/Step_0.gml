
event_inherited();

if (isShowingModal()) {
  exit;
}

var bt = ctrl_BulletTimeManager.global_speed_multiplier;

if (isOnGround(self)) {
  velocity_x = toward(velocity_x, walking_dir * max_speed, bt * horizontal_acceleration);
}

if (walking_reset_timer > 0) {
  walking_reset_timer -= bt;
}
facing_dir = walking_dir;
