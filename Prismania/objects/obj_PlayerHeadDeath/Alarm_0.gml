
if (y > room_height) {
  room_restart();
  instance_destroy();
} else {
  alarm[0] = 1;
}