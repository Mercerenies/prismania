
event_inherited();

getWorlds = function() {
  return World.REGULAR;
}

onDraw = function(world) {
  if (world == World.REGULAR) {
    draw_self();
  }
}