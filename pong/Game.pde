enum Side { 
  LEFT, RIGHT
}

class Game {
  Player player1 = new Player(Side.LEFT);
  Player player2 = new Player(Side.RIGHT);
  Ball ball;
  Sounds sounds;
  boolean isPaused;

  public Game(PApplet application) {
    sounds = new Sounds(application);
    newBall();
  }

  void newBall() {
    ball = new Ball(sounds, 400, 250);
  }

  void tick() {
    if (!isPaused) {
      if (player1.willHit(ball) || player2.willHit(ball)) {
        ball.bounceOffPlayer();
        sounds.playPong();
      }

      if (ball.isOffTheScreen()) {
        if (ball.whichSide() == Side.LEFT) {
          player2.addScore();
        } else {
          player1.addScore();
        }
        sounds.playWin();
        newBall();
      }

      ball.tick();
      player1.tick();
      player2.tick();
    }
  }

  void draw() {
    textAlign(CENTER);
    textSize(32);
    text(player1.score + "", width / 2 - 50, 50);
    text(player2.score + "", width / 2 + 50, 50);
    stroke(255);

    line(width/2, 0, width/2, height);

    player1.draw();
    player2.draw();
    ball.draw();
    
    if (isPaused) {
      text("PAUSED", width/2, height/2);
    }
  }

  void toggleGameState() {
    isPaused = !isPaused;
  }

  void moveUpPlayer1() {
    player1.moveUp();
  }

  void moveDownPlayer1() {
    player1.moveDown();
  }   

  void moveUpPlayer2() {
    player2.moveUp();
  }   

  void moveDownPlayer2() {
    player2.moveDown();
  }

  void stopPlayer1() {
    player1.stop();
  }

  void stopPlayer2() {
    player2.stop();
  }
}