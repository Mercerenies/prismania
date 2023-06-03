
event_inherited();

if (isShowingModal()) {
  exit;
}

var bt = ctrl_BulletTimeManager.global_speed_multiplier;

target_angle += 7 * bt;
