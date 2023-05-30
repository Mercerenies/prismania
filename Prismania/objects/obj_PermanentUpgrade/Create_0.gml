
event_inherited();

image_speed = 0;

onCollect = function() {
  switch (image_index) {
  case 0: // Wall jump
    ctrl_UnlockedAbilities.wall_jump = true;
    break;
  case 1: // Archery
    ctrl_UnlockedAbilities.archery = true;
    break;
  case 2: // Bullet Time
    ctrl_UnlockedAbilities.bullet_time = true;
    break;
  case 3: // Double Jump
    ctrl_UnlockedAbilities.double_jump = true;
    break;
  case 4: // Crystal Core
    ctrl_UnlockedAbilities.personal_crystal = true;
    break;
  }
  showUpgradeBoxFor(image_index);
  instance_destroy();
}

onDraw = function(world) {
  var yadjust = 8 * sin(sine_tick * 2 * pi / 60);
  draw_sprite(sprite_index, image_index, x, y + yadjust);
}

sine_tick = random(60);