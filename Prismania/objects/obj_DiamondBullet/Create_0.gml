
event_inherited();

onDraw = function(world) {
  var index = (world == World.MIRROR) ? 0 : 1;
  draw_sprite_ext(spr_DiamondBullet, index, x, y, 1, 1, angle, c_white, 1);
}

max_radius = 200;
radius = 0;
kills_player_on_contact = false;