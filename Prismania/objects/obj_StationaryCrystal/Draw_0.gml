
var blend = merge_color(INACTIVE_CRYSTAL_COLOR, ACTIVE_CRYSTAL_COLOR, blend_fade);

draw_sprite_ext(spr_StationaryCrystal, 0, x, y, 1, 1, 0, blend, 1);