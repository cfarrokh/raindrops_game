class Raindrops {
  PVector loc;
  PVector vel;
  int d;
  float t;
  Raindrops() {
    loc= new PVector (random(width),0);
    vel = new PVector (0,random(0,3));
    d=10;
    t=random(75,100);
  }
  void display() {
    fill(0, 0, 255,t);
    ellipse(loc.x, loc.y, d, d);
  }  
  void move() {
   loc.add(vel);
  }
  void redo(){
    if(loc.x> width || loc.y>height){
      loc.x=random(width);
      loc.y=0;}
  }
}


