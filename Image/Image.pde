//BackGround Image Example
//
//Global Variables
int appWidth, appHeight;
float smallerDimension, largerDimension;
Boolean widthLarger=false, heightLarger=false;
float imageWidthRatio=0.0, imageHeightRatio=0.0;
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
 largerDimension = picWidth;
 smallerDimension = picHeight;
 widthLarger = true;
}else {//False if Portrait
 largerDimension = picHeight;
 smallerDimension = picWidth;
 heightLarger = true;
}
/* Older Algorithm
if (widthLarger == true  ) imageWidthRatio = largerDimension / largerDimension;
if (widthLarger == true )  imageHeightRatio = smallerDimension / smallerDimension;
if (heightLarger == true ) imageWidthRatio = smallerDimension / smallerDimension;
if (heightLarger == true ) imageHeightRatio = largerDimension / largerDimension;
*/
float picWidthAdjusted ,picHeightAdjusted;
//Better Image Strech Algorithm
if ( appWidth >=picWidth ) {
  picWidthAdjusted = picWidth;
  if ( widthLarger == true ) imageWidthRatio = largerDimension /smallerDimension;
  if ( heightLarger ==true ) imageWidthRatio = smallerDimension /smallerDimension;
} else {
  //Image smaller than CANVAS needs seperate Algorithm
}
if ( appHeight >=picHeight) {
  picHeightAdjusted = picHeight;
  if ( widthLarger == true ) imageHeightRatio= smallerDimension /largerDimension;
  if ( heightLarger == true ) imageHeightRatio = largerDimension /largerDimension;
} else {
  //Image smaller than CANVAS needs seperate Algorithm
}
println(appWidth, imageWidthRatio);
println(appHeight, imageHeightRatio);
picWidthAdjusted =appWidth * imageWidthRatio;
picHeightAdjusted =appHeight * imageHeightRatio;
//
//Developer verified variables
println(appWidth, picWidth,picWidthAdjusted);
println(appHeight, picHeight, picHeightAdjusted);
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
