event_inherited();

onDraw = function(world) {
  if (getWorlds() & world) {
    draw_self();
  }
}
