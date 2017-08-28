class Player {
  
  String side;
  
  int barLength = 140;
  int barWidth = 20;

  int x;
  int y = height/2 - barLength/2 ;
  
  public Player(String side) {
    
    this.side = side;
    
    if (side == "left") {
     
      x = 30;
      
    } else {
    
      x = width - 30;
    }
    
    this.side = side;    
  }
  
  void tick() {
    
      println("Player " + this.side + " tick");
  }
  
  void draw() {

    if (this.side == "left") {

      rect(x - barWidth, y, barWidth, barLength);
      
    } else {

      rect(x, y, barWidth, barLength);
      
    }
  }
}