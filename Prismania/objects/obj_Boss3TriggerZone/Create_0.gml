
event_inherited();

summonBoss = function() {
  if (!ctrl_UnlockedAbilities.boss3_met) {
    summonDia([
      new Dia(DialogueMugshot.KING, "We meet at last, Prisman! I knew you'd make it here eventually."),
      new Dia(DialogueMugshot.KING, "It's good to make your acquaintance. You may recognize me: I'm the Icosaking!"),
      new Dia(DialogueMugshot.KING, "... No? Well, it has been several Jams since I showed up. But I'm back now!"),
      new Dia(DialogueMugshot.KING, "I've taken over the Mirrorlands. When I defeat you, Prismania will be mine! Then, the world!"),
      new Dia(DialogueMugshot.KING, "Say hello to my Icosawing! You don't stand a chance. General Triangle only had one weak point, but my wing has eight! You'll never hit them all!"),
      new Dia(DialogueMugshot.KING, "And no amount of pepperonis in the world will save you this time!"),
    ]);
    ctrl_UnlockedAbilities.boss3_met = true;
  }
  instance_create_layer(room_width / 2, -108, "Instances", obj_Boss3);
}