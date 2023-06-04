
image_alpha = toward(image_alpha, 1, 0.1);

if (position_meeting(mouse_x, mouse_y, self)) {
  image_xscale = 1.2;
  image_yscale = 1.2;
  if (leftMouseReleased()) {
    room_goto(rm_Intro);
  }
} else {
  image_xscale = 1;
  image_yscale = 1;
}
