class PacMan {
  // position and size
  int x, y, size;

  // movement vectors
  float dx, dy = 0;
  // how many pixels to move in either direction
  float moveStep = 5;

  ArrayList<Wall> obstacles;
  ArrayList<Cherry> cherries;

  public PacMan(int _x, int _y, int _size, ArrayList<Wall> _obstacles, ArrayList<Cherry> _cherries) {
    x = _x;
    y = _y;
    size = _size;
    obstacles = _obstacles;
    cherries = _cherries;
  }

  void draw() {
    // shape of pacman
    fill(#FFE75A);
    strokeWeight(3);

    // body
    arc(x, y, size, size, radians(30), radians(330), PIE);
    // eye
    fill(0);
    ellipse(x + 5, y - 20, 5, 5);
  }

  void updateState() {
    
    // if colides in NEXT MOVE - stop, otherwise keep moving 
    if (collides(x + dx, y + dy)) {
      stop();
    } else {
      x += dx;
      y += dy;
    }

    // eat whatever is in range to be eaten
    eat();
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

  // Colision detection for obstacles - these are rectangles so we're checking 
  // PacMan's FUTURE position (note nextX, nextY) with position of any of obstacles.
  // If FUTURE position will be in the collision return true otherwise false
  // (It's best to draw it on the paper to understand or show and tell).
  boolean collides(float nextX, float nextY) {
    for (Wall o : obstacles) {
      if ((nextX + (size / 2) >= o.x) && (nextX - (size / 2) <= o.x + o.width)
        && (nextY + (size / 2) >= o.y) && (nextY - (size / 2) <= o.y + o.height) 
        ) {
        return true;
      }
    }
    return false;
  }

  // As above, but with circles. If collides in CURRENT position, mark cherry as eaten.
  void eat() {
    for (Cherry c : cherries) {
      if ((x + (size / 2) >= (c.x - (c.size/ 2))) && (x - (size / 2) <= c.x + (c.size /2))
        && (y + (size / 2) >= (c.y  - (c.size / 2))) && (y - (size / 2) <= c.y + (c.size / 2))) {
        c.isEaten = true;
      }
    }
  }
}