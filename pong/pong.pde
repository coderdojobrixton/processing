Game game;

void setup() {

  size(800, 500);

  game = new Game();
}

void draw() {
 
  background(100);
  
  game.tick();
  
}