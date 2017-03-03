void setup() {
  size(500, 500);
}

void draw() {
  
  
  drawCornerEllipse(0, 0, 200, 200);
  drawCenterEllipse(0, 0, 200, 200);
}

void drawCornerEllipse( float ellipseLeft , float ellipseTop, float ellipseWidth , float ellipseHeight){
  
  ellipseMode(CORNER);
  ellipse(ellipseLeft, ellipseTop, ellipseWidth, ellipseHeight);
  
}

void drawCenterEllipse( float ellipseLeft , float ellipseTop, float ellipseWidth , float ellipseHeight){
  
  ellipseMode(CENTER);
  ellipse(ellipseLeft, ellipseTop, ellipseWidth, ellipseHeight);
  
}