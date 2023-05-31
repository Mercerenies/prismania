
// This object is NOT a par_PhysicalObject, though it behaves
// similar to one. Help text is drawn on its own layer, between
// the tile layer and the physical object layer.

image_speed = 0;

onDraw = function(world) {
  if (world == World.MIRROR) {
    image_blend = c_dkgray;
  }
  draw_self();
  image_blend = c_white;
}