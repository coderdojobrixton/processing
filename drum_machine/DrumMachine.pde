// The drum machine class.
class DrumMachine
{
  // Some graphical constants for use in displaying the drum machine.
  // The x position of the drum machine interface.
  final float x = 10;
  // The y start position of the sample buttons.
  final float samplesStartY = 100;
  // The height of each sample button.
  final float sampleButtonHeight = 50;
  // The width of the tempo display.
  final int tempoWidth = 75;
  
  // The tempo of the drum machine in beats per minute.
  int bpm;
  // The number of steps in the sequencer.
  int numSteps;
  // The current step to play.
  int step;
  // A list to hold the samples in the drum machine.
  ArrayList<SampleButton> samples;
  // Transport buttons.
  PlayButton playButton;
  StopButton stopButton;
  // A flag to determine whether the drum machine is playing.
  boolean isPlaying;
  
  // Constructor: set up the drum machine.
  DrumMachine(int bpm, int numSteps)
  {
    // Set the bpm.
    this.bpm = bpm;
    
    // Set the number of sequencer steps.
    this.numSteps = numSteps;
    
    // Set up the list of samples.
    this.samples = new ArrayList<SampleButton>();
    
    // Set up the sequencer step counter.
    this.step = 0;
    
    // Set up the transport controls.
    this.playButton = new PlayButton(this.x + this.tempoWidth, 10);
    this.stopButton = new StopButton(this.x + this.tempoWidth + this.playButton.w + 10, 10);
    
    // Reset the state of the drum machine.
    this.stop();
  }
  
  // Adds a sample to the drum machine.
  void addSample(String name, SoundFile sf)
  {
    // Work out the y position of the sample button to be added by getting
    // the current number of sample buttons and using it to make sure the new
    // sample button appears below the existing ones.
    int numSamples = this.samples.size();
    float yPos = this.samplesStartY + (this.sampleButtonHeight * numSamples);
    // Create and add the sample button.
    SampleButton sample = new SampleButton(this.x, yPos, 95, 45, name, sf);
    this.samples.add(sample);
  }
   
  // Displays the drum machine's components. 
  void display()
  {    
    // Display the current bpm.
    fill(0);
    text(this.bpm + " bpm", x + 10, 40);
    
    // Display the trasport buttons.
    this.playButton.display();
    this.stopButton.display();
    
    // Display the samples.
    for (SampleButton sb : this.samples)
    {
      sb.display();
    }
  }
  
  // Plays the sequencer. Should be called each frame.
  void playSequencer()
  {
    if (this.isPlaying)
    {
      // Get the current sequencer step to play.
      int currentStep = this.step % this.numSteps;
      
      // Play the kick on the first beat...
      if (currentStep == 0)
      {
        this.samples.get(0).play();
      }
      // ... and the snare on the third beat.
      else if (currentStep == 2)
      {
        this.samples.get(1).play();
      }
      // These are hard-coded for now... we'll fix that later.
      
      // Increment the step ready for the next frame.
      step++;
    }
  }
  
  // Starts the sequencer.
  void start()
  {
    this.isPlaying = true;
    
    // Set the state of the transport buttons.
    // The drum machine is playing, so the play button should be
    // disabled. The user can stop the drum machine though, so the
    // stop button should be enabled.
    this.playButton.disable();
    this.stopButton.enable();
    
    this.setTempo();
  }
  
  // Stops the sequencer
  void stop()
  {
    this.isPlaying = false;
    // Reset the step counter so next time play is pressed, the drum
    // machine is at the start of the sequence.
    this.step = 0;
    
    // Set the state of the transport buttons. Play should be ready;
    // the drum machine is stopped, so the stop button is disabled.
    this.stopButton.disable();
    this.playButton.enable();
    
    // If the sequencer isn't playing, set the frame rate to a value
    // whereby the UI feels responsive.
    frameRate(20);
  }
  
  // Sets the tempo of the drum machine by altering Processing's frame rate.
  void setTempo()
  {
    // Tempo is based on sixteenth notes (semiquavers).
    // Divide bpm by 60 to get beats per second.
    // Four sixteenth notes per beat (quarter note), so multiply by 4.
    float sixteenthNotesPerSecond = (float)this.bpm / 60 * 4;
    frameRate(sixteenthNotesPerSecond);
  }
  
  // Handle user interaction via the mouse.
  void handleClick()
  {
    // Check whether the user has clicked the play button...
    if (this.playButton.mouseOver)
    {
      this.start();
    }
    // ... or the stop button...
    else if (this.stopButton.mouseOver)
    {
      this.stop();
    }
    // ... or the sample buttons.
    else {
      for (SampleButton sb : this.samples)
      {
        sb.handleClick();
      }
    }
  }
  
  // Handle user interaction via the keyboard.
  void handleKey(int keyCode)
  {
    switch (keyCode) {
      // The up key increases the tempo.
      case UP:
        this.bpm++;
        this.setTempo();
        break;
        
      // The down key decreases the tempo.
      case DOWN:
        this.bpm--;
        this.setTempo();
        break;
        
      // Space starts/stops the sequencer.
      case ' ':
        if (!this.isPlaying)
        {
          this.start();
        }
        else
        {
          this.stop();
        }
        break;
      
      // Numeric keys trigger samples.
      case '1':
      case '2':
      case '3':
      case '4':
      case '5':
      case '6':
      case '7':
      case '8':
      case '9':
        // KeyCode '1' is integer 49, so subtract 49 to get a sample number.
        int sampleNumber = keyCode - 49;
        // Check that there's a sample with this index.
        if (this.samples.size() > sampleNumber)
        {
          // If so, play the sound.
          SampleButton sb = this.samples.get(sampleNumber);
          sb.play();
        }
        break;      
    }
  }
}