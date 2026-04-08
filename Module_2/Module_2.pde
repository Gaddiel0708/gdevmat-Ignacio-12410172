Walker w1;
Walker w2;

void setup() {
  size(1280, 720);
  background(255);
  w1 = new Walker();
  w2 = new Walker();
}

void draw() {
  w1.randomWalk();
  w1.render();
  
  w2.randomWalkBiased();
  w2.render();
}

class Walker {
  float x, y;

  Walker() {
    x = width / 2;
    y = height / 2;
  }

  void render() {
    // Random color and alpha 
    float r = random(255);
    float g = random(255);
    float b = random(255);
    float a = random(50, 100);
    
    fill(r, g, b, a);
    noStroke();
    circle(x, y, 16);
  }

  // 1. 8-directional movement
  void randomWalk() {
    int xStep = int(random(3)) - 1; // Results in -1, 0, or 1
    int yStep = int(random(3)) - 1; // Results in -1, 0, or 1
    
    x += xStep * 5;
    y += yStep * 5;
  }

  // 2. Biased movement (40% right, 20% left, 20% up, 20% down)
  void randomWalkBiased() {
    float r = random(1);

    if (r < 0.4) {
      x += 5;        // 40% Right
    } else if (r < 0.6) {
      x -= 5;        // 20% Left
    } else if (r < 0.8) {
      y -= 5;        // 20% Up
    } else {
      y += 5;        // 20% Down
    }
  }
}
