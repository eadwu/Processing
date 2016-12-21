// https://material.io/guidelines/layout/responsive-ui.html#responsive-ui-grid
void setup() {
  size(displayWidth, displayHeight); // displayWidth and displayHeight are deprecated, however I don't like fullscreen so I'll just use this
  surface.setResizable(true);
}

void draw() {
  background(51);
  default_ui();
}

void default_ui() {
  float ui_game = width / 12 * 4;
  float ui_block = width / 12 * 2;
  float ui_playground = width / 12 * 6;

  print(ui_game + ui_block + ui_playground, width);

  fill(#FFFFFF);
  rect(0, 0, width, height);
  fill(#000000);
  rect(0, 0, ui_game, ui_game);
  fill(#452346);
  rect(0, ui_game, ui_game, height - ui_game);
  fill(#04f246);
  rect(ui_game, 0, ui_block, height);
  fill(#0406f2);
  rect(ui_game + ui_block, 0, ui_playground, height);
}
