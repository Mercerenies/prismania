
event_inherited();

getHead = function(world) {
  return undefined;
}

getTorso = function(world) {
  return undefined;
}

getBowIndex = function() {
  return undefined;
}

getBowAngle = function() {
  return 0;
}

onDraw = function(world) {
  var head = getHead(world);
  var torso = getTorso(world);

  var yadjust = 2 * sin(sine_tick * 2 * pi / 60);

  draw_sprite_ext(torso, 0, xprevious + 8, yprevious + 24 + yadjust, facing_dir, 1, 0, c_white, 1);
  draw_sprite_ext(head, 0, x + 8 , y + 8 + yadjust, facing_dir, 1, 0, c_white, 1);

  // Bow and arrow
  var bow_index = getBowIndex();
  if (!is_undefined(bow_index)) {
    var bow_dir = getBowAngle();
    var bow_sprite = (world == World.MIRROR ? spr_BowMirrored : spr_Bow);
    draw_sprite_ext(bow_sprite, floor(bow_index), x + 8, y + 12 + yadjust, 1, 1, bow_dir, c_white, 1);
  }
}

fireArrow = function() {
  var dir = getBowAngle();
  with (instance_create_layer(x + 8, y + 12, "Instances", obj_Arrow)) {
    velocity_x = lengthdir_x(other.attack_velocity, dir);
    velocity_y = lengthdir_y(other.attack_velocity, dir);
  }
}

sine_tick = 0;

facing_dir = 1;

attack_velocity = 10;
