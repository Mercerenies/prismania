
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
  // Now filter out collisions that aren't in the right worlds.
  // (Iterate from the back to avoid unnecessary shifting of
  // list elements)
  for (var i = ds_list_size(lst) - 1; i >= 0; i--) {
    var curr = lst[| i];
    if (!_isCollisionReal(source, curr)) {
      ds_list_delete(lst, i);
    }
  }
}

// Note: All collisions include boundaries on all sides.
function _isCollisionReal(object1, object2) {
  var common_worlds = object1.getWorlds() & object2.getWorlds();
  if (common_worlds == World.MIRROR | World.REGULAR) {
    // Easy case, don't do complicated stuff and just return true.
    return true;
  }

  var rect_x1 = max(object1.bbox_left, object2.bbox_left);
  var rect_y1 = max(object1.bbox_top, object2.bbox_top);
  var rect_x2 = min(object1.bbox_right, object2.bbox_right);
  var rect_y2 = min(object1.bbox_bottom, object2.bbox_bottom);
  var rect_w = rect_x2 - rect_x1;
  var rect_h = rect_y2 - rect_y1;
  
  var crystals = []
  var crystals_i = 0;
  with (par_PhysicalObject) {
    var crystal_data = getCrystalData();
    if (!is_undefined(crystal_data)) {
      crystals[crystals_i++] = crystal_data;
    }
  }

  if (common_worlds & World.MIRROR) {
    // Imperfect but reasonable algorithm: test the following:
    // * The four vertices of the rectangle
    // * The four midpoints of the perimeter
    // * The center
    if (_pointInCrystals(rect_x1, rect_y1, crystals)) {
      return true;
    }
    if (_pointInCrystals(rect_x2, rect_y1, crystals)) {
      return true;
    }
    if (_pointInCrystals(rect_x2, rect_y2, crystals)) {
      return true;
    }
    if (_pointInCrystals(rect_x1, rect_y2, crystals)) {
      return true;
    }
    if (_pointInCrystals(mean(rect_x1, rect_x2), mean(rect_y1, rect_y2), crystals)) {
      return true;
    }
    if (_pointInCrystals(rect_x1, mean(rect_y1, rect_y2), crystals)) {
      return true;
    }
    if (_pointInCrystals(rect_x2, mean(rect_y1, rect_y2), crystals)) {
      return true;
    }
    if (_pointInCrystals(mean(rect_x1, rect_x2), rect_y1, crystals)) {
      return true;
    }
    if (_pointInCrystals(mean(rect_x1, rect_x2), rect_y2, crystals)) {
      return true;
    }
  }
  if (common_worlds & World.REGULAR) {
    // Imperfect but reasonable algorithm: test the following:
    // * The four vertices of the rectangle
    // * The four midpoints of the perimeter
    // * The center
    if (!_pointInCrystals(rect_x1, rect_y1, crystals)) {
      return true;
    }
    if (!_pointInCrystals(rect_x2, rect_y1, crystals)) {
      return true;
    }
    if (!_pointInCrystals(rect_x2, rect_y2, crystals)) {
      return true;
    }
    if (!_pointInCrystals(rect_x1, rect_y2, crystals)) {
      return true;
    }
    if (!_pointInCrystals(mean(rect_x1, rect_x2), mean(rect_y1, rect_y2), crystals)) {
      return true;
    }
    if (!_pointInCrystals(rect_x1, mean(rect_y1, rect_y2), crystals)) {
      return true;
    }
    if (!_pointInCrystals(rect_x2, mean(rect_y1, rect_y2), crystals)) {
      return true;
    }
    if (!_pointInCrystals(mean(rect_x1, rect_x2), rect_y1, crystals)) {
      return true;
    }
    if (!_pointInCrystals(mean(rect_x1, rect_x2), rect_y2, crystals)) {
      return true;
    }
  }
  return false;
}

function _pointInCrystals(point_x, point_y, crystal_array) {
  for (var i = 0; i < array_length(crystal_array); i++) {
    var crystal_data = crystal_array[i];
    if (point_in_circle(point_x, point_y, crystal_data.xx, crystal_data.yy, crystal_data.radius)) {
      return true;
    }
  }
  return false;
}

function rectangleIntersectsCircle(rx, ry, rw, rh, cx, cy, rad) {
  // https://stackoverflow.com/a/402010/2288659
  var dx = abs(cx - rx);
  var dy = abs(cy - ry);
  if (dx > rw / 2 + rad) {
    return false;
  }
  if (dy > rh / 2 + rad) {
    return false;
  }
  if (dx <= rw / 2) {
    return true;
  }
  if (dy <= rh / 2) {
    return true;
  }
  var corner_sq = sqr(dx - rw / 2) + sqr(dy - rh / 2);
  return corner_sq <= sqr(rad);
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
