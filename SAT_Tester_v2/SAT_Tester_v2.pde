Main_Menu main;

void setup() {
  size(1280, 720);
  main = new Main_Menu();
}

void draw() {
 background(0); 
 main.update();
 main.display();
}

void mouseWheel(MouseEvent event) {
 float e = -event.getCount();
 int scrollAmount = 50;
 main.QM.Questions.get(main.QM.currentQuestion).getScrollValue(e * scrollAmount);
}