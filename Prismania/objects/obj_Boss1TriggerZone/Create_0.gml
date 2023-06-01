
event_inherited();

summonBoss = function() {
  if (!ctrl_UnlockedAbilities.boss1_met) {
    summonDia([
      new Dia(DialogueMugshot.GENERAL, "Stop right there!"),
      new Dia(DialogueMugshot.GENERAL, "I can't let you go any furthe- Wait, you're Prisman? THE Prisman! You're the one who caused the pepperoni incident last year!"),
      new Dia(DialogueMugshot.GENERAL, "I had never seen so many cornfields burning before that day... How did you even end up with that many wrenches anyway?"),
      new Dia(DialogueMugshot.GENERAL, "Regardless, our new King has big plans, and I can't let you stop him! En garde, Prisman!"),
    ]);
    ctrl_UnlockedAbilities.boss1_met = true;
  }
  instance_create_layer(0, 0, "Instances", ctrl_Boss1Controller);
}