
// TODO I don't like the FPS hit here at all!

// Angle uses the Game Maker convention (so quadrant 1 is the negative Y axis, or up)
function drawArrowTrajectory(xorigin, yorigin, angle) {
  // Safety check; this instance should always exist.
  if (!instance_exists(obj_ArrowMaskSimulator)) {
    return;
  }

  draw_set_color(c_white);
  draw_set_alpha(0);
  gpu_set_blendmode_ext(bm_inv_dest_color, bm_inv_src_color);
  var arrow_velocity_x = lengthdir_x(10, angle);
  var arrow_velocity_y = lengthdir_y(10, angle);
  var xx = xorigin + arrow_velocity_x;
  var yy = yorigin + arrow_velocity_y;
  for (var i = 0; i < 60; i++) {
    if (i % 3 == 0) {
      draw_line(xx, yy, xx + arrow_velocity_x * 2, yy + arrow_velocity_y * 2);
    }
    if ((i % 10 == 0) || (sqr(arrow_velocity_x) + sqr(arrow_velocity_y) > 11)) {
      obj_ArrowMaskSimulator.x = xx;
      obj_ArrowMaskSimulator.y = yy;
      if (collidesWith(obj_ArrowMaskSimulator.id, par_Solid) || (yy > room_height)) {
        break;
      }
    }
    xx += 2 * arrow_velocity_x;
    yy += 2 * arrow_velocity_y;
    arrow_velocity_y += 2 * ARROW_GRAVITY_CONSTANT;
  }
  draw_set_alpha(1);
  gpu_set_blendmode(bm_normal);
}
