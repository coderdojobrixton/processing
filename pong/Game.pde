class Game {
  
  Player player1;
  Player player2;
    
  public Game() {
   
    player1 = new Player(Side.LEFT);
    player2 = new Player(Side.RIGHT);

  }
  
  void tick() {
    
    println("Game tick");
    
    player1.tick();
    player2.tick();
    
  }
  
  void draw() {

    player1.draw();
    player2.draw();
    
  }
}