
if (fading_out) {
  image_alpha = toward(image_alpha, 0, 0.1);
  if (image_alpha <= 0) {
    instance_destroy();
  }
} else {
  image_alpha = toward(image_alpha, 1, 0.05);
}

tick += 1;
if (tick > 45) {
  can_exit = true;
}

if (can_exit && leftMouseReleased()) {
  fading_out = true;
}