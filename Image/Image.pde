//Global Variables
int appWidth, appHeight;
Boolean widthLarger=false, heightLarger=false;
Boolean widthLarger2=false, heightLarger2=false;
float picWidthAdjusted=0.0, picHeightAdjusted=0.0;
float backgroundImageX, backgroundImageY, backgroundImageWidth, backgroundImageHeight;
float topHalfX,topHalfY,topHalfWidth,topHalfHeight;
float bottomHalfX, bottomHalfY, bottomHalfWidth, bottomHalfHeight;
PImage pic, pic2, pic3;
Boolean nightMode=false;
int tintDayMode=255, tintDayModeOpacity=50;
int tintRed=64, tintGreen=64,tintBlue=40,tintNightModeOpacity=85;
//
void setup()
{
   size(600,600); //Landscape
   //Copy Display Oreintation
   appWidth = width;
   appHeight = height;
   //
   //Image dimensions for Aspect Ratio
   //marcus.jpg
   //Note: Dimensions are found in the image file / Right Click / Properties / Details
   int picWidth = 600;
   int picHeight = 600;
   int pic2Width=564;//Landscape
   int pic2Height=564;//Landscape
   //int pic3Width =;//portrait
   //int pic3Height=;//portrait
   //
   float smallerDimension, largerDimension, smallerDimension2, largerDimension2;
   //Image Orientation: Landscape, Portrait, Square
   if ( picWidth>=picHeight ) {//True if Landscape or Square
     largerDimension = picWidth;
     smallerDimension = picHeight;
     widthLarger = true;
  }  else {//False if Portrait
     largerDimension = picHeight;
     smallerDimension = picWidth;
     heightLarger = true;
   }
      if ( pic2Width>=pic2Height ) {//True if Landscape or Square
     largerDimension2 = pic2Width;
     smallerDimension2 = pic2Height;
     widthLarger = true;
     //Landscape lare Image to larger space OR smaller space
  }  else {//False if Portrait
     largerDimension2 = pic2Height;
     smallerDimension2 = pic2Width;
     heightLarger = true;
  }
   //
   float imageWidthRatio=0.0, imageHeightRatio=0.0;
   //Teaching example, width is known to be larger
   //Better Image Strech Algorithm, smaller image to larger CANVAS
   if ( appWidth >=picWidth ) {
     picWidthAdjusted = picWidth;
     //
     if ( widthLarger == true ) imageWidthRatio = largerDimension /smallerDimension;
     //
     if ( appHeight >= picHeight ) {
       if ( widthLarger == true ) imageHeightRatio = smallerDimension / largerDimension;
       picHeightAdjusted = picWidthAdjusted * imageHeightRatio;
       if (appHeight < picHeightAdjusted ) {
         println("STOP: image is too big for CANVAS");
         exit(); //stops any further use of APP
         //Remember: goal is 1:1 aspect ratio
       }
     } else {
       //Image smaller than CANVAS needs separate algorithm
     }
   } else {
     //Image smaller than CANVAS needs separate algorithm
   }
   //
   //Verifying Variable Values after algoroithm
   println("App Width:", appWidth, " and App Height:", appHeight);
   println("Larger Image dimension is:", largerDimension);
   println("Image dimensions are:", picWidth, picHeight);
   println("Adjusted Image dimesnions are (stretch is goal):", picWidthAdjusted, picHeightAdjusted);
   //
   //Population
   pic = loadImage("../Images used/Landscape/marcus.jpg");
   pic2 = loadImage("../Images used/Landscape/anakin.jpg");
   //pic3 = loadImage("..")
   backgroundImageX = appWidth*0;
   backgroundImageY = appHeight*0;
   backgroundImageWidth = appWidth-1;
   backgroundImageHeight = appHeight-1;
   topHalfX=appWidth* 1/4 ;
   topHalfY=appHeight * 1/20;
   topHalfWidth=appWidth * 1/2;
   topHalfHeight=appHeight * 8/20;
   bottomHalfX=appWidth * 1/2;
   bottomHalfY=appHeight * 3/4;
   bottomHalfWidth=appWidth * 1/4;
   bottomHalfHeight=appHeight * 4/20;
   //
   //Rectangle Layout and Image drawing to CANVAS
   rect( backgroundImageX, backgroundImageY, backgroundImageWidth, backgroundImageHeight );
   rect(topHalfX,topHalfY,topHalfWidth,topHalfHeight);//Top Half
   rect(bottomHalfX,bottomHalfY,bottomHalfWidth,bottomHalfHeight);//Bottom Half
   //
   //Background Image must be single executed code
  if (nightMode == false) tint(tintDayMode, tintDayModeOpacity); //Gray Scale: use 1/2 tint value for white (i.e. 128/256=1/2)
  //image( pic, backgroundImageX, backgroundImageY, backgroundImageWidth, backgroundImageHeight);
  image( pic, backgroundImageX, backgroundImageY, picWidthAdjusted, picHeightAdjusted);
  //
 }//End setup
 //
 void draw() 
 {
  if (nightMode == true) {
    tint(80, 80, 80); //RGB: Night Mode
    image( pic, backgroundImageX, backgroundImageY, picWidthAdjusted, picHeightAdjusted);
  }
}//End draw
//
void keyPressed() {
}//End keyPressed
//
void mousePressed() {
  //
  //Mouse Pressed will control background image
  if (mouseButton == LEFT) {
    nightMode = false;
    tint(tintDayMode,tintDayModeOpacity); //Gray Scale: use 1/2 tint value for white (i.e. 128/256=1/2)
    image( pic, backgroundImageX, backgroundImageY, picWidthAdjusted, picHeightAdjusted);
    //
  }
  if (mouseButton == RIGHT) {
    nightMode = true;
    tint(tintRed,tintGreen,tintBlue,tintNightModeOpacity); //RGB: Night Mode
    image( pic, backgroundImageX, backgroundImageY, picWidthAdjusted, picHeightAdjusted);
  }
}//End mousePressed
//
//End Main Program
