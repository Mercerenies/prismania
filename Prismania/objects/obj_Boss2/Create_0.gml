
event_inherited();

kills_player_on_contact = true;
target_x = room_width / 2;
target_y = 313;
target_x_dir = 1;
sine_tick = 0;

velocity_x = 0;
velocity_y = 0;

cannon1_relative_x = 30;
cannon1_relative_y = 30;

cannon2_relative_x = -30;
cannon2_relative_y = 30;

fire_timer = 90;
fire_timer_counter = 0;
cannon = 1;

taking_damage = -999;
boss_health = 3;

fireBullet = function() {
  var xx = 0;
  var yy = 0;
  if (cannon == 1) {
    cannon = 2;
    xx = x + cannon1_relative_x;
    yy = y + cannon1_relative_y;
  } else {
    xx = x + cannon2_relative_x;
    yy = y + cannon2_relative_y;
  }
  var px = 0;
  var py = 0;
  if (instance_exists(obj_Player)) {
    px = mean(obj_Player.bbox_left, obj_Player.bbox_right);
    py = mean(obj_Player.bbox_top, obj_Player.bbox_bottom);
  }
  var target_angle = point_direction(xx, yy, px, py);
  var bullet_speed = 4;
  var vx = lengthdir_x(bullet_speed, target_angle);
  var vy = lengthdir_y(bullet_speed, target_angle);
  with (instance_create_layer(xx + vx * 2, yy + vy * 2, "Instances", obj_Bullet)) {
    velocity_x = vx;
    velocity_y = vy;
    owner = other.id;
    worlds = World.REGULAR | World.MIRROR;
  }
}

onDraw = function(world) {
  var spr = spr_Boss2;
  if (world == World.MIRROR) {
    spr = spr_Boss2Mirrored;
  }
  draw_sprite_ext(spr, 0, x, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
  //draw_set_color(c_white);
  //draw_circle(target_x, target_y, 4, false);

  var c1x = x + cannon1_relative_x;
  var c1y = y + cannon1_relative_y;
  var c2x = x + cannon2_relative_x;
  var c2y = y + cannon2_relative_y;
  var px = 0;
  var py = 0;
  if (instance_exists(obj_Player)) {
    px = mean(obj_Player.bbox_left, obj_Player.bbox_right);
    py = mean(obj_Player.bbox_top, obj_Player.bbox_bottom);
  }
  var idx = (world == World.MIRROR) ? 1 : 0;
  draw_sprite_ext(spr_CannonHead, idx, c1x, c1y, 1, 1, point_direction(c1x, c1y, px, py), c_white, 1);
  draw_sprite_ext(spr_CannonHead, idx, c2x, c2y, 1, 1, point_direction(c2x, c2y, px, py), c_white, 1);

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
  summonDia([
    new Dia(DialogueMugshot.GENERAL, "Urgh! You've bested me again, Prisman! But it doesn't matter."),
    new Dia(DialogueMugshot.GENERAL, "The King's plan is nearly ready. If you can reach him, he'll do you the honor of killing you himself."),
    new Dia(DialogueMugshot.GENERAL, "But you don't stand a chance. The King is so much stronger than I am! Mwahahahahaha!"),
  ]);
  setBossWalls(false);
  ctrl_UnlockedAbilities.boss2_defeated = true;
}

instance_create_layer(-99, -99, "Instances", obj_Boss2WeakPoint);
