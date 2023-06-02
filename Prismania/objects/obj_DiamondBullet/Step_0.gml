
event_inherited();

var bt = ctrl_BulletTimeManager.global_speed_multiplier;

if (isShowingModal()) {
  exit;
}

if (has_struck) {
  radius = lerp(0, max_radius, image_alpha);
} else {
  radius = toward(radius, max_radius, 6 * bt);
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
