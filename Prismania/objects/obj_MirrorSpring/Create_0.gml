
event_inherited();

getWorlds = function() {
  return World.MIRROR;
}

onDraw = function(world) {
  if (world == World.MIRROR) {
    draw_self();
  }
}