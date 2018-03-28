enum MovementDirection { 
  UP, DOWN
}

class Player {
  Side side;
  int score = 0;

  int moveStep = 2;

  int barLength = 140;
  int barWidth = 20;

  int x;
  int y = height/2 - barLength/2 ;

  boolean isMoving = false;
  MovementDirection direction = MovementDirection.UP;
  int dy = 0;

  public Player(Side side) { 
    this.side = side;

    if (side == Side.LEFT) {
      x = 30;
    } else {
      x = width - 30;
    }
  }

  public void addScore() {
    score++;
  }

  public void draw() {
    if (side == Side.LEFT) {
      rect(x - barWidth, y, barWidth, barLength);
    } else {
      rect(x, y, barWidth, barLength);
    }
  }

  public void tick() {

    if (isMoving) {
      // if hitting top or bottom -> stop
      if (y + dy < 0 || y + barLength + dy > height) {
        stop();
      } else {
        // otherwise keep moving (and increasing movement's acceleration)
        if (direction == MovementDirection.UP) {      
          dy--;
        } else {
          dy++;
        }

        y += dy;
      }
    }
  }

  // moveUp/Down and stop are called from the Game explicitly.
  // The longer player move is on, the more acceleration it gets, see tick() method. 
  public void moveUp() {
    isMoving = true;
    direction = MovementDirection.UP;
    if (dy >= 0) dy = -moveStep;
  }

  public void moveDown() {
    isMoving = true;
    direction = MovementDirection.DOWN;
    if (dy <= 0) dy = moveStep;
  }

  public void stop() {
    isMoving = false;
    dy = 0;
  }

  // note that player's bar is actually only a line, so ball is tested only agaist x property on X axis. 
  boolean willHit(Ball ball) {
    if (side == Side.LEFT) {

      float nextBallX = ball.nextX();
      float nextBallY = ball.nextY(); 

      // if x > ball.x - the ball is already out of reach, gone...
      if (x < ball.x && x >= nextBallX && y <= nextBallY && y + barLength >= nextBallY) {
        return true;
      } else {
        return false;
      }
    } else {
      float nextBallX = ball.nextX() + ball.size;
      float nextBallY = ball.nextY();

      // if x < ball.x - the ball is already out of reach, gone...
      if (x > ball.x && x <= nextBallX && y <= nextBallY && y + barLength >= nextBallY) {
        return true;
      } else {
        return false;
      }
    }
  }
}