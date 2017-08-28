class Player {
  
  String side;
  
  public Player(String side) {
    
    this.side = side;    
  }
  
  void tick() {
    
      println("Player " + this.side + " tick");
  }
  
  void draw() {
    
  }
}