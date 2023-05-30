
event_inherited();

target_angle = 0;

onDraw = function() {
  draw_self();
  draw_sprite_ext(spr_CannonHead, 0, x + 16, y + 16, 1, 1, target_angle, c_white, 1);
}