event_inherited()

onDraw = function(world) {
  if (world == World.MIRROR) {
    draw_self();
  }
}

getWorlds = function() {
  return World.MIRROR;
}