class Catcher {
  int x, y, d; //declaring data types
  PVector loc;
  Catcher() {
    d=50; //setting values
    x=mouseX+d/2;
    y=height-d/2;
    loc = new PVector (x, y); 
  }
  void display() { //displaying the catcher
    x=mouseX+d/2; //restating values so that it updates mouseX for each frame
    y=height-d/2;
    fill(255, 0, 0, 75);
    ellipse(mouseX, loc.y, d, d);
  }
}

