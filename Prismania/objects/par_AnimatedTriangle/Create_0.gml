
img_speed = 0.5;
image_alpha = 0.1;

own_world = World.REGULAR;

onDraw = function(world) {
  image_index = floor(img);
  if (world == own_world) {
    draw_self();
  }
}