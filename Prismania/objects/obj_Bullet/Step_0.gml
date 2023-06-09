
event_inherited();

var bt = ctrl_BulletTimeManager.global_speed_multiplier;

if (isShowingModal()) {
  exit;
}

if (has_struck) {
  image_alpha = toward(image_alpha, 0, 0.05);
  if (image_alpha <= 0) {
    instance_destroy();
  }
} else {

  x += velocity_x * bt;
  y += velocity_y * bt;

  // Collisions
  ds_list_clear(collisions_list);
  getCollisions(self, par_PhysicalObject, collisions_list);
  for (var i = 0; i < ds_list_size(collisions_list); i++) {
    var curr = collisions_list[| i];
    var strike = new Strike(self, AttackType.ENEMY, velocity_x, velocity_y);
    var consumed = curr.onStrike(strike);
    if (consumed) {
      has_struck = true;
      break;
    }
  }

  // Angle animation
  angle += bt * 10;

}
