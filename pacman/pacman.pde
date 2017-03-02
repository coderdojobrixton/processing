void setup() {
  size(500, 500);

  smooth();
  noFill();
}

boolean isClosing = true;
float pos = QUARTER_PI;
float maxPos = 1.1 * QUARTER_PI; 

void draw() {
  // background
  background(255);

  // body
  fill(#FFE75A);
  strokeWeight(3);
  int steps = 20;

  if (isClosing) {
    pos -= (maxPos / steps);
  } else {
    pos += (maxPos / steps);
  }

  if (isClosing && pos <= 0) { 
    isClosing = false;
  }
  if (!isClosing && pos >= maxPos) { 
    isClosing = true;
  }

  // body
  arc(width / 2, height/2, 
    200, 
    200, pos, TWO_PI - pos, PIE);

  // eye
  fill(0);
  ellipse(width / 2 + 5, height/2 - 30, 15, 15);
}
