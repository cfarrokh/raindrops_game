int amt= 500;  //declaring data types
Raindrops[] rain = new Raindrops[amt]; //declaring array of raindrops
int time1 =0;
int index = 1;
int score = 0;
int lives = 10;
int rx, ry, rh, rw;
Catcher circle; //declaring the catcher
boolean done;
boolean start;
PImage sky;
PImage end;
int h = 100;
int hs=1;
Raindrops over;
void setup() {
  size(500, 500);
  rx= width/2;
  ry= height/2;
  rw=100;
  rh=50;
  over= new Raindrops();
  circle = new Catcher();
  sky = loadImage("sky.jpg");
  end= loadImage("meteor.jpg");

  for (int i =0; i<amt; i++) { //giving value to array of raindrops (rain)
    rain[i] = new Raindrops();
  }
}

void draw() {
  if (start==false && done==false) { //when nothing has been pressed, display start screen
    star();
  }
  if (start==true  || done==true) { //if played for the 1st time, or being replayed, play the game
    game();
  }
  if (lives<=0 && start==true && done==false || lives<=0 && start==true && done==true ) { //when the lives are zero, display game over
    over();
  }
}

void game() {
  image(sky, 0, 0, displayWidth, displayHeight);
  colorMode(RGB, 255, 255, 255);
  textAlign(CORNER, CORNER);
  fill(255);
  textSize (25);
  text("Score:" +score, width-110, 25); //displaying the score on the screen
  text("Lives:" +lives, 5, 25); //displaying lives
  for (int i=0; i<index; i++) { //making one star fall at first
    rain[i].display(); //displaying the stars
    rain[i].move(); //making the stars fall
    rain[i].checkCat(circle); //checking if the stars hit the catcher
    rain[i].lives(); //lives decrease by one each time the star hits the bottom
  }
  if (millis()-time1>2500) { //increasing the index by one every two and a half seconds
    time1=millis(); 
    index++;
  }
  circle.display(); //displaying the catcher
}

void star() {
  colorMode(HSB, 360, 100, 100);
  background(250, 100, h); //background that shows shades of blue
  h-=hs;
  if (h<0) {
    hs=-hs;
  }
  if (h>100) {
    hs=-hs;
  }
  colorMode(RGB, 255, 255, 255);
  textAlign(CORNER, CORNER);
  textSize(15);
  fill(0, 255, 0);
  rectMode(CENTER);
  rect(rx, ry, rw, rh); //start button
  fill(0);
  text("Start", rx-10, ry);
  fill(255);
  textSize(25);
  textAlign(CENTER, CENTER);
  text("Catch A Falling Star", width/2, 30);
}

void over() {
  image(end, 0, 0, displayWidth, displayHeight);
  textSize(50);
  colorMode(RGB, 255, 255, 255);
  textAlign(CORNER, CORNER);
  fill(255);
  textAlign(CENTER, CENTER);
  text("Game Over!", rx, ry-50);
  fill(0, 255, 0);
  text("Play again?", rx, ry);
  over.yes(); //shows one star
}

void mousePressed() {
  if (start==false && done==false && mouseX<(rx+rw) && mouseX>rx && mouseY<(ry) && mouseY>(ry-50)) {
    start=true; //if the start button is clicked, start=true
  }
  if (start==true && done==false && mouseX<(over.loc.x+(over.d+10)) && mouseX>over.loc.x && mouseY<(over.loc.y+(over.d+10)) && mouseY>over.loc.y) {
    done=true;
    lives=10;
    score=0; //if the star is clicked to replay the game, it restarts the game
  }
  if (start==true && done==true && mouseX<(over.loc.x+(over.d+10)) && mouseX>over.loc.x && mouseY<(over.loc.y+(over.d+10)) && mouseY>over.loc.y) {
    score=0;
    lives=10;
  }
}

