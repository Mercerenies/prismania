
// Angle uses the Game Maker convention (so quadrant 1 is the negative Y axis, or up)
function drawArrowTrajectory(xorigin, yorigin, angle, color) {
  draw_set_color(color);
  var xx = xorigin;
  var yy = yorigin;
  var arrow_velocity_x = lengthdir_x(10, angle);
  var arrow_velocity_y = lengthdir_y(10, angle);
  for (var i = 0; i < 100; i++) {
    if (i % 3 == 2) {
      draw_line(xx, yy, xx + arrow_velocity_x, yy + arrow_velocity_y);
    }
    xx += arrow_velocity_x;
    yy += arrow_velocity_y;
    arrow_velocity_y += ARROW_GRAVITY_CONSTANT;
  }
}