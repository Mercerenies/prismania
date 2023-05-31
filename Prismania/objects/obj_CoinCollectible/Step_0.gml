
event_inherited();

if (isShowingModal()) {
  exit;
}

var bt = ctrl_BulletTimeManager.global_speed_multiplier;
index += bt * 0.2;
