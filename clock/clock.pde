void setup() {
  size(500, 500);
  noStroke();
}

void draw() {
  background(172);

  // Angles for sin() and cos() start at 3 o'clock;
  // subtract HALF_PI to make them start at the top
  float s = map(second(), 0, 60, 0, TWO_PI) - HALF_PI;
  float m = map(minute(), 0, 60, 0, TWO_PI) - HALF_PI; 
  float h = map(hour() + norm(minute(), 0, 60), 0, 24, 0, TWO_PI * 2) - HALF_PI;

  translate(width/2, height/2);

  // zipherblat
  noStroke();

  // "button" at the center
  fill(0);
  ellipse(0, 0, 15, 15);

  scale(0.9, 0.9);
  fill(255);
  for (int i = 0; i <= 59; i++) {
    float a = map(i, 0, 60, 0.0, TWO_PI);

    if (i % 15 == 0) {
      ellipse(cos(a) * height / 2, sin(a) * height/2, 15, 15);
    } else {
      ellipse(cos(a) * height / 2, sin(a) * height/2, 10, 10);
    }
  }

  // seconds
  stroke(70, 70, 70);
  strokeWeight(1);
  line(0, 0, cos(s) * 220, sin(s) * 220);

  // minutes
  stroke(60, 60, 61);
  strokeWeight(5);
  line(0, 0, cos(m) * 210, sin(m) * 210);

  // hours
  if (h > 12) h -= 12;
  //rotate(radians(map(h + m / 60.0, 0.0, 12, 0.0, 360.0)));
  strokeWeight(7);
  line(0, 0, cos(h) * 100, sin(h) * 100);
}