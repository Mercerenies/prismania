
// Safeguard
if (dia_index >= array_length(dia)) {
  exit;
}

draw_self();

draw_set_alpha(image_alpha);

var thumbnail_index = dia[dia_index].mugshot;

draw_set_color(c_white);
draw_sprite(spr_DialogueMugshot, thumbnail_index, bbox_left + 156, bbox_top + 156);

draw_set_color(c_black);
draw_set_font(fnt_DialogueText);
draw_text_ext(bbox_left + 312, bbox_top + 30, display_text, -1, sprite_width - 342);

draw_set_alpha(1);