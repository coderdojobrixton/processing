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
    println("moveUpPlayer2()");
  } else if (keyCode == DOWN) {
    println("moveDownPlayer2()");
  } else if (key == 'w') {
    println("moveUpPlayer1()");
  } else if (key == 's') {
    println("moveDownPlayer1()");
  } else if (key == 'r') {
    println("newBall()");
  } else if (key == ' ') {
    println("toggleGameState()");
  }
  
}

void keyReleased() {
  
  if (keyCode == UP || keyCode == DOWN) {
    println("stopPlayer2()");
  } if (key == 'w' || key == 's') {
    println("stopPlayer1()");
  } 
  
}