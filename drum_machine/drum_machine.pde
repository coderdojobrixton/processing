import processing.sound.*;

// This is the drum machine.
DrumMachine dm;

// The sequencer can have however many steps we like.
// 16 is a good number, as that's four beats with four 
// subdivisions (sixteenths/semiquavers) each.
final int numSequencerSteps = 16;

void setup() {
  size(1000, 500);
  background(0);
  
  int defaultBPM = 100;
  dm = new DrumMachine(defaultBPM);

  IntList sequence = new IntList();
  // Soundfiles from the /data folder of the sketch
  dm.addSample("Kick", new SoundFile(this, "808kick.aif"), new IntList(0, 7, 8, 10));
  
  dm.addSample("Snare", new SoundFile(this, "808snare1.aif"), new IntList(4, 9, 12, 15));
  
  SoundFile hiHat = new SoundFile(this, "808hihatclosed.aif");
  hiHat.amp(.3);
  dm.addSample("Hi-Hat", hiHat, new IntList(1, 3, 5, 7, 9, 11, 13));
  
  SoundFile hiHatMid = new SoundFile(this, "808hihatmid.aif");
  hiHatMid.amp(.3);
  dm.addSample("Hi-Hat 2", hiHatMid, new IntList(0, 2, 4, 6, 8, 10, 12));
  
  SoundFile openHat = new SoundFile(this, "808hihatopen.aif");
  openHat.amp(.3);
  sequence = new IntList();
  sequence.append(14);
  dm.addSample("Open hat", openHat, sequence);
  
  SoundFile crash = new SoundFile(this, "808crash.aif");
  crash.amp(.25);
  sequence = new IntList();
  sequence.append(0);
  dm.addSample("Crash", crash, sequence);
  
  SoundFile clave = new SoundFile(this, "808clave.aif");
  clave.amp(.4);
  sequence = new IntList(2, 3, 10, 11);
  dm.addSample("Clave", clave, sequence);
}      

void draw() {
  // Reset the view each time so things like tempo are displayed properly.
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

// Check for button clicks with the mouseClicked function.
void mouseClicked() {
  dm.handleClick();
}

// Check for key interaction with the keyPressed function. 
void keyPressed() {
  dm.handleKey(keyCode);
}