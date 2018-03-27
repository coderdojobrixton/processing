import processing.sound.*;

DrumMachine dm;

void setup() 
{
  size(1000, 500);
  background(0);
  
  final int bpm = 100;
  final int numSteps = 16;
  dm = new DrumMachine(bpm, numSteps);
  
  SoundFile kick = new SoundFile(this, "808kick.aif");
  IntList sequence = new IntList(0, 4, 8, 12);
  dm.addTrack("Kick", kick, sequence);
  
  SoundFile snare = new SoundFile(this, "808snare1.aif");
  snare.amp(.9);
  sequence = new IntList(2, 6, 10, 14);
  dm.addTrack("Snare", snare, sequence);
}      

void draw()
{
  // Reset the view each time so things like tempo are 
  // displayed properly, rather than overprinting.
  background(25);
  
  // Draw a box to contain the drum machine interface.
  fill(150);
  rect(5, 5, width - 10, height - 10, 8);
  
  dm.display();
  dm.playSequencer();
}

// Handle user interaction via the mouse.
void mouseClicked()
{
  dm.handleClick();
}

// Handle user interaction via the keyboard.
void keyPressed()
{
  dm.handleKey(keyCode);
}