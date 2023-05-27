
event_inherited();

_repelAwayFrom = function(collisions) {
  // Calculate average direction to the collided objects.
  var center_x = mean(bbox_left, bbox_right);
  var center_y = mean(bbox_top, bbox_bottom);
  var xx = 0;
  var yy = 0;
  for (var i = 0; i < ds_list_size(collisions); i++) {
    var c = collisions[| i];
    var collision_center_x1 = mean(max(bbox_left, c.bbox_left));
    var collision_center_y1 = mean(max(bbox_top, c.bbox_top));
    var collision_center_x2 = mean(min(bbox_right, c.bbox_right));
    var collision_center_y2 = mean(min(bbox_bottom, c.bbox_bottom));
    xx += (mean(collision_center_x1, collision_center_x2) - center_x);
    yy += (mean(collision_center_y1, collision_center_y2) - center_y);
  }
  if ((xx != 0) || (yy != 0)) {
    var length = sqrt(sqr(xx) + sqr(yy));
    x -= 3 * xx / length;
    y -= 3 * yy / length;
  }
}

onHitWall = function() {
  // Called when we hit a wall to the left or right.
}

velocity_x = 0;
velocity_y = 0;
