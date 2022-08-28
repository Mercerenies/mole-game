
init = function() {
  enqueueDia(new Dia(DialogueFace.MARTY, "... ... Who's there?!", WhosThere));
  enqueueDia(new Dia(DialogueFace.GRANDPA, "It's me, your fairy godmother.", ItsMeYourFairyGodmother));
  enqueueDia(new Dia(DialogueFace.MARTY, "Oh, it's just you, Grandpa. Very funny. What are you doing here?", OhItsJustYouGrandpa));
  enqueueDia(new Dia(DialogueFace.GRANDPA, "I heard about your wife. I'm here to help.", IHeardAboutYourWife));
  enqueueDia(new Dia(DialogueFace.MARTY, "I appreciate that, Grandpa. But this isn't really an old man's game.", IAppreciateThatGrandpaBut));
  enqueueDia(new Dia(DialogueFace.GRANDPA, "Old man?! I was solving cabbage puzzles back when you were in diapers!", OldManIWas));
}