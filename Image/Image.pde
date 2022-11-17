//Global Variables
int appWidth, appHeight;
float backgroundImageX, backgroundImageY, backgroundImageWidth, backgroundImageHeight;
float picWidthAdjusted1=0.0, picHeightAdjusted1=0.0;
float picWidthAdjusted2=0.0, picHeightAdjusted2=0.0;
float picWidthAdjusted3=0.0,picHeightAdjusted3=0.0;
float topHalfX,topHalfY,topHalfWidth,topHalfHeight;
float bottomHalfX, bottomHalfY, bottomHalfWidth, bottomHalfHeight;
PImage pic1, pic2, pic3;
Boolean nightMode=false;
int tintDayMode=255, tintDayModeOpacity=50;
int tintRed=64, tintGreen=64,tintBlue=40,tintNightModeOpacity=85;
//
void setup()
{
   size(600,600); //Landscape
   //Copy Display Algorithm from Hello World
   //fullScreen(); //displayWidth,displayHeight
   appWidth = width;
   appHeight = height;
   //
   //Population
   pic1 = loadImage("../Images used/Landscape/marcus.jpg");
   pic2 = loadImage("../Images used/Landscape/anakin.jpg");
   pic3 = loadImage("..//Images used/Portrait/castiel.jpg");
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
   //Image dimensions for Aspect Ratio: image meta data
   //Note:meta explored in MP3's or music files
   //marcus.jpg
   //Note: Dimensions are found in the image file / Right Click / Properties / Details
   int picWidth1 = 600;//Marcus Landscape
   int picHeight1 = 600;
   int pic2Width=564;//Anakin Landscape
   int pic2Height=564;//
   int picWidth3 =736;//Castiel portrait
   int picHeight3=736;
   //
   float smallerDimension1,smallerDimension2,smallerDimension3;
   float largerDimension1,largerDimension2,largerDimension3;
   float imageWidthRatio1=0.0, imageHeightRatio1=0.0;
   float imageWidthRatio2=0.0, imageHeightRatio2=0.0;
   float imageWidthRatio3=0.0, imageHeightRatio3=0.0;
   //Image Orientation: Landscape, Portrait, Square
   //Scaling Image size with aspect ratio requires larger dimension
   if ( picWidth1>=picHeight1 ) {//True if Landscape or Square
     largerDimension1 = picWidth1;
     smallerDimension1 = picHeight1;
     //
     picWidthAdjusted1 = backgroundImageWidth;//from rect() layout
     imageHeightRatio1=smallerDimension1 /largerDimension1;
     picHeightAdjusted1=picWidthAdjusted1 * imageHeightRatio1; 
}  else {//False if Portrait
     largerDimension1 = picHeight1;
     smallerDimension1 = picWidth1;
     //
      picHeightAdjusted1 = backgroundImageWidth;//from rect() layout
     imageHeightRatio1=smallerDimension1 /largerDimension1;
     picWidthAdjusted1=picHeightAdjusted1 * imageHeightRatio1;
   } 
   
   if ( pic2Width>=pic2Height ) {//True if Landscape or Square
     largerDimension2 = pic2Width;
     smallerDimension2 = pic2Height;
     //
     picWidthAdjusted2 = topHalfWidth;//from rect() layout
     imageHeightRatio2=smallerDimension2 /largerDimension2;
     picHeightAdjusted2=picWidthAdjusted2 * imageHeightRatio2; 
}  else {//False if Portrait
     largerDimension2 = pic2Height;
     smallerDimension2 = pic2Width;
     //
      picHeightAdjusted1 = topHalfHeight;//from rect() layout
     imageHeightRatio1=smallerDimension1 /largerDimension1;
     picWidthAdjusted1=picHeightAdjusted1 * imageHeightRatio1;
   }
  
   if ( picWidth3>=picHeight3 ) {//True if Landscape or Square
     largerDimension3 = picWidth3;
     smallerDimension3 = picHeight3;
     //
     picWidthAdjusted3 = bottomHalfWidth;//from rect() layout
     imageHeightRatio3=smallerDimension3 /largerDimension3;
     picHeightAdjusted3=picWidthAdjusted3 * imageHeightRatio3; 
}  else {//False if Portrait
     largerDimension3 = picHeight3;
     smallerDimension3 = picWidth3;
     //
      picHeightAdjusted3 = bottomHalfHeight;//from rect() layout
     imageHeightRatio3=smallerDimension3 /largerDimension3;
     picWidthAdjusted3=picHeightAdjusted3 * imageHeightRatio3;
   }
   //
   //Rectangle Layout and Image drawing to CANVAS
   rect( backgroundImageX, backgroundImageY, backgroundImageWidth, backgroundImageHeight );
   rect(topHalfX,topHalfY,topHalfWidth,topHalfHeight);//Top Half
   rect(bottomHalfX,bottomHalfY,bottomHalfWidth,bottomHalfHeight);//Bottom Half
   //
   //Background Image must be single executed code
  if (nightMode == false) tint(tintDayMode, tintDayModeOpacity); //Gray Scale: use 1/2 tint value for white (i.e. 128/256=1/2)
  //image( pic, backgroundImageX, backgroundImageY, backgroundImageWidth, backgroundImageHeight);
  image( pic1, backgroundImageX, backgroundImageY, picWidthAdjusted1, picHeightAdjusted1);
  //
 }//End setup
 //
 void draw() 
 {
  image( pic2, topHalfX, topHalfY,  picWidthAdjusted2, picHeightAdjusted2 );
  image( pic3, bottomHalfX, bottomHalfY, picWidthAdjusted3, picHeightAdjusted3 );
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
    image( pic1, backgroundImageX, backgroundImageY, picWidthAdjusted1, picHeightAdjusted1);
    //
  }
  if (mouseButton == RIGHT) {
    nightMode = true;
    tint(tintRed,tintGreen,tintBlue,tintNightModeOpacity); //RGB: Night Mode
    image( pic2, backgroundImageX, backgroundImageY, picWidthAdjusted2, picHeightAdjusted2);
  }
}//End mousePressed
//
//End Main Program
