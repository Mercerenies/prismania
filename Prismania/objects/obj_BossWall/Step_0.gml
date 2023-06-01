
event_inherited();

// Note: DOES run during modals

var bt = ctrl_BulletTimeManager.global_speed_multiplier;

var target_alpha = (is_active ? 1 : 0);
image_alpha = toward(image_alpha, target_alpha, bt * 0.1);