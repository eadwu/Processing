// https://material.io/guidelines/layout/responsive-ui.html#responsive-ui-grid
import java.util.Map;

PImage background;
HashMap<String, Integer> dictionary = new HashMap<String, Integer>(); // .put and .get

void setup() {
  background = loadImage("./assets/ic_all_out_black_24dp/ic_all_out_black_24dp_2x.png");

  size(displayWidth, displayHeight, P3D); // displayWidth and displayHeight are deprecated, however I don't like fullscreen so I'll just use this
  surface.setResizable(true);
}

void draw() {
  // background(51);
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
