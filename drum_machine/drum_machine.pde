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
  kick.amp(.9);
  IntList sequence = new IntList(0, 7, 8, 10);
  dm.addTrack("Kick", kick, sequence);
  
  SoundFile snare = new SoundFile(this, "808snare1.aif");
  snare.amp(.9);
  sequence = new IntList(4, 9, 12, 15);
  dm.addTrack("Snare", snare, sequence);
  
  SoundFile hiHat1 = new SoundFile(this, "808hihatclosed.aif");
  hiHat1.amp(.3);
  sequence = new IntList(1, 3, 5, 7, 9, 11, 13);
  dm.addTrack("Hi-Hat 1", hiHat1, sequence);
  
  SoundFile hiHat2 = new SoundFile(this, "808hihatmid.aif");
  hiHat2.amp(.3);
  sequence = new IntList(2, 4, 6, 8, 10, 12);
  dm.addTrack("Hi-Hat 2", hiHat2, sequence);
  
  SoundFile openHat = new SoundFile(this, "808hihatopen.aif");
  openHat.amp(.3);
  sequence = new IntList();
  sequence.append(14);
  dm.addTrack("Open hat", openHat, sequence);
  
  SoundFile crash = new SoundFile(this, "808crash.aif");
  crash.amp(.25);
  sequence = new IntList();
  sequence.append(0);
  dm.addTrack("Crash", crash, sequence);
  
  SoundFile clave = new SoundFile(this, "808clave.aif");
  clave.amp(.4);
  sequence = new IntList(2, 3, 10, 11);
  dm.addTrack("Clave", clave, sequence);
}      

void draw()
{
  // Reset the background each time to prevent overprinting.
  background(25);
  
  // Draw a box to contain the drum machine interface.
  fill(150);
  rect(5, 5, width - 10, height - 10, 8);
  
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