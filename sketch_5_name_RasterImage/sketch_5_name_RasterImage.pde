/**
 * NAME_HERE
 * 1/9/17
 * APCSP

 * Combining images
 */
PImage a, b;

void setup() {
  surface.setResizable(true);
  a = loadImage("./pics/Hut-in-the--middle-of-the-lake-300px.png");
  b = loadImage("./pics/peppers-300px.png");
  surface.setSize(a.width + b.width, a.height);
}

void draw() {
  image(a, 0, 0);
  image(b, a.width, 0);
  loadPixels();

  int index = 0;

  for (int row = 0; row < a.height; row++) {
    for (int pixel = 0; pixel < a.width; pixel++) {
      int num = row * a.width + pixel;
      int pixelOffset = index % (b.width * b.height);
      int pixelRows = (int) Math.floor(pixelOffset / b.width);
      color other = color(0, 0, 0);

      pixels[num] = color(
        (red(pixels[num]) + red(other)) % 256,
        (blue(pixels[num]) + blue(other)) % 256,
        (green(pixels[num]) + green(other)) % 256
      );
      ++index;
    }
  }

  updatePixels();
}
