int amt= 500;  //declaring data types
Raindrops[] rain = new Raindrops[amt]; //declaring array of raindrops
int time1 =0;
int index = 1;
int score = 0;
Catcher circle; //declaring the catcher

void setup() {
  size(500, 500);
  circle = new Catcher();

  for (int i =0; i<amt; i++) { //giving value to array of raindrops (rain)
    rain[i] = new Raindrops();
  }
}

void draw() {
  background(0);
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

