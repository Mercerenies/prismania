
img_speed = 0.5;

var rnd = room * 3 + floor(x / 32) + floor(y / 32);
if ((rnd % 4 == 0) || (rnd % 4 == 1)) {
  img_speed *= -1;
}

img = irandom(29);
if (own_world == World.MIRROR) {
  image_blend = c_aqua;
} else {
  image_blend = c_white;
}
