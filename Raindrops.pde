class Raindrops {
  PVector loc; //declaring data types
  PVector vel;
  int d;
  float t;
  Raindrops() {
    loc= new PVector (random(width), 0); //giving values 
    vel = new PVector (0, random(2, 3));
    d=10; 
  }
  void display() {
    fill(0, 0, 255, 100);
    ellipse(loc.x, loc.y, d, d); //making an ellipse appear at (random(width)),0
  }  
  void move() {
    loc.add(vel); /*causing the raindrops to fall;
                  same as using loc.x+=vel.x;
                  loc.y+=vel.y */
  }
  
  void checkCat(Catcher c) { //function to check if raindrops hit the catcher
    if (dist(loc.x, loc.y, mouseX, c.loc.y) <= d/2 + c.d/2) { /*using the distance between the centers of the raindrop and 
                                                               the catcher to determine if the raindrop hits the catcher */
      loc.x=random(width); //if the raindrops hits the catcher, it will move the raindrop to the top of the screen
      loc.y=0;
      score++; //if the raindrops hits the catcher, the score increases by one
    }
  }
}

