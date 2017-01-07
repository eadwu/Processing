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
 *
 * The time delay is too long for my liking.
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
 * Parses the parameter operator to get the operation and then applies it to base
 * @param  int    base          Base number before the operation
 * @param  String operator      Either multiplication or division then followed by number (e.g. m5 = * 5, d10 = / 10)
 * @return        Returns a number with datatype int
 */
int parseOperation(int base, String operator) {
  int result = 0;
  Matcher mmatch = Pattern.compile("m").matcher(operator); // Searches for matches via regex, couldn't match * or / for some reason so used m and d
  Matcher dmatch = Pattern.compile("d").matcher(operator);
  Matcher nmatch = Pattern.compile("[0-9]+").matcher(operator); // This regex searches for numbers in a group ex. in 123fsdf345 it would give {123, 345}

  if (nmatch.find()) {
    if (mmatch.find()) {
      result = base * Integer.parseInt(nmatch.group(0)); // .group(0) get the first match
    } else if (dmatch.find()) {
      result = base / Integer.parseInt(nmatch.group(0));
    }
  }
  return result;
}
/**
 * A function for the loops. Wasn't as versatile as I wanted it to be.
 * @param int     base      The base number of pixel displacement
 * @param boolean condition This was for the west puzzle and the part I didn't like for this function
 * @param String  rp        Operation to perform on the red value of the pixel's rgb value
 * @param String  gp        Operation to perform on the green value of the pixel's rgb value
 * @param String  bp        Operation to perform on the blue value of the pixel's rgb value
 * @param int     srow      The starting row of the image
 * @param int     erow      The final row of the image
 * @param int     irow      The increment of the row
 * @param int     spix      The starting pixel of the row
 * @param int     epix      The ending pixel of the row
 * @param int     ipix      The increment of the pixel
 */
void loop(int base, boolean condition, String rp, String gp, String bp, int srow, int erow, int irow, int spix, int epix, int ipix) {
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
          parseOperation(int(red(pixels[num])), rp), // int() turns the designated value to an integer datatype if applicable
          parseOperation(int(green(pixels[num])), gp),
          parseOperation(int(blue(pixels[num])), bp)
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

  loop(0, false, "m1", "d2", "m1", 0, i.height, 1, 1, i.width, 2);
  loop(i.width + padding, false, "m0", "m0", "m0", 0, im.height, 1, im.width / 2, im.width / 2 + 1, 1);
  loop(i.width + im.width + padding * 2, false, "m10", "m0", "m0", 0, ima.height, 1, 0, ima.width, 1);
  loop(width * (im.height + padding), true, "m0", "m0", "m0", 0, imag.height, 1, 0, imag.width, 1);
  loop((width * (ima.height + padding)) + i.width + padding * 2 + im.width, false, "m0", "m20", "m20", 0, image.height, 1, 0, image.width, 1);

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
