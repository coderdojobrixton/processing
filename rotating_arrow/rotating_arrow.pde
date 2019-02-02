PImage photo;
PImage arrow;
/*
void setup() {
  size(750, 750);
  arrow = loadImage("Arrow.png");
  imageMode(CENTER);
  image(arrow, width/2, height/2);
  
}

void draw() {
  
  rotate(66.0);
  
  
}
*/

float angle;
float jitter;

void setup() {
  size(750, 750);
  noStroke();
  fill(255);
  imageMode(CENTER);
   arrow = loadImage("Arrow.png");
  imageMode(CENTER);
}

void draw() {
  background(51);

  // during even-numbered seconds (0, 2, 4, 6...)
  if (second() % 2 == 0) {  
    //jitter = random(-0.1, 0.5);
    mouseX
    
  }
  angle = angle + jitter;
  float c = cos(angle);

  rotate(c);
 
  image(arrow, width/2, height/2);
}