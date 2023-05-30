switch (image_index) {
case 0: // Wall jump
  if (ctrl_UnlockedAbilities.wall_jump) {
    instance_destroy();
  }
  break;
case 1: // Archery
  if (ctrl_UnlockedAbilities.archery) {
    instance_destroy();
  }
  break;
case 2: // Bullet Time
  if (ctrl_UnlockedAbilities.bullet_time) {
    instance_destroy();
  }
  break;
case 3: // Double Jump
  if (ctrl_UnlockedAbilities.double_jump) {
    instance_destroy();
  }
  break;
case 4: // Crystal Core
  if (ctrl_UnlockedAbilities.personal_crystal) {
    instance_destroy();
  }
  break;
}
