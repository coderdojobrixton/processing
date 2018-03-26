// The sequencer button class.
class SequencerButton extends Button
{
  // Constructor: set up the sequencer button;
  SequencerButton(int x, int y, int w, int h, boolean isActive)
  {
    // Call the Button class constructor.
    super(x, y, w - 5, h - 5, color(50));
    // Set whether this button is active by default: it might
    // be depending on the default sequencer values (see the
    // DrumMachineProject file).
    this.isActive = isActive;
  }
  
  // Displays the sequencer button.
  void display()
  {
    // Call the superclass display method to check whether
    // the mouse pointer is hovering over the sequencer button.
    super.display();
    
    // Set the colour of the sequencer button depending on
    // its status.
    // Light yellow for active and mouse over.
    if (this.isActive && this.mouseOver)
    {
      this.c = color(255, 255, 150);
    }
    // Yellow for just active.
    else if (this.isActive)
    {
      this.c = color(255, 255, 0);
    }
    // Dark yellow for just mouse over.
    else if (this.mouseOver)
    {
      this.c = color(80, 80, 0);
    }
    // Dark grey otherwise.
    else
    {
      this.c = color(50);
    }
    
    // Draw the sequencer button.
    fill(this.c);
    rect(this.x, this.y, this.w, this.h, this.cornerRadius);
  }
  
  // Handles user interaction with the sequencer button via the mouse.
  void handleClick()
  {    
    // Toggle active status.
    // If this sequencer button is active, set it to inactive.
    // If it's inactive, set it to active!
    this.isActive = !this.isActive;
    
    // ^It could've been written like this:
    //if (!this.isActive)
    //{
    //  this.isActive = true;
    //}
    //else
    //{
    //  this.isActive = false;
    //}
    // But one-liners are cool ;)
  }
}