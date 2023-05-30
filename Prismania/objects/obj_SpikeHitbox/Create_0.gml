// The spike object itself counts as a wall. This is
// the pointy part of the spike at the top that actually
// kills you.

event_inherited();

kills_player_on_contact = true;
worlds = World.REGULAR | World.MIRROR;

getWorlds = function() {
  return worlds;
}

onDraw = function() {}