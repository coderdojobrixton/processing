// this is just a RECTANGLE
class Wall {
  
  int x;
  int y;
  int width; 
  int height;

  public Wall(int passedX, int passedY, int passedWidth, int passedHeight) {
    
    x = passedX; 
    y = passedY; 
    width = passedWidth; 
    height = passedHeight;
    
  }

  void draw() {
    rect(x, y, width, height);
  }
}