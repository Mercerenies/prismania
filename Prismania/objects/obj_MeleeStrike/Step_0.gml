
var bt = ctrl_BulletTimeManager.global_speed_multiplier;
image_speed = 0.7 * bt;

if (isShowingModal()) {
  exit;
}

if (!has_struck) {
  var collisions = ds_list_create();
  getCollisions(self, par_PhysicalObject, collisions);
  if (!ds_list_empty(collisions)) {
    has_struck = true;
  }
  for (var i = 0; i < ds_list_size(collisions); i++) {
    var curr = collisions[| i];
    var strike = new Strike(self, AttackType.PLAYER, attack_velocity_x, 0);
    curr.onStrike(strike);
  }
  ds_list_destroy(collisions);
}
