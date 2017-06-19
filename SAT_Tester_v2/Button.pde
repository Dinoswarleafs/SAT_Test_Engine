abstract class Button {
  // Created 6/16/2017
  // Snippets taken from :
  // http://processingjs.org/learning/topic/buttons/
  // https://processing.org/examples/button.html
  
  // To Do:
  // ---
  /// Nothing RN
  // ---
 
  String text;
  PVector location, size;
  color nColor, hColor; // nColor is the "normal" color, hColor is the highlighted color
  boolean isOver, isSelected, isSelectable;
  
  Button(String nText, float locX_, float locY_, float sizeX_, float sizeY_, color nColor_) {
    text = nText;
    location = new PVector(locX_, locY_);
    size     = new PVector(sizeX_, sizeY_);
    nColor   = nColor_; 
    hColor   = nColor + 100;
    isSelectable = true;
  }
  
  Button(String nText, float locX_, float locY_, float sizeX_, float sizeY_, color nColor_, boolean isSelectable_) {
    text = nText;
    location = new PVector(locX_, locY_);
    size     = new PVector(sizeX_, sizeY_);
    nColor   = nColor_; 
    hColor   = nColor + 100;
    isSelectable = isSelectable_;
  }
}

class CircleButton extends Button {
 
 CircleButton(String nText, float locX_, float locY_, float diameter_, color nColor_) {
  super(nText, locX_, locY_, diameter_, diameter_, nColor_); 
 }
 
 CircleButton(String nText, float locX_, float locY_, float diameter_, color nColor_, boolean isSelectable_) {
  super(nText, locX_, locY_, diameter_, diameter_, nColor_, isSelectable_); 
 }
 
 void update() {
  if (isSelectable) { 
  isOver = overButton(); 
  if (clickedButton())
  isSelected = true;
  }
 }
  
 void display() {
  if (!(isOver || isSelected))
   fill(nColor);
  else fill(hColor); 
  ellipse(location.x, location.y, size.x, size.y);
  fill(0,0,0);
  textSize(24);
  textAlign(CENTER);
  text(text, location.x, location.y+(size.y/6));
 }
 
 boolean overButton() {
   // Checks if the mouse is within the circle
   float disX = location.x - mouseX; 
   float disY = location.y - mouseY; 
   return (sqrt(sq(disX) + sq(disY))) < size.x/2;
 }
 
 boolean clickedButton() {
   return isOver && mousePressed; 
 }
}

class RectButton extends Button {
  
 boolean isHoldable;
 
 RectButton(String nText, float locX_, float locY_, float sizeX, float sizeY, color nColor_) {
  super(nText, locX_, locY_, sizeX, sizeY, nColor_); 
  isHoldable = true;
 }
 
 RectButton(String nText, float locX_, float locY_, float sizeX, float sizeY, color nColor_, boolean isSelectable_, boolean isHeld_) {
  super(nText, locX_, locY_, sizeX, sizeY, nColor_, isSelectable_); 
  isHoldable = isHeld_;
 }
 
 void update() {
  if (!isHoldable)
  isSelected = false;
  if (isSelectable) { 
  isOver = overButton(); 
  if (clickedButton())
  isSelected = true;
  }
 }
  
 void display() {
  if (!(isOver || isSelected))
   fill(nColor);
  else fill(hColor); 
  rect(location.x, location.y, size.x, size.y);
  textAlign(CENTER);
  textSize(25+(.03*size.x));
  fill(0,0,0);
  text(text, location.x+(size.x/2), location.y+(size.y/2)+12);
  println(text);
 }
 
 boolean overButton() {
   return (mouseX >= location.x && mouseX <= location.x + size.x &&
           mouseY >= location.y && mouseY <= location.y + size.y);
 }
 
 boolean clickedButton() {
   return isOver && mousePressed; 
 }
}