// The stop button class.
class StopButton extends Button
{
  // A field to hold the colour of the stop square icon.
  color controlColor;
  
  // Constructor: set up the stop button.
  StopButton(float x, float y)
  {
    super(x, y, 50, 50, color(200));
  }
  
  // Displays the stop button.
  void display()
  {
    // Call the Button display method, which checks whether
    // the mouse pointer is hovering over this play button.
    super.display();
    
    // Draw the stop button
    fill(this.c);
    rect(this.x, this.y, this.w, this.h, this.cornerRadius);
    
    // Draw the stop square icon.
    fill(this.controlColor);
    rect(this.x + 10, this.y + 10, this.w - 20, this.h - 20);
  }
  
  // Sets the colour of the stop square so that it looks
  // ready to be clicked.
  void enable()
  {
    this.controlColor = color(255, 0, 0);
  }
  
  // Sets the colour of the stop square so that it looks
  // uninviting.
  void disable()
  {
    this.controlColor = color(100, 0, 0);
  }
}