class Game {
  
  Player player1;
  Player player2;
    
  public Game() {
   
    player1 = new Player(Side.LEFT);
    player2 = new Player(Side.RIGHT);

  }
  
  void tick() {

    player1.tick();
    player2.tick();
    
  }
  
  void draw() {

    player1.draw();
    player2.draw();
    
  }
  
   void newBall() {
    
  }
  
  void toggleGameState() {
    
  }

  void moveUpPlayer1() {
    
  }

  void moveDownPlayer1() {
    
  }   

  void moveUpPlayer2() {
    
  }   

  void moveDownPlayer2() {
    
  }

  void stopPlayer1() {
    
  }

  void stopPlayer2() {
    
  }
}