Walker[] walkers = new Walker[10]; // 1. Create 10 walkers

void setup() {
  size(1280, 720);
  
  for (int i = 0; i < walkers.length; i++) {
    // 1. Random colors, mass, scale, and initial position
    walkers[i] = new Walker();
  }
}

void draw() {
  background(255);

  // 2. Nested for loops for mutual attraction
  for (int i = 0; i < walkers.length; i++) {
    for (int j = 0; j < walkers.length; j++) {
      // Hints: A walker should not attract itself
      if (i != j) {
        PVector force = walkers[j].calculateAttraction(walkers[i]);
        walkers[i].applyForce(force);
      }
    }
    
    walkers[i].update();
    walkers[i].display();
  }
}
