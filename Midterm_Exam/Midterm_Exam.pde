BlackHole bh;
ArrayList<Matter> matterList;

void setup() {
  size(1080, 720);
  initializeSimulation();
}

void draw() {
  background(0); 

  bh.display();

  // Iterate backwards when removing items from an ArrayList
  for (int i = matterList.size() - 1; i >= 0; i--) {
    Matter m = matterList.get(i);
    m.attractTo(bh);
    m.update();
    m.display();

    // Check if the particle is "sucked in" (close to the center)
    float distance = PVector.dist(m.position, bh.position);
    if (distance < bh.size / 2) {
      matterList.remove(i);
    }
  }

  // If all particles are gone, move the black hole and respawn
  if (matterList.size() == 0) {
    bh.moveRandomly();
    spawnMatter();
  }
}

void initializeSimulation() {
  bh = new BlackHole();
  spawnMatter();
}

void spawnMatter() {
  matterList = new ArrayList<Matter>();
  for (int i = 0; i < 150; i++) {
    matterList.add(new Matter());
  }
}
