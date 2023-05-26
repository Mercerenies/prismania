
if (!has_struck) {
  var collisions = ds_list_create();
  getCollisions(self, par_PhysicalObject, collisions);
  if (!ds_list_empty(collisions)) {
    has_struck = true;
  }
  for (var i = 0; i < ds_list_size(collisions); i++) {
    var curr = collisions[| i];
    curr.onStrike(true);
  }
  ds_list_destroy(collisions);
}