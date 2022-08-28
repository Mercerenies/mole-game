
init = function() {
  enqueueDia(new Dia(DialogueFace.MARTY, "Are you doing alright, Grandpa?", AreYouDoingAlrightGrandpa));
  enqueueDia(new Dia(DialogueFace.GRANDPA, "That better not be another crack at my age, boy!", ThatBetterNotBeAnotherCrack));
  enqueueDia(new Dia(DialogueFace.MARTY, "No, it's just... I've been eating all of this cabbage, and you haven't had anything to eat.", NoItsJustIveBeenEating));
  enqueueDia(new Dia(DialogueFace.GRANDPA, "Oh, no, I brought my own cabbages. Don't worry about me.", OhNoIBroughtMyOwn));
  enqueueDia(new Dia(DialogueFace.MARTY, "Grandpa!", Grandpa));
  enqueueDia(new Dia(DialogueFace.GRANDPA, "What?!", What));
  enqueueDia(new Dia(DialogueFace.MARTY, "I'm working my tail off here! You didn't think to share?", ImWorkingMyTailOff));
  enqueueDia(new Dia(DialogueFace.GRANDPA, "You didn't ask! Besides, you look like you're having fun!", YouDidntAsk));
}