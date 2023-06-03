
event_inherited();

if (isShowingModal()) {
  exit;
}

var rage = 0;
var dead = true;
with (obj_Boss3WeakPoint) {
  if (took_a_hit) {
    rage += 1;
  } else {
    dead = false;
  }
}
var max_speed = 3.75 + 0.25 * rage;
var acceleration = 0.5;

var bt = ctrl_BulletTimeManager.global_speed_multiplier;

cannon3_angle += bt * 7;
cannon2_angle -= bt * 11;

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
target_y = 313 + 160 * sin(sine_tick * 2 * pi / 200);

var dx = target_x - x;
var dy = target_y - y;

if ((dx != 0) || (dy != 0)) {
  var d = sqrt(sqr(dx) + sqr(dy));
  dx = (dx / d) * max_speed;
  dy = (dy / d) * max_speed;
}
if (!dead) {
  velocity_x = toward(velocity_x, dx, acceleration);
  velocity_y = toward(velocity_y, dy, acceleration);
}

var fire_timer = 80 - 6 * rage;
fire_timer_counter += bt;
if (fire_timer_counter >= fire_timer) {
  fireBullet();
  fire_timer_counter = 0;
}

if (dead) {
  velocity_y += GRAVITY_CONSTANT * bt;
  velocity_x = 0;
  if (y > room_height + 108) {
    onEndOfBossFight();
    instance_destroy();
    exit;
  }
}