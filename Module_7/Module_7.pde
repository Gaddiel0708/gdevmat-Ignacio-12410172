Walker[] walkers = new Walker[10];
Liquid liquid;

void setup() {
  size(1280, 720);
  
  // 1. Initialize 10 walkers spaced out side-by-side
  for (int i = 0; i < walkers.length; i++) {
    float x = (width / walkers.length) * (i + 0.5f);
    walkers[i] = new Walker(random(1, 5), x);
  }
  
  // 2. Create the liquid (rectangle at the bottom half of screen)
  liquid = new Liquid(0, height/2, width, height/2, 0.1f);
}

void draw() {
  background(255);
  
  // Draw the liquid area
  liquid.display();

  for (Walker w : walkers) {
    // 3. Apply Forces
    
    // Wind (0.1, 0)
    PVector wind = new PVector(0.1, 0);
    w.applyForce(wind);
    
    // Gravity (scaled to mass) (0, 0.15 * mass) 
    // 
    PVector gravity = new PVector(0, 0.15f * w.mass);
    w.applyForce(gravity);
    
    // Drag Force (only when hitting the liquid)
    if (liquid.contains(w)) {
      PVector dragForce = liquid.calculateDrag(w);
      w.applyForce(dragForce);
    }
    
    w.update();
    w.display();
    w.checkEdges();
  }
}
