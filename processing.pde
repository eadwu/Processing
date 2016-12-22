// https://material.io/guidelines/layout/responsive-ui.html#responsive-ui-grid
void setup() {
  size(displayWidth, displayHeight); // displayWidth and displayHeight are deprecated, however I don't like fullscreen so I'll just use this
  surface.setResizable(true);
}

void draw() {
  background(51);
  default_ui();
}

void keyPressed() {
  if (key == CODED) {
    if (keyCode == UP) {
      //
    }
  } else {
    if (key == 'a') {
      //
    }
  }
}

void keyReleased() {
  if (key == CODED) {
    if (keyCode == UP) {
      //
    }
  } else {
    if (key == 'a') {
      //
    }
  }
}

void default_ui() {
  float ui_game = width / 12 * 4;
  float ui_block = width / 12 * 2;
  float ui_playground = width / 12 * 6;
  float ui_excess = width - (ui_game + ui_block + ui_playground);

  fill(#FFFFFF);
  rect(0, 0, width, height);
  fill(#000000);
  rect(0, 0, ui_game, ui_game);
  fill(#452346);
  rect(0, ui_game, ui_game, height - ui_game);
  fill(#04f246);
  rect(ui_game, 0, ui_block + ui_excess, height);
  fill(#0406f2);
  rect(ui_game + ui_block + ui_excess, 0, ui_playground, height);
}
