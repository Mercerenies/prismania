
event_inherited();

getHead = function(world) {
  if (world == World.MIRROR) {
    return spr_EnemyHeadMirrored;
  } else {
    return spr_EnemyHead;
  }
}

getTorso = function(world) {
  if (world == World.MIRROR) {
    return spr_EnemyTorsoMirrored;
  } else {
    return spr_EnemyTorso;
  }
}

max_speed = 2;
horizontal_acceleration = 1;
walking_dir = 1;
walking_reset_timer = 0;
kills_player_on_contact = true;

onHitWall = function() {
  if (walking_reset_timer <= 0) {
    walking_dir *= -1;
    walking_reset_timer = 10;
  }
}

onStrike = function(strike) {
  if (strike.is_player_attack) {
    strike.applyImpulse(self);
    walking_reset_timer = 10;
    return true;
  }
  return false;
}
