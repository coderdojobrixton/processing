Game game;

void setup() {

  size(800, 500);

  noStroke();
  stroke(255);
  
  game = new Game();
}

void draw() {
 
  background(100);
  
  game.tick();
  game.draw();
  
}

void keyPressed() {
  
  if (keyCode == UP) {
    game.moveUpPlayer2();
  } else if (keyCode == DOWN) {
    game.moveDownPlayer2();
  } else if (key == 'w') {
    game.moveUpPlayer1();
  } else if (key == 's') {
    game.moveDownPlayer1();
  } else if (key == 'r') {
    game.newBall();
  } else if (key == ' ') {
    game.toggleGameState();
  }
  
}

void keyReleased() {
  
  if (keyCode == UP || keyCode == DOWN) {
    game.stopPlayer2();
  } if (key == 'w' || key == 's') {
    game.stopPlayer1();
  } 
  
}