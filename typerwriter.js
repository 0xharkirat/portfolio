new TypeIt("#type1", {
    speed: 120,
    loop: true,
    waitUntilVisible: true,
  })
    .type("Creator", { delay: 400 })
    .pause(500)
    .delete(9)
    .type("Developer", { delay: 400 })
    .pause(500)
    .delete(9)
    .type("Learner", { delay: 400 })
    .pause(500)
    .delete(9)
    .go();
  
  
  new TypeIt("#type2", {
    speed: 120,
    loop: true,
    waitUntilVisible: true,
  })
    .type("Creating new technologies", { delay: 400 })
    .pause(500)
    .delete(25)
    .type("Fixing old technologies", { delay: 400 })
    .pause(500)
    .delete(23)
    .type("Improving bad technologies", { delay: 400 })
    .pause(500)
    .delete(26)
    .go();