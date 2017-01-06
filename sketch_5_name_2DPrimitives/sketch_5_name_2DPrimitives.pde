void draw() {
  clear();
  float midWidth = width / 2;
  float midHeight = height / 2;
  float triSize = 60;

  fill(255);
  triangle(
    midWidth, 
    midHeight - triSize,
    midWidth - triSize,
    midHeight + triSize,
    midWidth + triSize,
    midHeight + triSize
   );
   rect(
     midWidth - triSize,
     midHeight + triSize,
     triSize * 2,
     triSize * 2
   );
   ellipse(
     midWidth - triSize / 2,
     midHeight + triSize * 2 + 10,
     triSize / 2,
     triSize / 2
   );
   stroke(0);
  //rect();
  stroke(255);
  line(20, 20, 50, 50);
  arc(50, 100, 50, 50, PI, PI * 2);
  stroke(125);
  point(100, 300);
}

void setup() {
  background(0);
  size(500, 500);
  // size(displayWidth, displayHeight);
  
  // surface.setResizable(true);
}