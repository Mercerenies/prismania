
event_inherited();

if (isShowingModal()) {
  exit;
}

var bt = ctrl_BulletTimeManager.global_speed_multiplier;
blend_tick += bt;

if (took_a_hit) {
  image_blend = c_black;
} else {
  var blend_amount = 0.5 + 0.5 * sin(blend_tick * 2 * pi / 300);
  image_blend = merge_color(c_white, make_color_rgb(128, 128, 255), blend_amount);
}