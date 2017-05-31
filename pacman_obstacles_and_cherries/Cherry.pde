// this is just a CIRCLE
class Cherry {
 
  int x;
  int y;
  int size;
  boolean isEaten;

  public Cherry(int passedX, int passedY, int passedSize) {
    
    x = passedX; 
    y = passedY; 
    size = passedSize;
    
    isEaten = false;
  }

  void draw() {
    // draw cherry if not eaten yet 
    if (!isEaten) {
      
      fill(#F00505);
      ellipse(x, y, size, size);
      
    }
  }
}