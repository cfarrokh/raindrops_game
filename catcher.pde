class catcher{
int x,y,d;
  catcher() {
    d=100;
    x=mouseX;
    y=height;
    
  }
  void display(){  x=mouseX;
    y=height;
    fill(255,0,0,75);
    ellipse(x+d/2,y-d/2,d,d);
  }
}


