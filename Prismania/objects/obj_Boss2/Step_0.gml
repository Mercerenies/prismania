
event_inherited();

if (isShowingModal()) {
  exit;
}

var max_speed = 4;
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
velocity_x = toward(velocity_x, dx, acceleration);
velocity_y = toward(velocity_y, dy, acceleration);