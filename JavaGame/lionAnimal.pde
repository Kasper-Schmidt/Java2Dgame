class lionAnimal {

  float lionPlacementX=random(0, 1920);
  float lionPlacementY=random(650,900);
  int[] lionSpeedArray = { -5, 5 };                                                        //I use this to later determine if the lions move left or right when i start the game
  float size = 0.7;
  float lionSpeed = 5;
  PImage lionPicture;
  float x = int(0.9*width);
  float y = int(height*0.9);

  
  lionAnimal() {
    lionPicture = lionChar.copy();                                                        //I make copies of the original lion to display.
    lionPicture.resize(width/6, 0); 
  }
 

void display() {
  imageMode(CENTER);
 //for(int i=0; i< 5;i = i+300) {
   pushMatrix();                                                                          
   translate( lionPlacementX, lionPlacementY );
   if ( lionSpeed < 0 ) {
     scale ( -1, 1 );                                                                    //This mirrors the lion, so when it runs to the left, the lion turns around
   } else {  
     scale( 1 );
   }
    image(lionChar, 0, 0, 8*width/170, 8*height/125);
    popMatrix();
    noFill();
    stroke( 255, 0, 0 );
    

}
  
  
  void moveLion() {
   
    lionPlacementX = lionPlacementX + lionSpeed;
    
    if(lionPlacementX > width- 125 * size ) {
      lionSpeed = -5;
      
    }
    
    if(lionPlacementX < 0) {
      lionSpeed = +5;
    }
  }
   
   void startLionSpeed() {
     
    int arrayIndex = int(random(lionSpeedArray.length));                                  //Here i determine if the lions move left or right, by using Random to get a random number based on array.length. The length is 2, so ArrayIndex will either be 0 or 1, which translates to either -5 or 5 in the LionSpeedArray.
    lionSpeed = lionSpeedArray[arrayIndex];
    
   }
 }
