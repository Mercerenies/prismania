
event_inherited();

onCollect = function() {
  if (!obj_Player.has_shield) {
    obj_Player.has_shield = true;
    instance_destroy();
  }
}

onDraw = function(world) {
  var yadjust = 5 * sin(sine_tick * 2 * pi / 60);
  if (world == World.MIRROR) {
    sprite_index = spr_ShieldCollectibleMirrored;
  } else {
    sprite_index = spr_ShieldCollectible;
  }
  draw_sprite(sprite_index, 0, x, y + yadjust);
}

sine_tick = random(60);