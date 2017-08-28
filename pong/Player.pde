enum Side {
  LEFT, RIGHT
}

enum MovementDirection { 
  UP, DOWN
}

class Player {
  
  Side side;
  
  int barLength = 140;
  int barWidth = 20;

  int x;
  int y = height/2 - barLength/2 ;
  
  boolean isMoving = false;
  MovementDirection direction = MovementDirection.UP;
  
  public Player(Side side) {
    
    this.side = side;
    
    if (side == Side.LEFT) {
     
      x = 30;
      
    } else {
    
      x = width - 30;
    }
    
    this.side = side;    
  }
  
  void tick() {
    
    if (isMoving) {
      
      if (direction == MovementDirection.UP) {  
        
        y -= 5;
        
      } else {
        
        y += 5;
      }
    }
  }
  
  void draw() {

    if (this.side == Side.LEFT) {

      rect(x - barWidth, y, barWidth, barLength);
      
    } else {

      rect(x, y, barWidth, barLength);
      
    }
  }
 
  public void moveUp() {
    
    isMoving = true;
    direction = MovementDirection.UP;
  }

  public void moveDown() {

    isMoving = true;
    direction = MovementDirection.DOWN;
  }
  
  public void stop() {
    
    isMoving = false;
  }
}