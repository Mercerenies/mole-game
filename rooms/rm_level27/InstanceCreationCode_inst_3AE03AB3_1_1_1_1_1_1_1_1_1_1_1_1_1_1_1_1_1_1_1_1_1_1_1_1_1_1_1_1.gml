
init = function() {
  enqueueDia(new Dia(DialogueFace.GRANDPA, "I can see Farmer Blue's house up ahead. This should be the last area.", ICanSeeFarmerBluesHouse));
  enqueueDia(new Dia(DialogueFace.GRANDPA, "Are you ready for your delicious encounter with the Farmer?", AreYouReadyForYourDeliciousEncounter));
  enqueueDia(new Dia(DialogueFace.MARTY, "My what?!", MyWhat));
  enqueueDia(new Dia(DialogueFace.GRANDPA, "Erm, 'malicious' encounter! Are you ready for your malicious encounter with the Farmer?", MaliciousEncounter));
}