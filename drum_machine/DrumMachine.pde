// The drum machine class.
class DrumMachine
{
  // Some graphical constants for use in displaying the drum machine.
  // The x position of the drum machine interface.
  final float x = 10;
  // The y start position of the tracks.
  final float tracksStartY = 100;
  // The height of each track.
  final float trackHeight = 50;
  // The width of the tempo display.
  final float tempoWidth = 75;
  // The width of a sample button.
  // Used to set the position of the step indicators.
  final float sampleButtonWidth = 100;
  
  // The tempo of the drum machine in beats per minute.
  int bpm;
  // The number of steps in the sequencer.
  int numSteps;
  // The current step to play.
  int step;
  // A list to hold the tracks (samples and sequencers)
  // in the drum machine.
  ArrayList<Track> tracks;
  // An array to hold the indicators that show which step
  // in the sequencer is currently being played.
  // Use an array rather than an ArrayList because the number
  // of steps is set when the drum machine is created -- the
  // number of tracks can vary.
  StepIndicator[] stepIndicators;
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
    
    // Set up the list of tracks.
    this.tracks = new ArrayList<Track>();
    
    // Set up the step indicators -- the lights above each sequencer
    // step that show which step is currently being played.
    this.stepIndicators = new StepIndicator[this.numSteps];
    // Calculate the spacing between each step indicator.
    float indicatorSpacing = (width - (2 * this.x) - this.sampleButtonWidth) / this.numSteps;
    for (int i = 0; i < this.numSteps; i++)
    {
      float xPos = this.x + this.sampleButtonWidth + (indicatorSpacing * i);
      stepIndicators[i] = new StepIndicator(xPos, this.tracksStartY - 10, indicatorSpacing, this.trackHeight, color(50));
    }
    
    // Set up the sequencer step counter.
    this.step = 0;
    
    // Set up the transport controls.
    this.playButton = new PlayButton(this.x + this.tempoWidth, 10);
    this.stopButton = new StopButton(this.x + this.tempoWidth + this.playButton.w + 10, 10);
    
    // Reset the state of the drum machine.
    this.stop();
  }
  
  // Adds a sample to the drum machine.
  void addTrack(String name, SoundFile sf, IntList sequence)
  {    
    // Work out the y position of the track to be added by getting
    // the current number of tracks and using it to make sure the new
    // track appears below the existing ones.
    int numTracks = this.tracks.size();
    float yPos = this.tracksStartY + (this.trackHeight * numTracks);
    // Create and add the track.
    Track track = new Track(this.x, yPos, width - (2 * x), this.trackHeight, name, sf, this.numSteps, sequence);
    this.tracks.add(track);
  }
   
  // Displays the drum machine's components. 
  void display()
  {    
    // Display the current bpm.
    fill(0);
    text(this.bpm + " bpm", x + 10, 40);
    
    // Display the sequencer step indicators.
    for (StepIndicator i : this.stepIndicators)
    {
      i.display();
    }
    
    // Display the trasport buttons.
    this.playButton.display();
    this.stopButton.display();
    
    // Display the sequencer tracks.
    for (Track t : this.tracks)
    {
      t.display();
    }
  }
  
  // Plays the sequencer. Should be called each frame.
  void playSequencer()
  {
    if (this.isPlaying)
    {
      // Get the current sequencer step to play.
      int currentStep = this.step % this.numSteps;
      
      // Highlight the current step with the appropriate
      // step indicator.
      int indicatorStep = currentStep + 1;
      
      if (currentStep == this.numSteps - 1)
      {
        indicatorStep = 0;
      }
      
      this.stepIndicators[currentStep].isActive = false;
      this.stepIndicators[indicatorStep].isActive = true;
      
      // If current sequencer step is active for a track,
      // play the track's sample.
      for (Track t : this.tracks)
      {
        if (t.sequencer[currentStep].isActive)
        {
          t.play();
        }
      }
      
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
    
    // Activate the first sequencer step indicator in advance,
    // otherwise it won't be lit when play is pressed.
    this.stepIndicators[0].isActive = true;
    
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
    
    // Reset the sequencer step indicators.
    for (StepIndicator i : this.stepIndicators)
    {
      i.isActive = false;
    }
    
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
    else
    {
      // ... otherwise check the tracks for a sample button click. 
      for (Track t : this.tracks)
      {
        t.handleClick();
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
        // KeyCode '1' is integer 49, so subtract 49 to get a track number.
        int trackNumber = keyCode - 49;
        // Check that there's a track with this index.
        if (this.tracks.size() > trackNumber)
        {
          // If so, play the sound.
          Track track = this.tracks.get(trackNumber);
          track.play();  
        }
        break;      
    }
  }
}