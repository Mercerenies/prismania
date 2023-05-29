
event_inherited();

onDraw = function(world) {
  if (world == World.MIRROR) {
    sprite_index = spr_SmallBlockMirrored;
  } else {
    sprite_index = spr_SmallBlock;
  }
  draw_self();
}

intoCarriedBlock = function() {
  return new SmallCarriedBlock();
}
