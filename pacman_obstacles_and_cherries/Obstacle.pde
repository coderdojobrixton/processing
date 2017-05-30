// this is just a RECTANGLE
class Obstacle {
  
  int x, y, w, h;

  public Obstacle(int _x, int _y, int _w, int _h) {
    x = _x; y = _y; w = _w; h = _h;
  }

  void draw() {
    rect(x, y, w, h);
  }
}