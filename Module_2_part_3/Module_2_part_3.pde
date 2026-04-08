float xTime = 0;
float yTime = 1000;

void setup() {
  size(1280, 720);
  background(255);
}

void draw() {
  // Calculate position using Perlin Noise for smooth movement
  float x = noise(xTime) * width;
  float y = noise(yTime) * height;

  // Generate randomized colors and alpha
  float r = random(255);
  float g = random(255);
  float b = random(255);
  float a = random(50, 150);

  // Styling the brush
  noStroke();
  fill(r, g, b, a);
  
  // Larger circle size for the "bigger" look
  circle(x, y, 100);

  // Increment time variables to move the brush
  xTime += 0.007;
  yTime += 0.007;
}
