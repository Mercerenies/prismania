
event_inherited();

velocity_x = toward(velocity_x, walking_dir * max_speed, horizontal_acceleration);

if (walking_reset_timer > 0) {
  walking_reset_timer--;
}
facing_dir = walking_dir;