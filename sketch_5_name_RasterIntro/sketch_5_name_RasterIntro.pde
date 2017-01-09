/*******************************************
 *                                         *
 * Raster Image Starter Code               *
 *                                         *
 * UTeach CSP                              *
 * Bradley Beth                            *
 * rev. 20161123                           *
 *                                         *
 * Extend this code to change pixels'      *
 * color values.                           *
 *******************************************/

/**
 * NAME_HERE
 * APCSP
 * 1/7/17

 * Follows the criteria for the program. Has the 3 puzzles and 2 assignments. Uses math to calculate the individual image pixels.
 */
int padding = 20; // Constant spacing between the images
PImage i, im, ima, imag, image;
/**
 * A function for most of the loops.
 * @param int   base The base pixel displacement
 * @param color cp   Color multiplier
 * @param int   srow Initial value of row
 * @param int   erow Final value of row
 * @param int   irow Increment of row
 * @param int   spix Initial value of pixel
 * @param int   epix End value of pixel
 * @param int   ipix Increment of pixel
 */
void loop(int base, color cp, int srow, int erow, int irow, int spix, int epix, int ipix) {
  for (int row = srow; row < erow; row += irow) {
    for (int pixel = spix; pixel < epix; pixel += ipix) {
      int num = base + row * width + pixel;

      pixels[num] = color(
        red(pixels[num]) * red(cp),
        green(pixels[num]) * green(cp),
        blue(pixels[num]) * blue(cp)
      );
    }
  }
}

void setup() {
  surface.setResizable(true); // This allows the window to be resizeable
  i = loadImage("./pics/peppers-300px.png");
  im = loadImage("./pics/Hut-in-the--middle-of-the-lake-300px.png");
  ima = loadImage("./pics/iron-puzzle.png");
  imag = loadImage("./pics/west-puzzle.png");
  image = loadImage("./pics/copper-puzzle.png");
  surface.setSize(padding * 3 + i.width + im.width + ima.width, im.height + image.height + padding * 5);
}

void draw() {
  image(i, 0, 0); // Setting up image positions
  image(im, i.width + padding, 0);
  image(ima, i.width + padding * 2 + im.width, 0);
  image(imag, 0, im.height + padding);
  image(image, i.width + padding * 2 + im.width, ima.height + padding);
  loadPixels();

  for (int row = 0; row < i.height; row++) {
    for (int pixel = 0; pixel < i.width; pixel++) {
      int num = row * width + pixel;

      if (num % 2 == 1) { // Condition prevents me from using loop()
        pixels[num] = color(
          red(pixels[num]),
          green(pixels[num]) / 2,
          blue(pixels[num])
        );
      }
    }
  }

  loop(i.width + padding, color(0, 0, 0), 0, im.height, 1, im.width / 2, im.width / 2 + 1, 1);
  loop(i.width + im.width + padding * 2, color(10, 0, 0), 0, ima.height, 1, 0, ima.width, 1);

  for (int row = 0; row < imag.height; row++) {
    for (int pixel = 0; pixel < imag.width; pixel++) {
      int num = (width * (im.height + padding)) + row * width + pixel;

      if (blue(pixels[num]) < 16) { // Condition prevents me from using loop()
        pixels[num] = color(
          blue(pixels[num]) * 16,
          0,
          0
        );
      } else {
        pixels[num] = color(0, 0, 0);
      }
    }
  }

  loop((width * (ima.height + padding)) + i.width + padding * 2 + im.width, color(0, 20, 20), 0, image.height, 1, 0, image.width, 1);

  updatePixels();
}
/**
 * Original loop code

 for (int row = 0; row < im.height; row++) {
   int num = row * width + i.width + padding + im.width / 2;

   pixels[num] = color(0, 0, 0);
 }

 for (int row = 0; row < ima.height; row++) {
   for (int pixel = 0; pixel < ima.width; pixel++) {
     int num = row * width + pixel + i.width + im.width + padding * 2;

     pixels[num] = color(
       red(pixels[num]) * 10,
       0,
       0
     );
   }
 }

 for (int row = 0; row < imag.height; row++) {
   for (int pixel = 0; pixel < imag.width; pixel++) {
     int num = (width * (im.height + padding)) + row * width + pixel;

     if (blue(pixels[num]) < 16) {
       pixels[num] = color(
         blue(pixels[num]) * 16,
         0,
         0
       );
     } else {
       pixels[num] = color(0, 0, 0);
     }
   }
 }

 for (int row = 0; row < image.height; row++) {
   for (int pixel = 0; pixel < image.width; pixel++) {
     int num = row * width + pixel + (width * (ima.height + padding)) + i.width + padding * 2 + im.width;

     pixels[num] = color(
       0,
       green(pixels[num]) * 20,
       blue(pixels[num]) * 20
     );
   }
 }
 */
