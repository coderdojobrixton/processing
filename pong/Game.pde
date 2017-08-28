class Game {
  
  Player player1;
  Player player2;
    
  public Game() {
    
    player1 = new Player("left");
    player2 = new Player("right");
    
  }
  
  void tick() {
    
    println("Game tick");
    
    player1.tick();
    player2.tick();
  }
  
  void draw() {
    
    
  }
 
}