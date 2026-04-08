Walker[] walkers = new Walker[10];

void setup() {
  size(1080, 720);
  
  // 1. Initialize 10 walkers using a loop
  for (int i = 0; i < walkers.length; i++) {
    // Each gets a mass from 1 to 10
    walkers[i] = new Walker(random(1, 10));
  }
}

void draw() {
  background(255);

  // 2. Declare and initialize two forces
  PVector gravity = new PVector(0, 0.4); // Note: positive Y is down in Processing
  PVector wind = new PVector(0.15, 0);

  for (int i = 0; i < walkers.length; i++) {
    // 3. Apply both forces
    walkers[i].applyForce(wind);
    walkers[i].applyForce(gravity);
    
    walkers[i].update();
    
    // 4. Apply Newton's Third Law (Bouncing)
    walkers[i].checkEdges();
    
    walkers[i].display();
  }
}
