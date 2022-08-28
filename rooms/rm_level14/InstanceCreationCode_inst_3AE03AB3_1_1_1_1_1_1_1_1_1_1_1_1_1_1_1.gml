
init = function() {
  enqueueDia(new Dia(DialogueFace.GRANDPA, "Oh no! Heh heh heh.", OhNo));
  enqueueDia(new Dia(DialogueFace.MARTY, "What? What is it, Grandpa?", WhatIsItGrandpa));
  enqueueDia(new Dia(DialogueFace.GRANDPA, "It's some of those special cabbages...", ItsSomeOfThoseSpecialCabbages));
  enqueueDia(new Dia(DialogueFace.MARTY, "Special... cabbages?", SpecialCabbages));
  enqueueDia(new Dia(DialogueFace.GRANDPA, "Oh, yes, I don't know what fungus is growing in them, but they're special all right.", IDontKnowWhatFungus));
  enqueueDia(new Dia(DialogueFace.GRANDPA, "Well, you'll find out when you eat it. Mangia!", WellYoullFindOut));
}