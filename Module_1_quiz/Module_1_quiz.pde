// Global Variables for Bonus
float amplitude = 50.0;
float frequency = 0.05;
float offset = 0; // Used to make the sine wave move

void setup() {
  size(800, 600);
}

void draw() {
  background(50);
  
  // Move origin to center of screen for easier graphing
  translate(width/2, height/2);
  
  // Draw Coordinate Axes (Optional but helpful)
  stroke(100);
  line(-width/2, 0, width/2, 0); // X-axis
  line(0, -height/2, 0, height/2); // Y-axis

  // 1. Graph Parabola (Yellow)
  stroke(255, 255, 0); 
  noFill();
  beginShape();
  for (float x = -width/2; x < width/2; x++) {
    float y = pow(x, 2) - (15 * x) - 3;
    vertex(x, -y); // Negative y because Processing y-axis is inverted
  }
  endShape();

  // 2. Graph Linear (Purple)
  stroke(128, 0, 128);
  beginShape();
  for (float x = -width/2; x < width/2; x++) {
    float y = (-5 * x) + 30;
    vertex(x, -y);
  }
  endShape();

  // 3. Sine Wave (Cyan/Custom Color)
  stroke(0, 255, 255);
  beginShape();
  for (float x = -width/2; x < width/2; x++) {
    // Adding 'offset' makes the wave move
    float y = sin((x * frequency) + offset) * amplitude;
    vertex(x, -y);
  }
  endShape();


  offset += 0.1;
}


void keyPressed() {
  if (key == 'w') amplitude += 5;  // Increase height
  if (key == 's') amplitude -= 5;  // Decrease height
  if (key == 'd') frequency += 0.01; // Squish wave
  if (key == 'a') frequency -= 0.01; // Stretch wave
}
