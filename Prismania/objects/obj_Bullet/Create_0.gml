
event_inherited();

velocity_x = 0;
velocity_y = 0;

onDraw = function(world) {
  var spr = undefined;
  if (world == World.MIRROR) {
    if (worlds & World.MIRROR) {
      spr = spr_BulletMirrored;
    } else {
      spr = spr_BulletOutlineMirrored;
    }
  } else {
    if (worlds & World.REGULAR) {
      spr = spr_Bullet;
    } else {
      spr = spr_BulletOutline;
    }
  }
  draw_sprite_ext(spr, 0, x, y, 1, 1, angle, c_white, 1);
}

getWorlds = function() {
  return worlds;
}

owner = undefined;
has_struck = false;
collisions_list = ds_list_create();
kills_player_on_contact = true;
worlds = World.REGULAR | World.MIRROR;
angle = 0;