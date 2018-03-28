// TODO
// . bounce from the player with a little directional noise (or not?)
// . simplify simplify simplify!!!!!

// . pressing w or s for a long time makes it hang - it's a problem with OSX Sierra
// https://github.com/processing/processing/wiki/Troubleshooting#key-repeat-on-macos-sierra
//   a little menu when pressing the key long enough, to disable it:
//      defaults write -g ApplePressAndHoldEnabled -bool false
//   to reenable
//      defaults write -g ApplePressAndHoldEnabled -bool true

// Sketch / Import Library / Sound
import processing.sound.*;

Game game;

void setup() {
  size(800, 500);
  game = new Game(this);
  
  noStroke();
}

void draw() {
  background(100);

  game.tick();
  game.draw();
}  

/*
 Processing (Java?) is not great when handling mutliplue key-press events, so 
 here we've a specific strategy to handle it well enough. 
 Player's bar move is initiated when key is pressed, and only stops when there is a specific "key release" event generated.
 Check Player class for details.
*/
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