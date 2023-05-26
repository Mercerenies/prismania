
assertSurfaces = function() {
  if (!surface_exists(mirror_surface)) {
    mirror_surface = surface_create(room_width, room_height);
  }
  if (!surface_exists(mirror_temp_surface)) {
    mirror_temp_surface = surface_create(room_width, room_height);
  }
}

mirror_surface = surface_create(room_width, room_height);
mirror_temp_surface = surface_create(room_width, room_height);