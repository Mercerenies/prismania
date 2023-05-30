
event_inherited();

onCollect = function() {
  if (!obj_Player.has_shield) {
    if (!ctrl_UnlockedAbilities.has_collected_shield) {
      ctrl_UnlockedAbilities.has_collected_shield = true;
      showUpgradeBox(spr_BigShield, 0, "Got a Greenshield!", "This shield automatically protects you from one death. But it only works in this room.");
    }
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