
event_inherited();

summonBoss = function() {
  if (!ctrl_UnlockedAbilities.boss2_met) {
    summonDia([
      new Dia(DialogueMugshot.GENERAL, "Prisman! I knew you'd make it here! But I'm afraid your journey ends right now!"),
      new Dia(DialogueMugshot.GENERAL, "I made a mistake last time in fighting you directly. This time, I've come prepared. Meet the Triangulator!"),
      new Dia(DialogueMugshot.GENERAL, "Mwahahahahaha! You'll never be able to defeat me in this bad boy! The only weak point is the glowing spot on top, but there's no way you'll make it above my death machine!"),
    ]);
    ctrl_UnlockedAbilities.boss2_met = true;
  }
  instance_create_layer(room_width / 2, -96, "Instances", obj_Boss2);
}