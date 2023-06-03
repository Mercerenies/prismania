
function keyLeft() {
  return keyboard_check(ord("A"));
}

function keyRight() {
  return keyboard_check(ord("D"));
}

function keyUpPressed() {
  return keyboard_check_pressed(ord("W")) || keyboard_check_pressed(vk_space);
}

function leftMouseReleased() {
  return mouse_check_button_released(mb_left);
}

function leftMousePressed() {
  return mouse_check_button_pressed(mb_left);
}

function rightMousePressed() {
  return mouse_check_button_pressed(mb_right) || keyboard_check_pressed(vk_shift);
}

function rightMouseDown() {
  return mouse_check_button(mb_right) || keyboard_check(vk_shift);
}

function backspacePressed() {
  return keyboard_check_pressed(vk_backspace);
}

function helpPressed() {
  return keyboard_check_pressed(vk_f1);
}
