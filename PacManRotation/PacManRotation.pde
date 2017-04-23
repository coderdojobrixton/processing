float currentStart;
float currentEnd;

float targetStart;
float targetEnd;

void setup(){
  
  size(500, 500); 
  
  currentStart = radians(45);
  currentEnd = radians(315);
  
  targetStart = currentStart;
  targetEnd = currentEnd;
  
}

void draw(){
    
  background(255);
      
  fill(#FFE51C);

  calculateNewCurrentValues();

  arc( 100 , 100 , 100 , 100 , currentStart , currentEnd , PIE);
  
}

void calculateNewCurrentValues(){
  
  float diffStart  = targetStart - currentStart;
  float diffEnd    = targetEnd - currentEnd;
  
  diffStart  = diffStart / 10;
  diffEnd    = diffEnd / 10;
  
  currentStart  = currentStart + diffStart;
  currentEnd    = currentEnd + diffEnd;
}

void keyPressed() {
  
  switch(keyCode){
    
    case UP :
     
         targetStart = radians(-45);
         targetEnd = radians(225);
       
     break;
     case DOWN :
     
         targetStart = radians(135);
         targetEnd = radians(405);
       
     break;
     case LEFT :
     
         targetStart = radians(-135);
         targetEnd = radians(135);
       
     break;
     case RIGHT :
     
        targetStart = radians(45);
        targetEnd = radians(315);
       
     break;
  }
  
}