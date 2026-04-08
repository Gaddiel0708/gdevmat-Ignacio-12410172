void setup() {
  size(1280, 720);
  background(255);
}

void draw() {
  // 1. Compute Gaussian x-coordinate
  // randomGaussian() has a mean of 0 and SD of 1
  float standardDeviationX = 120;
  float meanX = width / 2;
  float x = (randomGaussian() * standardDeviationX) + meanX;

  // 2. Compute Random y-coordinate
  // Max value (top) is 0, Min value (bottom) is height
  float y = random(0, height);

  // 3. Compute Gaussian Thickness (Size)
  float sdSize = 10;
  float meanSize = 20;
  float size = (randomGaussian() * sdSize) + meanSize;

  // 4. Generate Random Colors
  float r = random(255);
  float g = random(255);
  float b = random(255);
  float a = random(10, 100);

  // Render the "splatter"
  noStroke();
  fill(r, g, b, a);
  circle(x, y, size);

  // BONUS
  if (frameCount % 300 == 0) {
    background(255);
  }
}
