
init = function() {
  enqueueDia(new Dia(DialogueFace.GRANDPA, "Careful, son! Watch out for that beehive!", CarefulSonWatch));
  enqueueDia(new Dia(DialogueFace.GRANDPA, "If the beehive falls, the bees will attack you.", IfTheBeehiveFalls));
  enqueueDia(new Dia(DialogueFace.GRANDPA, "If that happens, you'll have to use BACKSPACE or ESCAPE to try again.", IfThatHappensYoullHaveTo));
}