class Walker {
  //Using PVector instead of float x, y
  PVector position;
  PVector velocity;

  Walker() {
    position = new PVector(width/2, height/2);
    // Setting a constant speed for the bouncing effect
    velocity = new PVector(2.5, 2); 
  }

  //Function using the new PVector variables
  void display() {
    stroke(0);
    strokeWeight(2);
    fill(127, 100);
    ellipse(position.x, position.y, 48, 48);
  }

  //Simulate the bouncing ball logic
  void moveAndBounce() {
    // Standard vector addition: position = position + velocity
    position.add(velocity);

    // Bouncing Logic (Horizontal)
    if (position.x > width || position.x < 0) {
      velocity.x = velocity.x * -1;
    }
    
    // Bouncing Logic (Vertical)
    if (position.y > height || position.y < 0) {
      velocity.y = velocity.y * -1;
    }
  }
}
