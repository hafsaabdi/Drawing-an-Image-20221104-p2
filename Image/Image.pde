//BackGround Image Example
//
//Global Variables
int appWidth, appHeight;
float imageBackgroundX, imageBackgroundY, imageBackgroundWidth, imageBackgroundHeight;
PImage pic;
Boolean nightMode=true ;
size(600,600); //Landscape
//Copy Display Oreintation
appWidth = width;
appHeight = height;
//
//Population
pic = loadImage("../Images used/marcus.jpg");
imageBackgroundX = appWidth*0;
imageBackgroundY = appHeight*0;
imageBackgroundWidth = appWidth-1;
imageBackgroundHeight = appHeight-1;
//
//Rectangle Layout and Image drawing to CANVAS
rect(imageBackgroundX, imageBackgroundY, imageBackgroundWidth, imageBackgroundHeight);
//
//if () else {} for a Binary Choice, no single IF
if (nightMode ==false)tint(200.0); //Gray Scale: use 1/2 tint value for white (i.e. 128/256=1/2)
if (nightMode ==true)tint(90, 80, 80); //RGB: Night Mode
//
image(pic,imageBackgroundX, imageBackgroundY, imageBackgroundWidth, imageBackgroundHeight );
