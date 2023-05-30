
event_inherited();

// Spawn death hitboxes

for (var i = -1; i <= 1; i++) {
  var xoffset = 10 * i;
  var yoffset = -16;
  var xx = x + xoffset * dcos(image_angle) + yoffset * dsin(image_angle);
  var yy = y - xoffset * dsin(image_angle) + yoffset * dcos(image_angle);
  with (instance_create_layer(xx, yy, "Instances", obj_SpikeHitbox)) {
    worlds = other.getWorlds();
  }
}