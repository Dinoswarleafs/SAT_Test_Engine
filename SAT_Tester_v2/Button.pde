abstract class Button {
 // Created 6/16/2017
 // Snippets taken from :
 // http://processingjs.org/learning/topic/buttons/
 // https://processing.org/examples/button.html

 // To Do:
 // ---
 /// Nothing RN
 // ---

 // Location :
 // CircleButton = Center coordinates
 // Rectbutton = Top left coordinates
 // Size = Length & width of button

 // nColor = Normal color of button in a resting state
 // hColor = Highlighted color of button

 // isOver = If the mouse is over
 // isSelected = If the button is selected
 // isSelectable = If the button changes color when moused over

 PVector location, size;
 color nColor, hColor;
 boolean isSelected, isSelectable;



 Button(float locX_, float locY_, float sizeX_, float sizeY_, color nColor_) {
  location = new PVector(locX_, locY_);
  size = new PVector(sizeX_, sizeY_);
  nColor = nColor_;
  hColor = nColor + 100;
  isSelectable = true;
 }

 Button(float locX_, float locY_, float sizeX_, float sizeY_, color nColor_, boolean isSelectable_) {
  location = new PVector(locX_, locY_);
  size = new PVector(sizeX_, sizeY_);
  nColor = nColor_;
  hColor = nColor + 100;
  isSelectable = isSelectable_;
 }
}

class CircleButton extends Button {

 PFont bFont;
 String bText;
 boolean isClickable;

 CircleButton(float locX_, float locY_, float diameter_, color nColor_) {
  super(locX_, locY_, diameter_, diameter_, nColor_);
  bFont = createFont("Arial", 24);
 }

 CircleButton(float locX_, float locY_, float diameter_, color nColor_, boolean isSelectable_) {
  super(locX_, locY_, diameter_, diameter_, nColor_, isSelectable_);
  bFont = createFont("Arial", 24);
 }


 // If the button is selectable (able to be highlighted), see if the mouse is over the button and store it in isOver
 void update() {
  if (!mousePressed)
   isClickable = true;
  if (isSelectable) 
   if (clickedButton() && isClickable)
    isSelected = true;
  if (mousePressed)
   isClickable = false;
 }

 // If the mouse is neither over the button, or if the button isn't selected, fill it as the normal color
 // If either is true fill it with the highlighted color  
 void display() {
  if (!(overButton() || isSelected))
   fill(nColor);
  else fill(hColor);
  ellipse(location.x, location.y, size.x, size.y);
  if (bText != null) {
   textAlign(CENTER);
   textFont(bFont);
   fill(0);
   if (int(bText) < 10)
    text(bText, location.x + 1, location.y + 7);
   else text(bText, location.x, location.y + 7);
  }
 }

 boolean overButton() {
  // Checks if the mouse is within the circle
  // If the line from the center of the circle to the mouse is less than the radius of the circle, return true
  float disX = location.x - mouseX;
  float disY = location.y - mouseY;
  return (sqrt(sq(disX) + sq(disY))) < size.x / 2;
 }

 // If the mouse is down while over the circle, return true
 boolean clickedButton() {
  return overButton() && mousePressed;
 }

 void setText(String text_) {
  bText = text_;
 }
}

class RectButton extends Button {

 // isHoldable :
 // After being pressed, if it's false will return to the normal color
 boolean isHoldable, isClickable;

 RectButton(float locX_, float locY_, float sizeX, float sizeY, color nColor_) {
  super(locX_, locY_, sizeX, sizeY, nColor_);
  isHoldable = true;
 }

 RectButton(float locX_, float locY_, float sizeX, float sizeY, color nColor_, boolean isSelectable_, boolean isHeld_) {
  super(locX_, locY_, sizeX, sizeY, nColor_, isSelectable_);
  isHoldable = isHeld_;
 }


 // If isHoldable is false, make it so the button doesn't stay highlighted after being clicked
 void update() {
  if (!mousePressed)
   isClickable = true;
  if (!isHoldable)
   isSelected = false;
  if (isSelectable) 
   if (clickedButton() && isClickable)
    isSelected = true;
  if (mousePressed)
   isClickable = false;
 }

 void display() {
  if (!(overButton() || isSelected))
   fill(nColor);
  else fill(hColor);
  rect(location.x, location.y, size.x, size.y);
 }

 boolean overButton() {
  return (mouseX >= location.x && mouseX <= location.x + size.x &&
   mouseY >= location.y && mouseY <= location.y + size.y);
 }

 boolean clickedButton() {
  return overButton() && mousePressed;
 }
}

class ScrollBar extends Button {
  
  boolean isActivated, isVertical;
  float mouseOffset, initialPos, previousPos, maxPos, startValue, endValue;
  
 ScrollBar(float locX_, float locY_, float sizeX, float sizeY, float startValue_, float endValue_, color nColor_, boolean isVertical_) {
  super(locX_, locY_, sizeX, sizeY, nColor_); 
  startValue = startValue_;
  endValue = endValue_;
  isVertical = isVertical_;
  if (isVertical) {
   initialPos = location.y;
   maxPos = height - (initialPos + size.y); 
  } else {
   initialPos = location.x;
   maxPos = width - (initialPos + size.x);
  }
 }
 
 void update() {
  if (clickedButton() && !isActivated) {
   isActivated = true;
   if (isVertical)
    mouseOffset = mouseY - location.y;
   else mouseOffset = mouseX - location.x;
  }
  if (isVertical)
   previousPos = location.y;
  else previousPos = location.x;
  if (isActivated && mousePressed)
   if (isVertical)
    location.y = lerp(location.y, mouseY - mouseOffset, .5);
   else location.x = lerp(location.x, mouseX - mouseOffset, .5);
  else isActivated = false;
  if (isVertical)
   location.y = constrain(location.y, initialPos, maxPos);
  else location.x = constrain(location.x, initialPos, maxPos);
 }
 
 void display() {
  if (!(overButton() || isActivated))
   fill(nColor);
  else fill(hColor); 
  rect(location.x, location.y, size.x, size.y);
 }
 
 float getScrollValue() {
  float scrollValue;
  if (isVertical)
   scrollValue = map(location.y, initialPos, maxPos, startValue, endValue); 
  else scrollValue = map(location.x, initialPos, maxPos, startValue, endValue); 
  return scrollValue;
 }
 
 void setLocationY(float scrollValue) {
  float locationPos;
  if (isVertical) {
   locationPos = map(-scrollValue, startValue, endValue, initialPos, maxPos);
   location = new PVector(location.x, locationPos);
  } else {
   locationPos = map(-scrollValue, startValue, endValue, initialPos, maxPos);
   location = new PVector(locationPos, location.y);    
  }
 }
 
 boolean overButton() {
   return (mouseX >= location.x && mouseX <= location.x + size.x &&
           mouseY >= location.y && mouseY <= location.y + size.y);
 }
 
 boolean clickedButton() {
   return overButton() && mousePressed; 
 }
 
 boolean wasMoved() {
  if (isVertical)
   return location.y != previousPos; 
  else return location.x != previousPos;
 }
  
}