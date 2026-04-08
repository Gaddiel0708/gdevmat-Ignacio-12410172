class BlackHole {
  PVector position;
  float size = 50;

  BlackHole() {
    moveRandomly();
  }

  void moveRandomly() {
    position = new PVector(random(width), random(height));
  }

  void display() {
    noStroke();
    fill(255); 
    ellipse(position.x, position.y, size, size);
  }
}

// --- MATTER CLASS ---
class Matter {
  PVector position;
  PVector velocity;
  float size;
  color c;

  Matter() {
    // Gaussian spawn cluster
    float x = (float) new java.util.Random().nextGaussian() * (width/4) + (width/2);
    float y = (float) new java.util.Random().nextGaussian() * (height/4) + (height/2);
    position = new PVector(x, y);
    velocity = new PVector(0, 0);
    size = random(5, 15);
    c = color(random(100, 255), random(100, 255), random(100, 255));
  }

  void attractTo(BlackHole blackHole) {
    PVector direction = PVector.sub(blackHole.position, this.position);
    direction.normalize();
    direction.mult(0.4); // Increased strength for a better "sucking" feel
    velocity.add(direction);
    velocity.limit(8); 
  }

  void update() {
    position.add(velocity);
  }

  void display() {
    noStroke();
    fill(c);
    ellipse(position.x, position.y, size, size);
  }
}
