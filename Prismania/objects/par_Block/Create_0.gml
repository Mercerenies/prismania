
event_inherited();

onStrike = function(strike) {
  strike.applyImpulse(self);
  return true;
}
