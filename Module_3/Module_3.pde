Walker w;

void setup() {
  size(640, 360);
  w = new Walker();
}

void draw() {
  background(255);
  
  // Update the walker's position and handle wall collisions
  w.moveAndBounce();
  // Render the walker to the screen
  w.display();
}
