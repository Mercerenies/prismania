
event_inherited();

collisions_list = ds_list_create();

onStrike = function(strike) {
  strike.applyImpulse(self);
  return true;
}

intoCarriedBlock = function() {
  // Abstract function
}
