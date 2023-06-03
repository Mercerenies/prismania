
var coin_dialogue = 0;
switch (ctrl_UnlockedAbilities.getCoinCount()) {
case 1:
  coin_dialogue = new Dia(DialogueMugshot.PROFESSOR, "You got one out of seven bonus coins. Not bad.");
  break;
case 2:
  coin_dialogue = new Dia(DialogueMugshot.PROFESSOR, "You got two out of seven bonus coins. Not bad.");
  break;
case 3:
  coin_dialogue = new Dia(DialogueMugshot.PROFESSOR, "You found three out of seven bonus coins. You did pretty good.");
  break;
case 4:
  coin_dialogue = new Dia(DialogueMugshot.PROFESSOR, "You found four out of seven bonus coins. That's over half of them!");
  break;
case 5:
  coin_dialogue = new Dia(DialogueMugshot.PROFESSOR, "You found five out of seven bonus coins. Impressive!");
  break;
case 6:
  coin_dialogue = new Dia(DialogueMugshot.PROFESSOR, "You found six out of seven bonus coins. Very nice!");
  break;
case 7:
  coin_dialogue = new Dia(DialogueMugshot.PROFESSOR, "You found all seven bonus coins. Even the one in that bizarre invisible maze room. That's very impressive!");
  break;
default:
  coin_dialogue = new Dia(DialogueMugshot.PROFESSOR, "You didn't find any of the seven bonus coins. Better luck next time.");
  break;
}

summonDia([
  new Dia(DialogueMugshot.PROFESSOR, "I'm happy to announce that the conflict between Prismania and the Mirrorlands may be coming to an end."),
  new Dia(DialogueMugshot.PROFESSOR, "It's been determined that the culprit behind the sudden conflict was none other than the evil Icosaking, who has now been apprehended.", function() { obj_FinaleSlides.image_index = 4 }),
  new Dia(DialogueMugshot.PROFESSOR, "Peace talks are underway with top Mirrorlands generals. We have high hopes that we'll be able to negotiate a peaceful resolution to this conflict."),
  new Dia(DialogueMugshot.PROFESSOR, "And all of this was only possible thanks to the bravery of Prisman!"),
  new Dia(DialogueMugshot.PROFESSOR, "Thank you, Prisman, for playing!", function() { obj_FinaleSlides.image_index = 5 }),
  coin_dialogue,
  new Dia(DialogueMugshot.PROFESSOR, "", function() { /* TODO Goto main menu room */ }),
]);