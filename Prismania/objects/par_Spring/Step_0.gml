
getCollisions(self, par_KinematicObject, collisions_list);
for (var i = 0; i < ds_list_size(collisions_list); i++) {
  var obj = collisions_list[| i];
  var center_x = mean(obj.bbox_left, obj.bbox_right);
  var center_y = mean(obj.bbox_top, obj.bbox_bottom);
  var dx = center_x - x;
  var dy = center_y - y;

  if (snap_angle) {
    // Smaller of dx or dy is zero
    if (abs(dx) < abs(dy)) {
      dx = 0;
    } else {
      dy = 0;
    }
  }

  if ((dx != 0) || (dy != 0)) {
    var d_len = sqrt(sqr(dx) + sqr(dy));
    var velocity_len = 0.9 * sqrt(sqr(obj.velocity_x) + sqr(obj.velocity_y));
    if (velocity_len < 2) {
      velocity_len = 2;
    }
    obj.velocity_x = (dx / d_len) * velocity_len;
    obj.velocity_y = (dy / d_len) * velocity_len;
  }
}