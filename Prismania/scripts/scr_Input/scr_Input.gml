
function keyLeft() {
  return keyboard_check(ord("A"));
}

function keyRight() {
  return keyboard_check(ord("D"));
}

function keyUpPressed() {
  return keyboard_check_pressed(ord("W")) || keyboard_check_pressed(vk_space);
}