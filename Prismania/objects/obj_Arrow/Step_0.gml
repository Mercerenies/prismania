
if (has_struck) {
  image_alpha = toward(image_alpha, 0, 0.05);
  if (image_alpha <= 0) {
    instance_destroy();
  }
} else {

  x += velocity_x;
  y += velocity_y;

  // Gravity
  velocity_y += GRAVITY_CONSTANT / 6;

  // Collisions
  ds_list_clear(collisions_list);
  getCollisions(self, par_PhysicalObject, collisions_list);
  for (var i = 0; i < ds_list_size(collisions_list); i++) {
    var curr = collisions_list[| i];
    var consumed = curr.onStrike(true);
    if (consumed) {
      has_struck = true;
      break;
    }
  }

}