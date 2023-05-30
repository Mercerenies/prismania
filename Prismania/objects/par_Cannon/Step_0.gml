event_inherited();
var bt = ctrl_BulletTimeManager.global_speed_multiplier;

fire_timer_counter += bt;
if (fire_timer_counter >= fire_timer) {
  fireBullet();
  fire_timer_counter = 0;
}
