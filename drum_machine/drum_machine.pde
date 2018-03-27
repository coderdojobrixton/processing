import processing.sound.*;

SampleButton sb1;
SampleButton sb2;

void setup() 
{
  size(1000, 500);
  background(0);
  
  SoundFile kick = new SoundFile(this, "808kick.aif");
  sb1 = new SampleButton(10, 10, 90, 45, "kick", kick);
  
  SoundFile snare = new SoundFile(this, "808snare1.aif");
  snare.amp(.9);
  sb2 = new SampleButton(10, 10 + sb1.h + 5, 90, 45, "snare", snare);
}      

void draw()
{
  background(255);
  
  sb1.display();
  sb2.display();
}

// Handle user interaction via the mouse.
void mouseClicked()
{
  if (sb1.mouseOver)
  {
    sb1.play();
  }
  else if (sb2.mouseOver)
  {
    sb2.play();
  }
}

// Handle user interaction via the keyboard.
void keyPressed()
{
  switch (keyCode) {
      // Numeric keys trigger samples.
      case '1':
        sb1.play();
        break;
      case '2':
        sb2.play();
        break;     
    }
}