
event_inherited();

target_angle = 0;

fire_timer = 90;
fire_timer_counter = 0;
bullet_speed = 4;
bullet_worlds = World.REGULAR | World.MIRROR;
bullet_object_index = obj_Bullet;

onDraw = function(world) {
  draw_self();
  if (world & bullet_worlds) {
    draw_sprite_ext(spr_CannonHead, 0, x + 16, y + 16, 1, 1, target_angle, c_white, 1);
  }
}

fireBullet = function() {
  var vx = lengthdir_x(bullet_speed, target_angle);
  var vy = lengthdir_y(bullet_speed, target_angle);
  with (instance_create_layer(x + 16 + vx * 2, y + 16 + vy * 2, "Instances", bullet_object_index)) {
    velocity_x = vx;
    velocity_y = vy;
    owner = other.id;
    worlds = other.bullet_worlds;
  }
}

onStrike = function(strike) {
  var instance = strike.owner;
  if ((isSelfOrAncestor(instance.object_index, obj_Bullet)) && (instance.owner.id == self.id)) {
    // Do not consume bullets that were fired from this same cannon.
    return false;
  }
  return true;
}