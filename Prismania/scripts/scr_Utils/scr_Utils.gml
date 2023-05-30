
function toward(initial, target, delta) {
  if (abs(target - initial) <= delta) {
    return target;
  } else {
    return initial + sign(target - initial) * delta;
  }
}

function angleToward(initial, target, delta) {
  if (abs(angle_difference(target, initial)) <= delta) {
    return target;
  } else {
    return initial + sign(angle_difference(target, initial)) * delta;
  }
}

// Takes angles from 0 (right) to 7 (up-right), in clockwise order.
function angleDifference(dest, src) {
  return angle_difference(dest * 45, src * 45) / 45;
}

function modulo(a, b) {
  return (a % b + b) % b;
}

function wind(tick) {
  // Function for a good wind effect stolen from my Muffins project :)
  var period = 8 * GAMESPEED;
  var normalizedTick = power((tick % period) / period, 2.5);
  return sin(normalizedTick * 2 * pi - pi / 2) * 0.5 + 0.5;
}

function arrayOf(obj) {
  var instances = [];
  instances[instance_number(par_PhysicalObject) - 1] = 0;
  var i = 0;
  with (par_PhysicalObject) {
    instances[i++] = self;
  }
  return instances;
}

// This is just object_is_ancestor but without the monumentally stupid
// corner case that an object is not its own ancestor.
function isSelfOrAncestor(child, parent) {
  return (child == parent) || (object_is_ancestor(child, parent));
}
