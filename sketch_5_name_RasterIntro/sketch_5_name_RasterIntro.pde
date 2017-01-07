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
 * Assignment link:
 * parseOperation was made with reference to http://stackoverflow.com/questions/4662215/how-to-extract-a-substring-using-regex
 */

import java.util.regex.Pattern; // Importing java class
import java.util.regex.Matcher;

int padding = 20; // Constant spacing between the images

float r, g, b;
PImage i, im, ima, imag, image;

/**
 * A function for the loops
 * @param int     base      The base number of pixel displacement
 * @param boolean condition This was for the west puzzle
 * @param String  rp        Number to multiply on the red value of the pixel's rgb value
 * @param String  gp        Number to multiply on the green value of the pixel's rgb value
 * @param String  bp        Number to multiply on the blue value of the pixel's rgb value
 * @param int     srow      The starting row of the image
 * @param int     erow      The final row of the image
 * @param int     irow      The increment of the row
 * @param int     spix      The starting pixel of the row
 * @param int     epix      The ending pixel of the row
 * @param int     ipix      The increment of the pixel
 */
void loop(int base, boolean condition, int rp, int gp, int bp, int srow, int erow, int irow, int spix, int epix, int ipix) {
  for (int row = srow; row < erow; row += irow) {
    for (int pixel = spix; pixel < epix; pixel += ipix) {
      int num = base + row * width + pixel;

      if (condition && blue(pixels[num]) < 16) {
        pixels[num] = color(
          blue(pixels[num]) * 16,
          0,
          0
        );
      } else {
        pixels[num] = color(
          red(pixels[num]) * rp,
          green(pixels[num]) * gp,
          blue(pixels[num]) * bp
        );
      }
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

  loop(0, false, 1, 1 / 2, 1, 0, i.height, 1, 1, i.width, 2);
  loop(i.width + padding, false, 0, 0, 0, 0, im.height, 1, im.width / 2, im.width / 2 + 1, 1);
  loop(i.width + im.width + padding * 2, false, 10, 0, 0, 0, ima.height, 1, 0, ima.width, 1);
  loop(width * (im.height + padding), true, 0, 0, 0, 0, imag.height, 1, 0, imag.width, 1);
  loop((width * (ima.height + padding)) + i.width + padding * 2 + im.width, false, 0, 20, 20, 0, image.height, 1, 0, image.width, 1);

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
