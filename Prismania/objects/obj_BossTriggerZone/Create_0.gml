
event_inherited();

onDraw = function() {
  // Invisible object
}

initiateBossFight = function() {
  setBossWalls(true);
  summonBoss();
  instance_destroy();
}

summonBoss = function() {
  // Abstract function
}