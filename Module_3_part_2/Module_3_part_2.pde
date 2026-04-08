void setup() {
  size(800, 400);
}

void draw() {
  background(15); 
  
  // Define positions (identical to previous setup)
  PVector handleCenter = new PVector(width/2, height/2);
  PVector bladeOffset = new PVector(250, 0); // Making it longer for impact
  PVector leftBladeEnd = PVector.sub(handleCenter, bladeOffset);
  PVector rightBladeEnd = PVector.add(handleCenter, bladeOffset);

  // Soft Outermost Glow (Very wide, very translucent)
  stroke(255, 0, 0, 15); // Alpha of 15 is extremely see-through
  strokeWeight(35);
  line(leftBladeEnd.x, leftBladeEnd.y, rightBladeEnd.x, rightBladeEnd.y);

  // Middle Glow (Medium width, more opaque)
  stroke(255, 0, 0, 60); 
  strokeWeight(20);
  line(leftBladeEnd.x, leftBladeEnd.y, rightBladeEnd.x, rightBladeEnd.y);

  // Bright Red Edge (Thin, solid red)
  stroke(255, 0, 0); // Solid, bright red
  strokeWeight(10);
  line(leftBladeEnd.x, leftBladeEnd.y, rightBladeEnd.x, rightBladeEnd.y);

  // Hot White Core (Thinnest, bright white)
  stroke(255); 
  strokeWeight(4);
  line(leftBladeEnd.x, leftBladeEnd.y, rightBladeEnd.x, rightBladeEnd.y);


  stroke(0);
  strokeWeight(12);
  line(handleCenter.x - 50, handleCenter.y, handleCenter.x + 50, handleCenter.y);
  

  stroke(100); // Gray detail lines
  strokeWeight(2);
  line(handleCenter.x - 10, handleCenter.y - 5, handleCenter.x - 10, handleCenter.y + 5);
  line(handleCenter.x + 10, handleCenter.y - 5, handleCenter.x + 10, handleCenter.y + 5);
}
