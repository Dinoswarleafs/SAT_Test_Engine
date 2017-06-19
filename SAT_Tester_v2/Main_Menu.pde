class Main_Menu {
  // Created 6/18/2017
  // Snippets taken from :
  // 
  // 
  
  // To Do:
  // ---
  // Fix the algorithim to work for both odds and non powers of 2 > 8 
  // ---
  
 
  RectButton startButton;
  RectButton[] testButton; 
  File folder;
  PFont mFont, bFont;
  int currentScreen, testAmount;
  Question_Manager QM;
  
  Main_Menu() {
   folder = dataFile("/testing/test_questions/");
   mFont = createFont("Arial", 150);
   bFont = createFont("Arial", 32);
   startButton = new RectButton(width/2 - 100, height * 3 / 4, 200, 50, 135, true, false); 
   testAmount = countFiles();
   testButton = new RectButton[testAmount];
   QM = new Question_Manager();
   float sectionLength = width / (float) (testAmount / 2); 
   float buttonSpace = (float) 1/8 * sectionLength;
   if (testAmount % 2 == 0) {
    for (int i = 0; i < testAmount / 2; i++)
     testButton[i] = new RectButton(i * sectionLength + buttonSpace, buttonSpace, 
                                    sectionLength * 3/4, sectionLength * 3/4, 135, true, false);
   }
    for (int i = testAmount / 2; i < testAmount; i++) {
     testButton[i] = new RectButton((i - testAmount/2)  * sectionLength + buttonSpace, buttonSpace + height / 2,
                                     sectionLength * 3/4, sectionLength * 3/4, 135, true, false); 
    }
  }
  
  void display() {
   switch (currentScreen) {
    case 0 :
     startButton.display();
     textAlign(CENTER);
     textFont(mFont);
     fill(171, 169, 195);
     text("SAT Tester", width/2, height * .25);
     break;
    case 1 :
     textAlign(CENTER);
     textFont(bFont);
    for (int i = 0; i < testButton.length; i++) {
     testButton[i].display();
     if (testButton[i].isOver) fill(101, 209, 205);
     else fill(131, 239, 235);
     text("SAT " + (i + 1), testButton[i].location.x + (float) (testButton[i].size.x / 2), 
                      testButton[i].location.y + (float) (testButton[i].size.y / 2));
    }
     break;
    case 2 : 
     QM.display();
     break;
   }
  }
  
  void update() {
   switch (currentScreen) {
    case 0 :
     startButton.update();
     if (startButton.isSelected) {
      currentScreen++;
      delay(100);
     }
     break;
   case 1 :
    for (int i = 0; i < testButton.length; i++) {
     testButton[i].update(); 
     if (testButton[i].isSelected) {
      currentScreen++;
      QM.loadQuestions("SAT_Test_" + (i+1));
      delay(100);
      }
     }
    break;
   case 2 : 
    QM.update();
    break;
    }
  }
  
  int countFiles() {
   String[] csvFiles;
   csvFiles = folder.list(FILTER);
   return csvFiles.length;
 } 
}




import java.io.FilenameFilter;

// https://forum.processing.org/two/discussion/8233/counting-the-files-in-a-folder
// I have no idea what's going on here but it works

static final FilenameFilter FILTER = new FilenameFilter() {
  static final String  EXT = ".csv";
 
  @ Override boolean accept(File path, String name) {
    return name.endsWith(EXT);
  }
};