/*******************************************
 *                                         *
 * Warhol Grid Generator starter code      *
 *                                         *
 * UTeach CSP                              *
 * Bradley Beth                            *
 * rev. 20160831                           *
 *                                         *
 *******************************************/

PImage imgOrig, imgVar1, imgVar2, imgVar3;
int x = 1,
y = 25;

void setup()
{
  textSize(16);                   //set font size
  fill(0,0,0);            //set font color

  //Load image(s)
  imgOrig = loadImage("electron.png");
  imgVar1 = imgOrig.get();
  imgVar2 = imgOrig.get();
  imgVar3 = imgOrig.get();

  //Set window size
  size(1, 1);
  surface.setResizable(true);
  surface.setSize(imgOrig.width * 2, imgOrig.height * 2);
  
  /*************************
  Place STATIC filters here
  * ex: imgVar1.filter(...);
  *************************/
  imgVar1.filter(GRAY);
  imgVar2.filter(INVERT);
  imgVar3.filter(OPAQUE);
  /************************/
  for (int img1 = 0; img1 < 50; img1++) {
    imgVar1.filter(BLUR, 1);
    imgVar1.filter(DILATE);
  }
  for (int img2 = 0; img2 < 25; img2++) {
    imgVar2.filter(ERODE);
  }
  for (int img3 = 0; img3 < 75; img3++) {
    imgVar3.filter(DILATE);
  }
}

void draw()
{
  //Draw original image
  image(imgOrig, 0, 0);

  text("original", imgOrig.width / 4, imgOrig.height - 10);

  //Draw image variant 1

  image(imgVar1, imgVar1.width, 0);

  text("variant 1", 5 * imgVar1.width / 4, imgVar1.height - 10);

  //Draw image variant 2
  image(imgVar2, 0, imgVar2.height);

  text("variant 2", imgVar2.width / 4, (2 * imgVar2.height) - 10);

  //Draw image variant 3
  image(imgVar3, imgVar3.width, imgVar3.height);
  text("variant 3", 5 * imgVar3.width / 4, (2 * imgVar3.height) - 10);

  save("2x2.png");
}
