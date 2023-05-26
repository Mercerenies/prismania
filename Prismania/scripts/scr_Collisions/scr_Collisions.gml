
// dest can be an object type or a specific instance ID.
function collidesWith(source, dest) {
  // Use a single global ds_list to avoid a bunch of unnecessary allocations
  // when all we want is whether or not one exists.
  getCollisions(source, dest, global.collisions_list);
  return !ds_list_empty(global.collisions_list);
}

// Return value is only good until the next getCollisions call,
// for efficiency reasons.
function getCollisions(source, dest, lst) {
  ds_list_clear(lst);
  with (source) {
    instance_place_list(x, y, dest, lst, false);
  }
}

function moveToCollision(source, vx, vy, dest, maxtries) {
  var i = 0;
  while ((!collidesWith(source, dest)) && (i <= maxtries)) {
    source.x += vx;
    source.y += vy;
    i += 1;
  }
  source.x -= vx;
  source.y -= vy;
}

function isOnGround(source) {
  var currently_in_wall = collidesWith(source, par_Solid);
  source.y += 1;
  var above_wall = collidesWith(source, par_Solid);
  source.y -= 1;
  return above_wall && !currently_in_wall;
}

function isPressedOnWall(source) {
  var currently_in_wall = collidesWith(source, par_Solid);
  source.x += 1;
  var right_wall = collidesWith(source, par_Solid);
  source.x -= 2;
  var left_wall = collidesWith(source, par_Solid);
  source.x += 1;
  return (!currently_in_wall) && (left_wall || right_wall);
}
