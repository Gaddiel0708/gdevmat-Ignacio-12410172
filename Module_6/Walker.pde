class Walker {
  PVector position;
  PVector velocity;
  PVector acceleration;
  float mass;
  color c;

  Walker(float m, float y) {
    mass = m;
    // Initial position to the left of the screen
    position = new PVector(50, y);
    velocity = new PVector(0, 0);
    acceleration = new PVector(0, 0);
    c = color(random(255), random(255), random(255));
  }

  void applyForce(PVector force) {
    // Bonus 1: Applying mass for computation (Acceleration = Force / Mass)
    PVector f = PVector.div(force, mass);
    acceleration.add(f);
  }

  void update() {
    velocity.add(acceleration);
    position.add(velocity);
    acceleration.mult(0); // Reset acceleration
  }

  void display() {
    noStroke();
    fill(c);
    // Increasing scale based on mass
    float scale = mass * 10;
    ellipse(position.x, position.y, scale, scale);
  }
}
