event_inherited();

if (isShowingModal()) {
  exit;
}

var bt = ctrl_BulletTimeManager.global_speed_multiplier;

// Friction
if (isOnGround(self)) {
  velocity_x *= (1 - 0.2 * bt);
  if (abs(velocity_x) < 0.2) {
    velocity_x = 0;
  }
}

// Collisions
ds_list_clear(collisions_list);
getCollisions(self, par_PhysicalObject, collisions_list);
for (var i = 0; i < ds_list_size(collisions_list); i++) {
  var curr = collisions_list[| i];
  var strike = new Strike(self, AttackType.NEUTRAL, velocity_x, velocity_y);
  var consumed = curr.onStrike(strike);
  if (consumed) {
    break;
  }
}
