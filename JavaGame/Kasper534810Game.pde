import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

//for lyd
Minim minim;
AudioPlayer gunshot;

//lionAnimal target;
lionAnimal[] targets = new lionAnimal[10];
scope myScope;



//Lion picture
PImage lionChar;




int y = 10;
int x = 10;
int score = 0;

//API
int timeInt;                                                                                                //I make this int to later use for my JSON
PImage background_pic;




void setup() {
  fullScreen(P2D);                                                                                          //because of P2D i cannot hold down the arrow keys to move the scope faster. But if I do not use it, the game is lagging
  
  minim = new Minim(this);
  gunshot = minim.loadFile("gunshot.mp3");
  lionChar = loadImage("lionpngfixed.png");



  //API
  getTimeBackground();

  for (  int i = 0; i <= targets.length-1; i++) {
    targets[i] = new lionAnimal();
    targets[i].startLionSpeed();
  }

  myScope = new scope();
}







void draw() {
  image(background_pic, width/2, height/2, width, height);

  for (  int i = 0; i < targets.length; i++) {
    targets[i].display();
    targets[i].moveLion();
    if (myScope.checkCollision( targets[i]) && mousePressed )  {
      targets[i].lionPlacementX = random(0, 1920);                                                         //Resets the lion after it has been shot, with a random x value.
      targets[i].lionPlacementY = random(650,900);                                                         //Resets the lion after it has been shot, with a random y value.
      score = score +1;                                                                                    //When i shoot i lion, it will add 1 to the score counter
    }
  }

  myScope.display();

  println(score);                                                                                          //print the score in the console.
  textSize(20);
  fill(255, 255, 255);
  text("Score : " + score, width*9/10, 30);                                                                //What will be displayed at the score counter, and the placement
} 



void mousePressed() {
  gunshot.rewind();                                                                                        //Let's the gunshot sound rewind, i can trigger it again.
  gunshot.play();
}

void keyPressed() {
  myScope.keyPressed();
}

//API
void getTimeBackground() {
  String timeURL = "https://timeapi.io/api/Time/current/zone?timeZone=Europe/Amsterdam";                    //This is the local variable i collect data for the Amsterdam time
  JSONObject json = loadJSONObject(timeURL);                                                                //Changes TimeURL from string to JSONObject
  String time = json.getString("time");                                                                     //Makes a local string variable called time, that has the same value as the time property on the JSONObject
  print(time);  
  String stringTime = (""+time.charAt(0)+time.charAt(1));
  timeInt = int(stringTime);
  println();

  if (timeInt >= 6 && timeInt <= 12) {
    background_pic=loadImage("landscape.jpg");
    println("Morning Time");
  }
  else if (timeInt >= 13 && timeInt <= 19) {
    background_pic=loadImage("landscapeday.jpg");
    println("Day Time");
  } 
  else {
    background_pic=loadImage("landscapenight.jpg");
    println("Night Time");
  }
}
