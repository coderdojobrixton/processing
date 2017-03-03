void setup() {
  size(500, 500);
}

void draw() {
  
  
  drawCornerEllipse(0, 0, 200, 200);
  drawBoundingBox(0, 0, 200, 200 , false);
  drawCenterEllipse(0, 0, 200, 200);
  drawBoundingBox(0, 0, 200, 200 , true);
}

void drawCornerEllipse( int ellipseLeft , int ellipseTop, int ellipseWidth , int ellipseHeight){
  
  ellipseMode(CORNER);
  ellipse(ellipseLeft, ellipseTop, ellipseWidth, ellipseHeight);
  
}

void drawCenterEllipse( int ellipseLeft , int ellipseTop, int ellipseWidth , int ellipseHeight){
  
  ellipseMode(CENTER);
  ellipse(ellipseLeft, ellipseTop, ellipseWidth, ellipseHeight);
  
}

void drawBoundingBox( int boxLeft , int boxTop, int boxWidth , int boxHeight , boolean centerMode){
  
  if(centerMode == true){
    
    rectMode(CENTER);
    
  } else {
    
    rectMode(CORNER);
    
  }
  
  fill(0);
  rect(boxLeft, boxTop, boxWidth, boxHeight);
  
}