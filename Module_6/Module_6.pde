Walker[] walkers = new Walker[8];

void setup() {
  size(1280, 720);
  initializeWalkers();
}

void draw() {
  background(255);
  
  // Midpoint line visualization
  stroke(220);
  line(width/2, 0, width/2, height);

  PVector accelerationForce = new PVector(0.2, 0);

  // Using Enhanced For-Loop
  for (Walker w : walkers) {
    
    // 1. Friction Logic
    float mew = 0.01f; 
    if (w.position.x > width / 2) {
      mew = 0.4f; // Braking zone
    }
    
    // Use .copy() instead of .get() to fix the deprecation error
    PVector friction = w.velocity.copy(); 
    friction.normalize();                
    friction.mult(-1);                   
    friction.mult(mew);                  
    
    // 2. Apply forces
    w.applyForce(friction);
    w.applyForce(accelerationForce);
    
    w.update();
    w.display();
  }
}

// 3. Reset when mouse is clicked
void mousePressed() {
  initializeWalkers();
}

void initializeWalkers() {
  for (int n = 0; n < walkers.length; n++) {
    // Equation to space walkers evenly from top to bottom
    float posY = (height / walkers.length) * (n + 0.5f);
    
    // n + 1 ensures mass ranges from 1 to 8
    walkers[n] = new Walker(n + 1, posY);
  }
}
