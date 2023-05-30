
draw_self();

draw_set_alpha(image_alpha);

draw_set_color(c_white);
draw_sprite(thumbnail_sprite, thumbnail_index, bbox_left + 96, bbox_top + 64);

draw_set_color(c_black);
draw_set_font(fnt_Title);
draw_text(bbox_left + 192, bbox_top + 40, title);
draw_set_font(fnt_Text);
draw_text_ext(bbox_left + 8, bbox_top + 100, text, -1, sprite_width - 20);

draw_set_alpha(1);