class Walker {
  PVector position;
  PVector velocity;
  PVector acceleration;
  float mass;
  color col;

  Walker(float m, float x) {
    mass = m;
    // Positioned slightly ABOVE the screen
    position = new PVector(x, -50);
    velocity = new PVector(0, 0);
    acceleration = new PVector(0, 0);
    col = color(random(100, 200), 50, 50); // Log-like colors
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
    fill(col);
    // Scaled out according to mass
    rect(position.x - (mass*8)/2, position.y, mass * 8, mass * 20);
  }
  
  void checkEdges() {
    if (position.y > height) {
      velocity.y *= -0.2; // Bounce slightly off bottom
      position.y = height;
    }
  }
}
