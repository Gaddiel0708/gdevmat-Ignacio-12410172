Walker[] walkers = new Walker[100]; // 1. Create 100 Walker instances

void setup() {
  size(800, 600);
  
  // 1. Initialize 100 walkers
  for (int i = 0; i < walkers.length; i++) {
    walkers[i] = new Walker();
  }
}

void draw() {
  background(255);
  
  for (int i = 0; i < walkers.length; i++) {
    walkers[i].update();
    walkers[i].display();
  }
}
