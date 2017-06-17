QuestionManager testManager;

void setup() {
  size(1280, 720);
  testManager = new QuestionManager();
}

void draw() {
 background(0); 
 testManager.update();
 testManager.display();
}