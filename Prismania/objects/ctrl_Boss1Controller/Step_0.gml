
var rage = 3 - boss_health;

// Destroy stale objects
with (obj_GeneralTriangle) {
  if (y > room_height + 128) {
    if (dying) {
      other.boss_health -= 1;
    }
    instance_destroy();
  }
}
with (obj_GeneralTriangleMinion) {
  if (y > room_height + 128) {
    instance_destroy();
  }
}

if (boss_health <= 0) {
  onEndOfBossFight();
  instance_destroy();
  exit;
}

// Create new objects if needed
if (instance_number(obj_GeneralTriangle) < 1) {
  with (instance_create_layer(random_range(100, 1000), -64, "Instances", obj_GeneralTriangle)) {
    walking_dir = choose(-1, 1);
    max_speed = 2 + rage;
  }
}
if (instance_number(obj_GeneralTriangleMinion) < power(2, rage) - 1) {
  with (instance_create_layer(random_range(100, 1000), -64, "Instances", obj_GeneralTriangleMinion)) {
    walking_dir = choose(-1, 1);
    max_speed = 2 + rage;
  }
}