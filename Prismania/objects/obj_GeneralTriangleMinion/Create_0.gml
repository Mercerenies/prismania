
event_inherited();

getHead = function(world) {
  return spr_EnemyHead;
}

getTorso = function(world) {
  return spr_EnemyTorso;
}

max_speed = 2;
horizontal_acceleration = 0.5;
walking_dir = 1;
walking_reset_timer = 0;
kills_player_on_contact = true;
sword_tick = 0;
dying = false;

onHitWall = function() {
  if (walking_reset_timer <= 0) {
    walking_dir *= -1;
    walking_reset_timer = 10;
  }
}

getWorlds = function() {
  if (dying) {
    return World.NONE;
  } else {
    return World.MIRROR | World.REGULAR;
  }
}

onStrike = function(strike) {
  if ((strike.attack_type == AttackType.PLAYER) && (!dying)) {
    dying = true;
    strike.applyImpulse(self);
    return true;
  }
  return false;
}
