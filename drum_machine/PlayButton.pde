// The play button class.
class PlayButton extends Button
{
  // A field to hold the colour of the play arrow icon.
  color controlColor;
  
  // Constructor: set up the play button.
  PlayButton(float x, float y)
  {
    // Call the superclass (Button) constructor
    super(x, y, 50, 50, color(200));
  }
  
  // Displays the play button.
  void display()
  {
    // Call the Button display method, which checks whether
    // the mouse pointer is hovering over this play button.
    super.display();
    
    // Draw the play button.
    fill(this.c);
    rect(this.x, this.y, this.w, this.h, this.cornerRadius);
    
    // Draw the play arrow icon!
    fill(this.controlColor);
    triangle(this.x + 10, this.y + 10, 
             this.x + this.w - 10, this.y + (this.h / 2), 
             this.x + 10, this.h + this.y - 10);
  }
  
  // Sets the colour of the play arrow so that it looks
  // ready to be clicked.
  void enable()
  {
    this.controlColor = color(0, 255, 0);
  }
  
  // Sets the colour of the play arrow so that it looks
  // uninviting.
  void disable()
  {
    this.controlColor = color(0, 75, 0);
  }
}