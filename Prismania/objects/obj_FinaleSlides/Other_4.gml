
summonDia([
  new Dia(DialogueMugshot.PROFESSOR, "Good morning, Prisman. Thank you for making it down here on such short notice."),
  new Dia(DialogueMugshot.PROFESSOR, "I'm Professor Pyramid. What I'm about to share with you is extremely sensitive and highly classified."),
  new Dia(DialogueMugshot.PROFESSOR, "As you know, our land of Prismania has long stood at the precipice of this world and the Mirrorlands.", function() { obj_IntroSlides.image_index = 1 }),
  new Dia(DialogueMugshot.PROFESSOR, "We each have our counterpart in the Mirrorlands, and we live at peace with their world, communicating by means of special highly-reflective crystals."),
  new Dia(DialogueMugshot.PROFESSOR, "Yesterday, the Mirrorlanders cut off all contact with us and fled to Mirror Tower."),
  new Dia(DialogueMugshot.PROFESSOR, "Intelligence reports indicate that a mysterious figure has risen to power in the Mirrorlands and is planning to launch an invasion on our peaceful island.", function() { obj_IntroSlides.image_index = 2 }),
  new Dia(DialogueMugshot.PROFESSOR, "Now, Prisman, I know you're not the most popular Prismanian after the pepperoni incident... the marine biologists alone are still furious about that hamster."),
  new Dia(DialogueMugshot.PROFESSOR, "But it's time to put all of that behind us. We need you to raid Mirror Tower and put a stop to their evil plans!"),
  new Dia(DialogueMugshot.PROFESSOR, "", function() { room_goto(rm_Start) }),
]);