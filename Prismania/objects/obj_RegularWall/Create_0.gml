event_inherited()

onDraw = function(world) {
  if (world == World.REGULAR) {
    draw_self();
  }
}

getWorlds = function() {
  return World.REGULAR;
}