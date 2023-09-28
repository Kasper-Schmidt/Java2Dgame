class scope {

  int x = width/2;
  int y = height/2;
  int z = height/80;

  void display() {
    noFill();
    stroke(0, 0, 0);
    strokeWeight(4);
    strokeWeight(2);
    circle(x, y, z);

  }


  void keyPressed() {
    if (key == CODED) {
      if (keyCode == UP) {
        y = y - 10;
      } else if (keyCode == DOWN) {
        y = y + 10;
      } else if (keyCode == LEFT) {
        x = x - 10;
      } else if (keyCode == RIGHT) {
        x = x + 10;
      }
    }
  }


  boolean checkCollision (lionAnimal lion) {
    boolean isCollision = false;
    // check for collision between player and enemy.
    //isCollision = circleRect(
    noFill();
    stroke(255, 0, 0);
    rectMode(CORNER);
    // THIS WAS JUST TO MAKE COLLISION EASIER FOR ME TO MAKE
    //circle(x, y, z );
    //rect(                              lion.lionPlacementX-35, lion.lionPlacementY-30, lion.lionPicture.width/4, lion.lionPicture.height/5);


    isCollision = circleRect
    ( x, y, z, 
                                         lion.lionPlacementX-35, lion.lionPlacementY-30, lion.lionPicture.width/4, lion.lionPicture.height/5);
    return isCollision;
  }
  

  // CIRCLE/RECTANGLE
  boolean circleRect(float cx, float cy, float radius, float rx, float ry, float rw, float rh) {

    // temporary variables to set edges for testing
    float testX = cx;
    float testY = cy;

    // which edge is closest?
    if (cx < rx)         testX = rx;      // test left edge
    else if (cx > rx+rw) testX = rx+rw;   // right edge
    if (cy < ry)         testY = ry;      // top edge
    else if (cy > ry+rh) testY = ry+rh;   // bottom edge

    // get distance from closest edges
    float distX = cx-testX;
    float distY = cy-testY;
    float distance = sqrt( (distX*distX) + (distY*distY) );

    // if the distance is less than the radius, collision!
    if (distance <= radius) {
      return true;
    }
    return false;
  }
}
