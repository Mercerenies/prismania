
// dest can be an object type or a specific instance ID.
function collidesWith(source, dest) {
  with (source) {
    return place_meeting(x, y, dest);
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