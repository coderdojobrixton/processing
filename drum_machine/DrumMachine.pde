// The drum machine class.
class DrumMachine
{
  // Some graphical constants for use in displaying the drum machine.
  final int x = 10;
  final int tracksStartY = 100;
  final int trackHeight = 800 / numSequencerSteps; //50;
  final int sequencerButtonWidth = 800 / numSequencerSteps; //50;
  
  // The tempo of the drum machine in beats per minute
  int bpm;
  
  // A list to hold the tracks (samples and sequencers)
  // in the drum machine.
  ArrayList<Track> tracks;
  
  // An array to hold the indicators that show which step
  // in the sequencer is currently being played.
  StepIndicator[] stepIndicators;
  
  // Transport buttons.
  PlayButton playButton;
  StopButton stopButton;
  
  // A flag to determine whether the drum machine is playing.
  boolean isPlaying;
  
  // The current step to play.
  int step;
  
  // Constructor: set up the drum machine.
  DrumMachine(int bpm)
  {
    // Set the bpm.
    this.bpm = bpm;
    
    // Set up the list of tracks.
    this.tracks = new ArrayList<Track>();
    
    // Set up the step indicators -- the lights above each sequencer
    // step that show which step is currently being played.
    this.stepIndicators = new StepIndicator[numSequencerSteps];
    for (int i = 0; i < numSequencerSteps; i++)
    {
      int xPos = x + 92 + sequencerButtonWidth * i;
      stepIndicators[i] = new StepIndicator(xPos, tracksStartY - 10, sequencerButtonWidth, trackHeight, color(50));
    }
    
    // Set up the transport controls.
    this.playButton = new PlayButton();
    this.stopButton = new StopButton();
    
    // Reset the state of the drum machine.
    this.stop();
  }
  
  // Adds a sample to the drum machine.
  // Sets up a track with a name, a sound to play, and a list of steps
  // that are active by default when the track is set up.
  void addSample(String name, SoundFile sf, IntList sequence)
  {
    // Work out the y position of the track to be added by getting
    // the current number of tracks and using it to make sure the new
    // track appears below the existing ones.
    int numTracks = this.tracks.size();
    int yPos = this.tracksStartY + this.trackHeight * numTracks;
    // Create and add the track.
    Track track = new Track(this.x, yPos, sequencerButtonWidth, this.trackHeight, name, sf, sequence);
    this.tracks.add(track);
  }
   
  // Displays the drum machine's components. 
  void display()
  {
    // Display the trasport buttons.
    this.playButton.display();
    this.stopButton.display();
    
    // Display the current bpm.
    fill(0);
    text(this.bpm + " bpm", 150, 40);
    
    // Display the sequencer step indicators.
    for (StepIndicator i : this.stepIndicators)
    {
      i.display();
    }
    
    // Display the sequencer tracks.
    for (Track r : this.tracks)
    {
      r.display();
    }
  }
  
  // Plays the sequencer. Should be called each frame.
  void playSequencer()
  {
    // If the drum machine is set to play, go ahead and work
    // out what sounds to make this frame.
    if (this.isPlaying)
    {
      // Get the current sequencer step to play.
      int currentStep = this.step % numSequencerSteps;
      
      // Highlight the current step with the appropriate
      // step indicator.
      int indicatorStep = currentStep + 1;
      
      if (currentStep == numSequencerSteps - 1)
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
      
      step++;
    }
    else
    {
      // If the sequencer is stopped, set the step to zero,
      // ready for when the play button is next clicked (or
      // space is pressed).
      this.step = 0;
    }
  }
  
  // Handle user interaction via the mouse.
  void handleClick()
  {
    if (this.playButton.mouseOver)
    {
      this.start();
    }
    else if (this.stopButton.mouseOver)
    {
      this.stop();
    }
    else
    {      
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
          // Also make the sample button flash for some visual feedback.
          track.sampleButton.isActive = true;    
        }
        break;      
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
    this.step = 0;
    
    // Set the state of the transport buttons. Play should be ready;
    // the drum machine is stopped, so the stop button is disabled.
    this.stopButton.disable();
    this.playButton.enable();
    
    //for (Track t : this.tracks)
    //{
    //  // Stopping a sample that isn't playing throws an error.
    //  // Doesn't affect execution, but it's something to be aware of.
    //  // Update: sometimes causes a crash; best not to use this.
    //  t.sampleButton.stop();
    //}
    
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
}