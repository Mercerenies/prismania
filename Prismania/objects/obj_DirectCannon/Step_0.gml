
event_inherited();

if (instance_exists(obj_Player)) {
  var cx = mean(obj_Player.bbox_left, obj_Player.bbox_right);
  var cy = mean(obj_Player.bbox_top, obj_Player.bbox_bottom);
  target_angle = point_direction(x + 16, y + 16, cx, cy);
}