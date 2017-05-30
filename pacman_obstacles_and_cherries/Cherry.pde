// this is just a CIRCLE
class Cherry {
 
  int x, y, size;
  boolean eaten = false;

  public Cherry(int _x, int _y, int _size) {
    x = _x; y = _y; size = _size;
  }

  void draw() {
    // draw cherry if not eaten yet 
    if (!eaten) {
      fill(#F00505);
      ellipse(x, y, size, size);
    }
  }
}