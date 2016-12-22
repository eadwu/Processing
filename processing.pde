// https://material.io/guidelines/layout/responsive-ui.html#responsive-ui-grid
PImage background;

void setup() {
  background = loadImage("./assets/ic_all_out_black_24dp/ic_all_out_black_24dp_2x.png");

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
  image(background, width / 2 - background.width / 2, height / 2 - background.height / 2);
}
