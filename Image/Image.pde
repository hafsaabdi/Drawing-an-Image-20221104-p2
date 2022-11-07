//BackGround Image Example
//
//Global Variables
int appWidth, appHeight;
float smallerDimension, largerDimension
Boolean widthLarger=false, heightLarger=false;
float imageBackgroundX, imageBackgroundY, imageBackgroundWidth, imageBackgroundHeight;
PImage pic;
Boolean nightMode=true;
//
size(600,600); //Landscape
//Copy Display Oreintation
appWidth = width;
appHeight = height;
//
//Aspect Ratio Calculations
//marcus.jpg
int picWidth = 600;
int picHeight = 600;
//Image Orientation: Landscape, Portrait, Square
if ( picWidth>=picHeight ) {//True if Landscape or Square
 largerDimention = picWidth;
 smallerDimention = picHeight;
 widthLarger = true;
}else {//False if Portrait
 largerDimention = picHeight;
 smallerDimention = picWidth;
 heightLarger = true;
}
//
if (widthLarger ==true  ) imageWidthRatio = largerDimension / largerDimension;
if (widthLarger ==true ) imageHeightRatio = smallerDimension / smallerDimension;
if (heightLarger ==true ) imageWidthRatio = smallerDimension / smallerDimension;
if (heightLarger ==true ) imageHeightRatio = largerDimension / largerDimension;
//
picWidthAdjusted =appWidth * imageWidthRatio;
picHeightAjusted =appHeight = imageHeightRatio;
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
if (nightMode ==false)tint(90, 80, 80); //RGB: Night Mode
//
image(pic,imageBackgroundX, imageBackgroundY, imageBackgroundWidth, imageBackgroundHeight );
