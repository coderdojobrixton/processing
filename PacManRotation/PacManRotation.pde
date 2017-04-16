float start;
float end;

void setup(){
  
  size(500, 500); 
  
  start = radians(45);
  end = radians(315);
  
}

void draw(){
    
  background(255);
      
  fill(#FFE51C);
  
  arc( 100 , 100 , 100 , 100 , start , end , PIE);
  
}