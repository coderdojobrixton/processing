import processing.sound.*;

DrumMachine dm;

void setup() 
{
  size(1000, 500);
  background(0);
  
  final int bpm = 100;
  final int numSteps = 4;
  dm = new DrumMachine(bpm, numSteps);
  
  SoundFile kick = new SoundFile(this, "808kick.aif");
  dm.addSample("Kick", kick);
  
  SoundFile snare = new SoundFile(this, "808snare1.aif");
  snare.amp(.9);
  dm.addSample("Snare", snare);
}      

void draw()
{
  // Reset the background each time so things like tempo are displayed
  // properly, instead of overprinting.
  background(255);
  
  // Display the drum machine.
  dm.display();
  // Play the sequencer. This happens each frame, but if the drum machine's
  // isPlaying field is set to false, no sound will be produced. 
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