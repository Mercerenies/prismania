
var target_blend = 0;
var target_radius = 0;
if (is_active) {
  target_blend = 1;
  target_radius = max_radius;
}
blend_fade = toward(blend_fade, target_blend, 0.1);
radius = toward(radius, target_radius, 6);