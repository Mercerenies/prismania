
event_inherited();

max_radius = 120;
blend_fade = 0;
is_active = false;

radius = 0;

onStrike = function() {
  is_active = !is_active;
}

onDraw = function(world) {
  var blend = INACTIVE_CRYSTAL_COLOR;
  if (world == World.MIRROR) {
    blend = merge_color(INACTIVE_CRYSTAL_COLOR, ACTIVE_CRYSTAL_COLOR, blend_fade);
  }
  draw_sprite_ext(spr_StationaryCrystal, 0, x, y, 1, 1, 0, blend, 1);
}

getCrystalData = function() {
  if (radius > 0) {
    var centerx = mean(bbox_left, bbox_right);
    var centery = mean(bbox_top, bbox_bottom);
    return new CrystalData(centerx, centery, radius);
  } else {
    return undefined;
  }
}