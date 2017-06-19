Main_Menu main;

void setup() {
  size(1280, 720);
  main = new Main_Menu();
}

void draw() {
 background(0); 
 main.display();
 main.update();
}