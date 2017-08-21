class Timer {
 boolean isActive, isStarted, isPaused;
 int startTime, currentTime, timeLeft, endTime, timePaused;
 int minutes, seconds;

 Timer(int minutes_, int seconds_) {
  endTime = minutes_ * 60000 + seconds_ * 1000;
  isStarted = false;
  isActive = false;
  isPaused = false;
 }

 Timer() {
  isStarted = false;
  isActive = false;
  isPaused = false;
 }

 void update() {
  if (isStarted) {
   isActive = true;
   startTime = millis();
   isStarted = false;
  }
  if (isActive && !isPaused) {
   currentTime = millis();
   timeLeft = (startTime + endTime) - currentTime;
   minutes = (timeLeft / 1000) / 60;
   seconds = (timeLeft / 1000) % 60;
  }
 }

 void display() {
  fill(125);
  rect(width - 100, 0, 100, 50);
  fill(0);
  textAlign(CENTER);
  textSize(20);
  text(minutes + " : " + seconds, width - 50, 30);
 }

 void activate() {
  isStarted = true;
 }

 void pause() {
  isPaused = true;
 }

 void unpause() {
  isPaused = false;
  timePaused = millis() - currentTime;
  endTime += timePaused;
 }

 void reset() {
  isActive = false;
  isStarted = false;
 }

 void setEnd(int minutes_, int seconds_) {
  endTime = minutes_ * 60000 + seconds_ * 1000;
 }

}