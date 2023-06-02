
event_inherited();

if (isShowingModal()) {
  exit;
}

var rage = 3 - boss_health;
var max_speed = 3.5 + 0.5 * rage;
var acceleration = 0.5;

var bt = ctrl_BulletTimeManager.global_speed_multiplier;

x += velocity_x * bt;
y += velocity_y * bt;

target_x += target_x_dir * bt * max_speed;
if (x > room_width - 288) {
  target_x_dir = -1;
}
if (x < 288) {
  target_x_dir = 1;
}
sine_tick += bt;
target_y = 313 + 120 * sin(sine_tick * 2 * pi / 200);

var dx = target_x - x;
var dy = target_y - y;

if ((dx != 0) || (dy != 0)) {
  var d = sqrt(sqr(dx) + sqr(dy));
  dx = (dx / d) * max_speed;
  dy = (dy / d) * max_speed;
}
if (boss_health > 0) {
  velocity_x = toward(velocity_x, dx, acceleration);
  velocity_y = toward(velocity_y, dy, acceleration);
}

fire_timer_counter += bt;
if (fire_timer_counter >= fire_timer) {
  fireBullet();
  fire_timer_counter = 0;
}

if (obj_Boss2WeakPoint.took_a_hit && (taking_damage < 0)) {
  taking_damage = 60;
}
if (taking_damage > 0) {
  taking_damage -= bt;
  if (taking_damage <= 0) {
    taking_damage = -999;
    obj_Boss2WeakPoint.took_a_hit = false;
    boss_health -= 1;
    fire_timer -= 10;
    with (obj_StationaryCrystal) {
      is_active = false;
    }
    if (boss_health <= 0) {
      kills_player_on_contact = false;
    }
  }
}
if (boss_health <= 0) {
  velocity_y += GRAVITY_CONSTANT * bt;
  velocity_x = 0;
  if (y > room_height + 96) {
    onEndOfBossFight();
    instance_destroy();
    exit;
  }
}