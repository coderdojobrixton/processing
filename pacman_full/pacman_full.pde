void setup() {
  size(1000, 1000);
}

PacMan pacMan = new PacMan(250, 250, 200);

void draw() {
  background(255);  // white background

  pacMan.draw();
  pacMan.update();
}

void keyPressed() {
  if (keyCode == UP) {
    pacMan.up();
  }
  if (keyCode == DOWN) {
    pacMan.down();
  }
  if (keyCode == LEFT) {
    pacMan.left();
  }
  if (keyCode == RIGHT) {
    pacMan.right();
  }
  if (key == ' ') {
    pacMan.stop();
  }
}



class PacMan {

  int x, y, size;
  boolean isOpening = true;
  float currentPosition = 0;
  float maxPosition = 45;
  int steps = 15;
  float positionStep = maxPosition / steps;

  float dx, dy = 0;
  float moveStep = 10;

  public PacMan(int _x, int _y, int _size) {
    x = _x;
    y = _y;
    size = _size;
  }

  void draw() {
    fill(#FFE75A); // yellow color filling!
    strokeWeight(3);

    arc(x, y, size, size, radians(currentPosition), radians(360 - currentPosition), PIE);

    // eye
    fill(0);
    ellipse(x + 5, y - 30, 15, 15);
  }

  void update() {
    if (isOpening) {
      currentPosition += positionStep;
    } else {
      currentPosition -= positionStep;
    }

    if (isOpening && currentPosition >= maxPosition) {
      isOpening = false;
    }
    if (!isOpening && currentPosition <= 0) {
      isOpening = true;
    }

    x += dx;
    y += dy;
  }

  void up() {
    dx = 0;
    dy = -moveStep;
  }

  void down() {
    dx = 0;
    dy = moveStep;
  }

  void left() {
    dx = -moveStep;
    dy = 0;
  }

  void right() {
    dx = moveStep;
    dy = 0;
  }

  void stop() {
    dx = 0;
    dy = 0;
  }
}