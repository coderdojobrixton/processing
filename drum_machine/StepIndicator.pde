// The sequencer step indicator class.
class StepIndicator extends Button
{  
  // Constructor: set up the step indicator.
  StepIndicator(float x, float y, float w, float h, color c)
  {
    // Call the button constructor.
    super(x, y, w, h, c);
    // Set inactive by default.
    isActive = false;
  }
  
  // Draws the step indicator.
  void display()
  {
    // If this is the active step, set a highlight colour.
    if (this.isActive)
    {
      this.c = color(0, 180, 255);
    }
    else
    {
      this.c = color(50);
    }
    
    // Draw the step indicator.
    fill(this.c);
    // To make sure the indicator is circular, use 
    // height (h) for both width and height of the ellipse.
    ellipse(this.x + (this.w / 2) + (this.w / 16), this.y, this.h / 4, this.h / 4);
  }
}