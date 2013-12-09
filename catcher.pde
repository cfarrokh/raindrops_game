class catcher {
  int x, y, d;
  PVector loc;
  catcher() {
    d=100;
    x=mouseX+d/2;
    y=height-d/2;
    loc = new PVector (x, y);
  }
  void display() {  
    x=mouseX+d/2;
    y=height-d/2;
    fill(255, 0, 0, 75);
    ellipse(mouseX, loc.y, d, d);
  }
}

