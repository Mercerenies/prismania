event_inherited();

var bt = ctrl_BulletTimeManager.global_speed_multiplier;

// Animation tick
sine_tick += 1 * bt;

// Personal crystal blend
var target_blend = 0;
if (is_personal_crystal_active) {
  target_blend = 1;
}
crystal_blend_fade = toward(crystal_blend_fade, target_blend, 0.1 * bt);
