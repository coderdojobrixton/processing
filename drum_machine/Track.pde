// The track clas.
class Track
{
  // The width of the track's sample button.
  final int sampleButtonWidth = 100;
  
  // The track has a sample button...
  SampleButton sampleButton;
  // ... and an array of sequencer buttons.
  SequencerButton[] sequencer;
  
  // Constructor: set up the track, with dimensions, a sample name,
  // a sound file to play, and a default sequencer setting.
  Track(int x, int y, int w, int h, String name, SoundFile sf, int numSequencerSteps, IntList sequence)
  {
    // Set up the track's sample button.
    this.sampleButton = new SampleButton(x, y, this.sampleButtonWidth, h - 5, name, sf);
    // Set up the array to hold the track's sequencer buttons.
    this.sequencer = new SequencerButton[numSequencerSteps];
    
    int sequencerButtonWidth = (w - this.sampleButtonWidth) / numSequencerSteps;
    
    // Add sequencer buttons to the track -- as many as specified by
    // the the number of sequencer steps specified in the main
    // project file.
    for (int i = 0; i < numSequencerSteps; i++)
    {
      // If the current button number is in the sequence list, the 
      // sequencer button to add should be active by default.
      boolean isActive = sequence.hasValue(i);
      
      // Set the x position of the sequencer button so they all
      // appear side by side.
      int xPos = x + sampleButton.w + 5 + (i * sequencerButtonWidth);
      
      // Set the current sequencer button
      sequencer[i] = new SequencerButton(xPos, y, sequencerButtonWidth, h, isActive);
    }
  }
  
  // Displays the track.
  void display()
  {
    // Display this track's sample button. If the sample button is
    // active it'll be highlighted. 
    this.sampleButton.display();
    
    // Reset the active status of this tracks sample button so it
    // won't be highlighted on the next frame. This way the button
    // 'flashes'.
    this.sampleButton.isActive = false;
    
    // Display each sequencer button for this track.
    for (SequencerButton sb : sequencer)
    {
      sb.display();
    }
  }
  
  // Plays the sound associated with this track.
  void play()
  {
    this.sampleButton.play();
  }
  
  // Handle user interaction via the mouse.
  void handleClick()
  {
    // If the mouse pointer is hovering over this track's sample
    // button at the time of the click, play the sample and set
    // the sample button to active so it'll flash.
    if (this.sampleButton.mouseOver)
    {
      this.play();
    }
    // Otherwise check whether the mouse pointer is hovering over
    // any of this track's sequencer buttons.
    else
    { 
      for (SequencerButton b : this.sequencer)
      {
        if (b.mouseOver)
        {
          b.handleClick();
        }
      }
    }
  }
}