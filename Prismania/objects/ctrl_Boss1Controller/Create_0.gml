
boss_health = 3;

onEndOfBossFight = function() {
  summonDia([
    new Dia(DialogueMugshot.GENERAL, "Gah! It seems I've underestimated you, Prisman!"),
    new Dia(DialogueMugshot.GENERAL, "I'll be ready next time. We'll meet again!"),
  ]);
  with (obj_GeneralTriangle) {
    dying = true;
  }
  with (obj_GeneralTriangleMinion) {
    dying = true;
  }
  setBossWalls(false);
  ctrl_UnlockedAbilities.boss1_defeated = true;
}