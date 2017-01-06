/*
 Copy and paste ALL of this code into a processing sketch window
 If it looks kind of weird in processing and you want to clean up your code to make it readable do the following:
 Click on Edit→ Auto Format
 Easy to read and follow code is easy to fix and understand

 This is a good header block to use in all of your future code to ensure your documentation is
 up to par.  Remember Documentation == $$$$$
 Name:

 Class Period:

 Date Submitted:

 Purpose of program and instructions:

 This is the code template for understanding how color changes are implemented
 in processing
 */

 /*
 NAME_HERE
 Period 5
 1/5/17

 Modified code template for understanding how to implement color changes in processing
 */


// Don't feel forced to use a setup and draw approach, there are many ways to do this
void setup()
{
  size(540, 960);  //hmm what kind of shape does this resemble?
  text("Red Channel", 1080/4, 100);
  text("Green Channel", 1080/4, 300);
  text("Blue Channel", 1080/4, 500);
  text("My Custom Channel", 1080/4, 700);
  frameRate(15);
}

float stepSize = 255/255; //What effect does this have on your program, if you use it?
float currentColor = 0;

void draw()
{
  // Good practice to print out a variable to help keep track of what is going on.
  println("color is ", currentColor % 256);

  //Red
  fill(currentColor % 256, 0, 0);
  ellipse(1080/4, 200, 100, 100);

  //Green
  fill(0, currentColor % 256, 0);
  ellipse(1080/4, 400, 100, 100);

  //Blue
  fill(0, 0, currentColor % 256);
  ellipse(1080/4, 600, 100, 100);

  //Custom
  float r = random(0, 255);
  float g = random(0, 255);
  float b = random(0, 255);

  fill(r, g, b);
  ellipse(1080/4, 800, 100, 100);

  currentColor += stepSize;  // Why do you think this is here?
  // This might be a good spot for a pause
}
