/**
 * NAME_HERE
 * 1/4/17
 * APCSP

 * Start the program. Window is resizeable.
 * Press A to create a rectangle. Left click to create a circle. Right click to clear the screen.
 * Objects generated are centered by your mouse.
 * For mouse(s): Rotate the wheel up/down to adjust(up = increase; down = decrease) the size of the object, defaults to 50 pixels.
 * For trackpad(s): If natural scroll direction scroll down to increase and up to decrease.
 */
int size = 50;

void draw() {
  //
}

void setup() {
  background(0);
  size(500, 500);
  // size(displayWidth, displayHeight);

  surface.setResizable(true);
}

void mousePressed() {
  if (mouseButton == LEFT) {
    fill(255);
    ellipse(mouseX, mouseY, size, size);
  } else {
    clear();
  }
}
/**
 * Event that fires every time a key is pressed.
 */
void keyPressed() {
  if (key != CODED) {
    if (key == 'a') {
      fill(125);
      rect(mouseX, mouseY, size, size);
    }
  } else {
    // keyCode : CODED
  }
}
/**
 * Event that fires every time the mouse is rotated.
 * @param MouseEvent scroll Default object returned when event is fired
 */
void mouseWheel(MouseEvent scroll) {
  float value = scroll.getCount();

  if (value < 0) {
    ++size;
  } else {
    if (size > 0) {
      --size;
    }
  }
}
