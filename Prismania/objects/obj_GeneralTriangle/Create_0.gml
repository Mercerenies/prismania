
event_inherited();

getHead = function(world) {
  return spr_GeneralHead;
}

getTorso = function(world) {
  return spr_GeneralTorso;
}

max_speed = 2;
horizontal_acceleration = 0.5;
walking_dir = 1;
walking_reset_timer = 0;
kills_player_on_contact = true;
sword_tick = 0;
dying = false;

onHitWall = function() {
  if (walking_reset_timer <= 0) {
    walking_dir *= -1;
    walking_reset_timer = 10;
  }
}

getWorlds = function() {
  if (dying) {
    return World.NONE;
  } else {
    return World.MIRROR | World.REGULAR;
  }
}

onStrike = function(strike) {
  if ((strike.attack_type == AttackType.PLAYER) && (!dying)) {
    dying = true;
    strike.applyImpulse(self);
    return true;
  }
  return false;
}

_super_onDraw = onDraw;
onDraw = function(world) {
  _super_onDraw(world);
  var yadjust = getYAdjust();
  var rot = 10 * sin(sword_tick * 2 * pi / 40);
  draw_sprite_ext(spr_GeneralSword, 0, xprevious + 8, yprevious + 24 + yadjust, facing_dir, 1, rot, c_white, 1);
}