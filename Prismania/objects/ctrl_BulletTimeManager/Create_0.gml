
global_speed_multiplier = 1.0;

enterBulletTime = function() {
  global_speed_multiplier = BULLET_TIME_SPEED_MULTIPLIER;
}

exitBulletTime = function() {
  global_speed_multiplier = 1.0;
}