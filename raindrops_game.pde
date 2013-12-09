int amt= 500;
Raindrops[] claire = new Raindrops[amt]; 
catcher ruthy;

void setup() {
  size(500, 500);
  ruthy = new catcher();
  
  for (int i =0; i<amt; i++) {
    claire[i] = new Raindrops();
  }
}

void draw() {
  background(0);
  for (int i=0; i<amt; i++) {
    claire[i].display();
    claire[i].move();
    claire[i].redo();
    claire[i].checkCat(ruthy);
  }
  ruthy.display();
  
}

