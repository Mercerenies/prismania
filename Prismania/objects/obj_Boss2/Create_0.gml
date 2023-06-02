
event_inherited();

kills_player_on_contact = true;
target_x = room_width / 2;
target_y = 313;
target_x_dir = 1;
sine_tick = 0;

velocity_x = 0;
velocity_y = 0;

onDraw = function(world) {
  var spr = spr_Boss2;
  if (world == World.MIRROR) {
    spr = spr_Boss2Mirrored;
  }
  draw_sprite_ext(spr, 0, x, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
  //draw_set_color(c_white);
  //draw_circle(target_x, target_y, 4, false);
}