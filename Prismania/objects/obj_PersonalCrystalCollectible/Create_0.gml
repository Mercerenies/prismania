
event_inherited();

onCollect = function() {
  if (ctrl_UnlockedAbilities.personal_crystal) {
    obj_Player.has_personal_crystal = true;
    instance_destroy();
  }
}

onDraw = function(world) {
  var yadjust = 5 * sin(sine_tick * 2 * pi / 60);
  if (world == World.MIRROR) {
    sprite_index = spr_PersonalCrystalCollectibleMirrored;
  } else {
    sprite_index = spr_PersonalCrystalCollectible;
  }
  var yadjust = 
  draw_sprite(sprite_index, 0, x, y + yadjust);
}

sine_tick = random(60);