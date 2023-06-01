
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
if (walking_reset_timer == 0) {
  if (instance_exists(obj_Player) && instance_exists(ctrl_Boss1Controller)) {
    if (ctrl_Boss1Controller.boss_health <= 1) {
      if ((abs(obj_Player.x - x) > 16) && (y <= obj_Player.y)) {
        walking_dir = sign(obj_Player.x - x);
      }
    }
  }
}
facing_dir = walking_dir;
