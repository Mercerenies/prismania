
event_inherited();

velocity_x = 4;
if (y > room_height) {
  velocity_y = -12;
} else {
  velocity_y = -7;
}

onDraw = function(world) {
  sprite_index = spr_PlayerTorso;
  if (world == World.MIRROR) {
    sprite_index = spr_PlayerTorsoMirrored;
  }
  draw_self();
}