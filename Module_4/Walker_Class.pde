class Walker {
  PVector position;
  PVector velocity;
  PVector acceleration;
  float r; // For random scale

  Walker() {
    // 1. Random position and scale
    position = new PVector(random(width), random(height));
    velocity = new PVector(0, 0);
    acceleration = new PVector(0, 0);
    r = random(8, 24);
  }

  void update() {
    // 2. Accelerate towards the mouse cursor
    PVector mouse = new PVector(mouseX, mouseY);
    
    //Get the direction (Target - Current)
    PVector dir = PVector.sub(mouse, position);
    
    //Normalize the direction (magnitude becomes 1)
    dir.normalize();
    
    //Multiply by 0.2 and assign to acceleration
    dir.mult(0.2);
    acceleration = dir;

 
    // Velocity changes by acceleration, Position changes by velocity
    velocity.add(acceleration);
    velocity.limit(5); // Keep it from getting too fast
    position.add(velocity);
  }

  void display() {
    stroke(0);
    fill(175, 100);
    ellipse(position.x, position.y, r, r);
  }
}
