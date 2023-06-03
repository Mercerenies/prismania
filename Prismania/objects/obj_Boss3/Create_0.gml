
event_inherited();

kills_player_on_contact = true;
target_x = room_width / 2;
target_y = 313;
target_x_dir = 1;
sine_tick = 0;

velocity_x = 0;
velocity_y = 0;

cannon1_relative_x = 40;
cannon1_relative_y = 40;

cannon2_relative_x = 40;
cannon2_relative_y = -40;
cannon2_angle = random(360);

cannon3_relative_x = -40;
cannon3_relative_y = -40;
cannon3_angle = random(360);

cannon4_relative_x = -40;
cannon4_relative_y = 40;

fire_timer_counter = 0;
cannon = 0;

taking_damage = -999;

fireBullet = function() {
  var px = 0;
  var py = 0;
  if (instance_exists(obj_Player)) {
    px = mean(obj_Player.bbox_left, obj_Player.bbox_right);
    py = mean(obj_Player.bbox_top, obj_Player.bbox_bottom);
  }
  var xx = 0;
  var yy = 0;
  var angle = 0;
  var type = obj_Bullet;
  switch (cannon) {
  case 0:
    xx = x + cannon1_relative_x;
    yy = y + cannon1_relative_y;
    angle = point_direction(xx, yy, px, py);
    break;
  case 1:
    xx = x + cannon2_relative_x;
    yy = y + cannon2_relative_y;
    angle = cannon2_angle;
    type = obj_DiamondBullet;
    break;
  case 2:
    xx = x + cannon3_relative_x;
    yy = y + cannon3_relative_y;
    angle = cannon3_angle;
    type = obj_DiamondBullet;
    break;
  case 3:
    xx = x + cannon4_relative_x;
    yy = y + cannon4_relative_y;
    angle = point_direction(xx, yy, px, py);
    break;
  }
  cannon = (cannon + 1) % 4;
  var bullet_speed = 4;
  var vx = lengthdir_x(bullet_speed, angle);
  var vy = lengthdir_y(bullet_speed, angle);
  with (instance_create_layer(xx + vx * 2, yy + vy * 2, "Instances", type)) {
    velocity_x = vx;
    velocity_y = vy;
    owner = other.id;
    worlds = World.REGULAR | World.MIRROR;
  }
}

onDraw = function(world) {
  var spr = spr_Boss3;
  if (world == World.MIRROR) {
    spr = spr_Boss3Mirrored;
  }
  draw_sprite_ext(spr, 0, x, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
  //draw_set_color(c_white);
  //draw_circle(target_x, target_y, 4, false);

  var c1x = x + cannon1_relative_x;
  var c1y = y + cannon1_relative_y;
  var c2x = x + cannon2_relative_x;
  var c2y = y + cannon2_relative_y;
  var c3x = x + cannon3_relative_x;
  var c3y = y + cannon3_relative_y;
  var c4x = x + cannon4_relative_x;
  var c4y = y + cannon4_relative_y;
  var px = 0;
  var py = 0;
  if (instance_exists(obj_Player)) {
    px = mean(obj_Player.bbox_left, obj_Player.bbox_right);
    py = mean(obj_Player.bbox_top, obj_Player.bbox_bottom);
  }
  var idx = (world == World.MIRROR) ? 3 : 2;
  draw_sprite_ext(spr_CannonHead, idx, c1x, c1y, 1, 1, point_direction(c1x, c1y, px, py), c_white, 1);
  draw_sprite_ext(spr_CannonHead, idx, c2x, c2y, 1, 1, cannon2_angle, c_white, 1);
  draw_sprite_ext(spr_CannonHead, idx, c3x, c3y, 1, 1, cannon3_angle, c_white, 1);
  draw_sprite_ext(spr_CannonHead, idx, c4x, c4y, 1, 1, point_direction(c2x, c2y, px, py), c_white, 1);

}

onStrike = function(strike) {
  var instance = strike.owner;
  if ((isSelfOrAncestor(instance.object_index, obj_Bullet)) && (instance.owner.id == self.id)) {
    // Do not consume bullets that were fired from this same cannon.
    return false;
  }
  return true;
}

onEndOfBossFight = function() {
  /////
}

for (var i = 0; i < 360; i += 45) {
  with (instance_create_layer(-99, -99, "Instances", obj_Boss3WeakPoint)) {
    angle = i;
  }
}