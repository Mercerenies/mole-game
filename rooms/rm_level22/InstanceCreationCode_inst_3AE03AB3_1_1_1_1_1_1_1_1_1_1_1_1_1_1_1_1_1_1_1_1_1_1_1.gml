
init = function() {
  enqueueDia(new Dia(DialogueFace.GRANDPA, "Ah, a bomb. That takes me back...", AhABomb));
  enqueueDia(new Dia(DialogueFace.GRANDPA, "Drop this thing off an edge, and watch all your problems go up in smoke.", DropThisThingOff));
  enqueueDia(new Dia(DialogueFace.GRANDPA, "Just make sure you're not too close to the explosion when it happens.", JustMakeSureYoureNotTooClose));
  enqueueDia(new Dia(DialogueFace.MARTY, "Or I'll have to use BACKSPACE or ESCAPE to try again. Yes, Grandpa.", OrIllHaveToUseBackspace));
  enqueueDia(new Dia(DialogueFace.GRANDPA, "And it'll hurt. Probably a lot. So just don't do it.", AndItllHurt));
}