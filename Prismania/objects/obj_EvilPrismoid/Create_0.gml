
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
    var xdirection = (strike.velocity_x < 0 ? -1 : 1);
    var strike_speed = sqrt(sqr(strike.velocity_x) + sqr(strike.velocity_y));
    velocity_x = xdirection * lengthdir_x(strike_speed, 45);
    velocity_y = lengthdir_y(strike_speed, 45);
    walking_reset_timer = 10;
    return true;
  }
  return false;
}
