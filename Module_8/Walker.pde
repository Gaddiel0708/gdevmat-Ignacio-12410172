class Walker {
  PVector position;
  PVector velocity;
  PVector acceleration;
  float mass;
  color c;
  float G = 1; // Gravitational constant

  Walker() {
    mass = random(5, 20);
    position = new PVector(random(width), random(height));
    velocity = new PVector(0, 0);
    acceleration = new PVector(0, 0);
    c = color(random(255), random(255), random(255), 150);
  }

  // Logic for Gravitational Attraction: (G * m1 * m2) / distance^2
  PVector calculateAttraction(Walker other) {
    // 1. Calculate direction (Target - Current)
    PVector force = PVector.sub(this.position, other.position);
    float distance = force.mag();
    
    // Constraint: Prevent "extreme" forces when walkers are too close or far
    distance = constrain(distance, 5.0, 25.0);
    
    force.normalize();
    
    // 2. Calculate Strength
    float strength = (G * this.mass * other.mass) / (distance * distance);
    force.mult(strength);
    
    return force;
  }

  void applyForce(PVector force) {
    PVector f = PVector.div(force, mass);
    acceleration.add(f);
  }

  void update() {
    velocity.add(acceleration);
    position.add(velocity);
    acceleration.mult(0);
  }

  void display() {
    noStroke();
    fill(c);
    // Scale according to mass
    float diameter = mass * 2;
    ellipse(position.x, position.y, diameter, diameter);
  }
}
