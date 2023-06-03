
if (!instance_exists(obj_Boss3)) {
  instance_destroy();
  exit;
}

x = obj_Boss3.x + lengthdir_x(length, angle);
y = obj_Boss3.y + lengthdir_y(length, angle);
