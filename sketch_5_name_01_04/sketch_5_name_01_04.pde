/**
 * NAME_HERE
 * APCSP
 * 1/4/17
 *
 * Press any one of the arrow keys to generate a circle 50 pixels up/down/left/right of the origin circle.
 */

/**
 * Generates a circle centered at (width / 2 + displacementX, height / 2 + displacementY)
 * @param int displacementX Displacement in pixels from the center in a horizontal direction (left = negative; right = positive)
 * @param int displacementY Displacement in pixels from the center in a vertical direction (up = negative; down = positive)
 */
void createCircle(int displacementX, int displacementY) {
  translate(displacementX, displacementY);
  ellipse(width / 2, height / 2, 20, 20);
}

void setup() {
  size(420, 200);
}

void draw() {
  background(255);
  ellipse(width / 2, height / 2, 20, 20);

  if (keyPressed) {
    if (keyCode == RIGHT) {
      createCircle(50, 0);
    } else if (keyCode == LEFT) {
      createCircle(-50, 0);
    } else if (keyCode == UP) {
      createCircle(0, -50);
    } else if (keyCode == DOWN) {
      createCircle(0, 50);
    }
  }
}
