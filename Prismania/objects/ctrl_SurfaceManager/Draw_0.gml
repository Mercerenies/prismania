
assertSurfaces();

// I want to control iteration order, so we make an
// array here and sort it. Draw from oldest object
// to newest one.
var objects = arrayOf(par_PhysicalObject);
array_sort(objects, function(a, b) { return a.id - b.id; });

// Draw regular world
draw_set_color(c_black); // DEBUG CODE
draw_rectangle(0, 0, room_width, room_height, false); // DEBUG CODE
for (var i = 0; i < array_length(objects); i++) {
  with (objects[i]) {
    onDraw(World.REGULAR);
  }
}

// Draw mirror world
surface_set_target(mirror_surface);
draw_set_color(c_aqua); // DEBUG CODE
draw_rectangle(0, 0, room_width, room_height, false); // DEBUG CODE
for (var i = 0; i < array_length(objects); i++) {
  with (objects[i]) {
    onDraw(World.MIRROR);
  }
}
surface_reset_target();

// Draw parts of the mirror world
surface_set_target(mirror_temp_surface);
draw_set_color(c_black);
draw_rectangle(0, 0, room_width, room_height, false);
gpu_set_blendmode(bm_subtract);
for (var i = 0; i < array_length(objects); i++) {
  var crystal_data = objects[i].getCrystalData();
  if (!is_undefined(crystal_data)) {
    draw_set_color(c_black);
    draw_circle(crystal_data.xx, crystal_data.yy, crystal_data.radius, false);
  }
}
surface_reset_target();
surface_set_target(mirror_surface);
draw_surface(mirror_temp_surface, 0, 0);
surface_reset_target();
gpu_set_blendmode(bm_normal);
draw_surface(mirror_surface, 0, 0);