
event_inherited();

onCollect = function() {
  if (!ctrl_UnlockedAbilities.has_collected_coin) {
    ctrl_UnlockedAbilities.has_collected_coin = true;
    // TODO Put the correct number in here (also, a popup for every coin showing how many you have)
    showUpgradeBox(spr_CoinCollectibleBig, 0, "Got a Bonus Coin!", "There are ??? of these in total. See if you can find them all!");
  }
  ctrl_UnlockedAbilities.markCoin();
  instance_destroy();
}

onDraw = function(world) {
  if (world & worlds) {
    draw_sprite(spr_CoinCollectible, floor(index), x, y);
  }
}

getWorlds = function() {
  return worlds;
}

worlds = World.REGULAR | World.MIRROR;
index = 0;