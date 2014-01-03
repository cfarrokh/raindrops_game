int amt= 500;  //declaring data types
Raindrops[] rain = new Raindrops[amt]; //declaring array of raindrops
int time1 =0;
int index = 1;
int score = 0;
int lives = 10;
int rx, ry, rh, rw;
Catcher circle; //declaring the catcher
boolean claire=false;
PImage sky;
PImage end;
int h = 170;
void setup() {
  size(500, 500);
  rx= width/2;
  ry= height/2;
  rw=100;
  rh=50;
  circle = new Catcher();
  sky = loadImage("sky.jpg");
  end= loadImage("meteor.jpg");

  for (int i =0; i<amt; i++) { //giving value to array of raindrops (rain)
    rain[i] = new Raindrops();
  }
}

void draw() {
  if (!claire) {
    star();
  }
  if (claire) {
    game();
  }
  if (lives<=0) {
    over();
  }
}

void game() {
  image(sky,0,0,displayWidth,displayHeight);
   colorMode(RGB,255,255,255);
  textAlign(CORNER,CORNER);
  fill(255);
  textSize (25);
  text("Score:" +score, width-110, 25); //displaying the score on the screen
  text("Lives:" +lives, 5, 25);
  for (int i=0; i<index; i++) { //making one raindrop fall at first
    rain[i].display(); //displaying the raindrops
    rain[i].move(); //making the raindrops fall
    rain[i].checkCat(circle); //checking if the raindrops hit the catcher
    rain[i].lives();
  }
  if (millis()-time1>2500) { //increasing the index by one every two and a half seconds
    time1=millis(); 
    index++;
  }
  circle.display(); //displaying the catcher
}

void star() {
  background(0);
  colorMode(RGB,255,255,255);
  textAlign(CORNER,CORNER);
  textSize(15);
  fill(0, 255, 0);
  rectMode(CENTER);
  rect(rx, ry, rw, rh);
  fill(0);
  text("Start", rx-10, ry);
  colorMode(HSB,360,100,100);
  fill(h,100,100);
  h++;
  if (h>230){
    h=170;
  }
  textSize(25);
  textAlign(CENTER,CENTER);
  text("Catch A Falling Star",width/2,30);
}
void over() {
  image(end,0,0,displayWidth,displayHeight);
  textSize(50);
   colorMode(RGB,255,255,255);
  textAlign(CORNER,CORNER);
  fill(255);
  textAlign(CENTER, CENTER);
  text("Game Over!", rx, ry);
}

void mousePressed() {
  claire=!claire;
}

