
function Strike(is_player_attack_, velocity_x_, velocity_y_) constructor {
  is_player_attack = is_player_attack_;
  velocity_x = velocity_x_;
  velocity_y = velocity_y_;

  static applyImpulse = function(target_obj) {
    var xdirection = (velocity_x < 0 ? -1 : 1);
    var strike_speed = sqrt(sqr(velocity_x) + sqr(velocity_y));
    target_obj.velocity_x = xdirection * lengthdir_x(strike_speed, 45);
    target_obj.velocity_y = lengthdir_y(strike_speed, 45);
  }

}
