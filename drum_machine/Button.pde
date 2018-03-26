// The drum machine contains many buttons.
// This is the button base class that describes functionality
// that is common to all buttons.
// We never create an instance of this class. 
abstract class Button
{
  // Some fields to describe the appearance of the button.
  final int cornerRadius = 8;
  int x;
  int y;
  int w;
  int h;
  color c;
  
  // A flag to determine whether the mouse pointer is
  // hovering over this button.
  boolean mouseOver;
  
  // A flag to determine whether this button is active.
  // This can be used to specify whether a click on the
  // button will have any effect.
  boolean isActive;
  
  // Constructor: set up the button.
  Button(int x, int y, int w, int h, color c)
  {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    this.c = c;
    this.isActive = false;
    this.mouseOver = false;
  }
  
  // Displays the button.
  // This shoulde be called every frame. As this is a base class,
  // this method just checks whether the mouse pointer is hovering
  // over the button.
  void display()
  {
    this.isMouseOver();
  }
  
  // Checks whether the mouse pointer is hovering over the 
  // button by comparing the mouse co-ordinates with the
  // dimensions of the button.
  void isMouseOver()
  {
    if (mouseX >= this.x && mouseX <= this.x+this.w && 
      mouseY >= this.y && mouseY <= this.y+this.h) {
      this.mouseOver = true;
    } else {
      this.mouseOver = false;
    }
  }
}