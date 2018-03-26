// The sample button class.
class SampleButton extends Button
{
  // A sample button has a label so the user knows what
  // sample this button will play.
  String label;
  // A sample button has a sample to play.
  SoundFile file;
  
  // Constructor: set up the sample button.
  SampleButton(int x, int y, int trackHeight, String label, SoundFile file)
  {
    // Call the button constructor. 
    super(x, y, 90, trackHeight - 5, color(100));
    // Set the label...
    this.label = label;
    // ... and the sound file.
    this.file = file;
  }
  
  // Displays the sample button.
  void display()
  {
    // Call the superclass display method to check whether the
    // mouse pointer is hovering over the sample button.
    super.display();
    
    // If the sample is playing (because the user clicked on the
    // sample button), make the button flash white.
    if (this.isActive)
    {
      this.c = color(255);
    }
    // If the mouse pointer is hovering over the sample button
    // highlight the button.
    else if (this.mouseOver)
    {
      this.c = color(130);
    }
    // Else set the sample button to its default colour.
    else
    {
      this.c = color(100);
    }
    
    // Draw the sample button.
    fill(this.c);
    rect(this.x, this.y, this.w, this.h, this.cornerRadius);
    
    // Draw the label.
    fill(240);
    text(this.label, this.x + 5, this.y + 15);
  }
  
  // Plays the sound associated with this sample button.
  void play()
  {
    this.file.play(); 
  }
  
  void stop()
  {
    this.file.stop();
  }
}