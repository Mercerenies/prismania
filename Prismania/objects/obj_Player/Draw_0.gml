
var yadjust = 2 * sin(sine_tick * 2 * pi / 60);

draw_sprite_ext(spr_PlayerTorso, 0, xprevious + 8, yprevious + 24 + yadjust, last_x_dir, 1, 0, c_white, 1);
draw_sprite_ext(spr_PlayerHead, 0, x + 8 , y + 8 + yadjust, last_x_dir, 1, 0, c_white, 1);