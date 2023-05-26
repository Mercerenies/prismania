
event_inherited();

velocity_x = 0;
velocity_y = 0;

onDraw = function(world) {
  image_angle = point_direction(0, 0, velocity_x, velocity_y);
  draw_self();
}

has_struck = false;
collisions_list = ds_list_create();