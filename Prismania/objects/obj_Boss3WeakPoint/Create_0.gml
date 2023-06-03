
event_inherited();

blend_tick = 0;

took_a_hit = false;

onStrike = function(strike) {
  if (instance_exists(obj_Boss3) && (strike.attack_type == AttackType.PLAYER)) {
    strike.applyImpulse(obj_Boss3.id);
    took_a_hit = true;
  }
}

angle = 0;
length = 103;