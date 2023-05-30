
event_inherited();

getHead = function(world) {
  return undefined;
}

getTorso = function(world) {
  return undefined;
}

getHeadBlend = function(world) {
  return c_white;
}

getTorsoBlend = function(world) {
  return c_white;
}

getBowIndex = function() {
  return undefined;
}

getBowAngle = function() {
  return 0;
}

getYAdjust = function() {
  return 2 * sin(sine_tick * 2 * pi / 60);
}

onDraw = function(world) {
  var head = getHead(world);
  var torso = getTorso(world);

  var yadjust = getYAdjust();

  var a = draw_get_alpha();
  draw_sprite_ext(torso, 0, xprevious + 8, yprevious + 24 + yadjust, facing_dir, 1, 0, getTorsoBlend(world), a);
  draw_sprite_ext(head, 0, x + 8 , y + 8 + yadjust, facing_dir, 1, 0, getHeadBlend(world), a);

  // Personal Crystal
  if (has_personal_crystal) {
    var blend = INACTIVE_CRYSTAL_COLOR;
    if (world == World.MIRROR) {
      blend = merge_color(INACTIVE_CRYSTAL_COLOR, ACTIVE_CRYSTAL_COLOR, crystal_blend_fade);
    }
    draw_sprite_ext(spr_PersonalCrystal, 0, xprevious + 8 + 2 * facing_dir, yprevious + 26 + yadjust, facing_dir, 1, 0, blend, 1);
  }

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

getCrystalData = function() {
  if (has_personal_crystal && is_personal_crystal_active) {
    var centerx = x + 8;
    var centery = y + 24;
    return new CrystalData(centerx, centery, personal_crystal_radius);
  } else {
    return undefined;
  }
}

sine_tick = random(60);

facing_dir = 1;

attack_velocity = 10;

has_personal_crystal = false;
is_personal_crystal_active = false;
personal_crystal_radius = 80;
crystal_blend_fade = 0;
