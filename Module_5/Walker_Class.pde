class Walker {
  PVector position;
  PVector velocity;
  PVector acceleration;
  float mass;
  color c;

  Walker(float m) {
    mass = m;
    // All walkers must start at (-500, 200) position
    // Note: Since -500 is off-screen, they will fly into view from the left
    position = new PVector(-500, 200);
    velocity = new PVector(0, 0);
    acceleration = new PVector(0, 0);
    
    // Random color
    c = color(random(255), random(255), random(255), 150);
  }

  // Newton's Second Law: F = M * A or A = F / M
  void applyForce(PVector force) {
    PVector f = PVector.div(force, mass);
    acceleration.add(f);
  }

  void update() {
    velocity.add(acceleration);
    position.add(velocity);
    // Reset acceleration every frame so forces don't infinitely stack
    acceleration.mult(0);
  }

  void display() {
    stroke(0);
    fill(c);
    // Scale depending on mass (mass * 15)
    float diameter = mass * 15;
    ellipse(position.x, position.y, diameter, diameter);
  }

  // 4. Bouncing from edges
  void checkEdges() {
    float radius = (mass * 15) / 2;
    
    if (position.x > width - radius) {
      position.x = width - radius;
      velocity.x *= -1;
    } else if (position.x < radius) {
      position.x = radius;
      velocity.x *= -1;
    }

    if (position.y > height - radius) {
      position.y = height - radius;
      velocity.y *= -1;
    }
  }
}
