class Catcher {
  int x, y, d; //declaring data types
  PVector loc;
  PImage basket;
  Catcher() {
    d=50; //setting values
    x=mouseX+d/2;
    y=height-d;
    loc = new PVector (x, y); 
    basket = loadImage("basket.gif");
  }
  void display() { //displaying the catcher
    x=mouseX+d/2; //restating values so that it updates mouseX for each frame
    y=height-d;
    fill(255, 0, 0, 75);
    image(basket, mouseX, loc.y, d, d);
  }
}

