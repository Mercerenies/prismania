
function Strike(owner_, attack_type_, velocity_x_, velocity_y_) constructor {
  owner = owner_; // Instance that is performing the strike.
  attack_type = attack_type_; // AttackType enum constant.
  velocity_x = velocity_x_;
  velocity_y = velocity_y_;

  static applyImpulse = function(target_obj) {
    var bt = ctrl_BulletTimeManager.global_speed_multiplier;
    var xdirection = (velocity_x < 0 ? -1 : 1);
    var strike_speed = sqrt(sqr(velocity_x) + sqr(velocity_y));
    target_obj.velocity_x = xdirection * lengthdir_x(strike_speed, 45);
    target_obj.velocity_y = lengthdir_y(strike_speed, 45);
    target_obj.x += target_obj.velocity_x * bt;
    target_obj.y += target_obj.velocity_y * bt;
  }

}
