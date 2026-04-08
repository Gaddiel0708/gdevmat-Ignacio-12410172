class Liquid {
  float x, y, w, h;
  float c; // Drag coefficient

  Liquid(float x_, float y_, float w_, float h_, float c_) {
    x = x_; y = y_; w = w_; h = h_; c = c_;
  }

  // Check if walker is inside the liquid rectangle
  boolean contains(Walker wlkr) {
    PVector pos = wlkr.position;
    return pos.x > x && pos.x < x + w && pos.y > y && pos.y < y + h;
  }

  // Calculate Drag Force
  PVector calculateDrag(Walker wlkr) {
    float speed = wlkr.velocity.mag();
    float dragMagnitude = c * speed * speed; // simplified drag formula

    PVector dragForce = wlkr.velocity.copy();
    dragForce.mult(-1);
    dragForce.normalize();
    dragForce.mult(dragMagnitude);
    return dragForce;
  }

  void display() {
    noStroke();
    fill(28, 120, 186, 100); // Transparent blue
    rect(x, y, w, h);
  }
}
