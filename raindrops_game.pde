int amt= 500;  //declaring data types
Raindrops[] rain = new Raindrops[amt]; //declaring array of raindrops
int time1 =0;
int index = 1;
int score = 0;
int rx, ry, rh, rw;
Catcher circle; //declaring the catcher
boolean claire=false;

void setup() {
  size(500, 500);
  rx= width/2;
  ry= height/2;
  rw=100;
  rh=40;
  circle = new Catcher();

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
  if (score>1) {
    over();
  }
}


void game() {
  background(0);
  fill(255);
  textSize (50);
  text("Score:" +score, width/2, width/2); //displaying the score on the screen
  for (int i=0; i<index; i++) { //making one raindrop fall at first
    rain[i].display(); //displaying the raindrops
    rain[i].move(); //making the raindrops fall
    rain[i].checkCat(circle); //checking if the raindrops hit the catcher
  }

  if (millis()-time1>2500) { //increasing the index by one every two and a half seconds
    time1=millis(); 
    index++;
  }
  circle.display(); //displaying the catcher
}

void star() {
  background(0);
  fill(0, 255, 0);
  rectMode(CENTER);
  rect(rx, ry, rw, rh);
  fill(0);
  text("Start", rx-10, ry);
}
void over() {
  background(0);
  textSize(50);
  fill(255);
  textAlign(CENTER, CENTER);
  text("Game Over!", rx, ry);
}

void mousePressed() {
  claire=!claire;
}

