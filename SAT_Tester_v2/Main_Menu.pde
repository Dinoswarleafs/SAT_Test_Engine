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
  Timer timer;
  RectButton timerButton, sectionButton;
  
  Main_Menu() {
   folder = dataFile("/testing/test_questions/");
   mFont = createFont("Arial", 150);
   bFont = createFont("Arial", 32);
   startButton = new RectButton(width/2 - 100, height * 3 / 4, 200, 50, 135, true, false); 
   testAmount = countFiles();
   testButton = new RectButton[testAmount];
   QM = new Question_Manager();
   timer = new Timer(25, 0);
   timerButton = new RectButton(width - 100, 0, 100, 50, color(125, 40), true, false);
   sectionButton = new RectButton(width/2 - 50, height/2 + 100, 100, 50, color(125), true, false);
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
    case 2:
     textSize(40);
     textAlign(CENTER);
     fill(255);
     text("Part 1 : Reading", width/2, height/4);
     textSize(20);
     text("You'll have 65 minutes to finish and then you'll get a break. (Don't say I didn't do you any favors)", width/2, height/4 + 50);
     text("The timer is to help you pace, it won't do anything once it hits zero.", width/2, height/4 + 75);
     text("If you have to go do something you can click on the timer to pause it.", width/2, height/4 + 100);
     text("Don't pause it just because you're falling behind. You're cheating yourself -.-", width/2, height/4 + 125);
     text("Click the button when you're ready to start.", width/2, height/4 + 175);
     sectionButton.display();
     break;
    case 3 : 
    case 5 :
    case 7 :
    case 9 :
     QM.display();
     timer.display();
     timerButton.display();
     break;
    case 4 :
     textSize(40);
     textAlign(CENTER);
     fill(255);
     text("Part 2 : Writing", width/2, height/4);
     textSize(20);
     text("If you were taking the test for real you'd get a 10 minute break right now", width/2, height/4 + 50);
     text("You can have as long a break as you want since I'm nice ^_^", width/2, height/4 + 75);
     text("(Also since I'm too lazy to program it in. I could but I don't want to)", width/2, height/4 + 100);
     text("I want to program as well as Ryuunosuke ... but I don't like to eat tomatoes raw :/", width/2, height/4 + 125);
     text("(Oh and I'm not a genius like him :|)", width/2, height/4 + 150);
     sectionButton.display();    
     break;
   case 6 :
     textSize(40);
     textAlign(CENTER);
     fill(255);
     text("Part 3 : Math - No Calculator", width/2, height/4);
     textSize(20);
     text("In the real SAT you'd get no break right now LOL", width/2, height/4 + 50);
     text("Now I could easily send you to the next part right now, but I'm nice so here's another break", width/2, height/4 + 75);
     text("Now for the math I have what would be free response as multiple choice.", width/2, height/4 + 100);
     text("Don't blame me ok ... it's pretty difficult in Processing and I'd have to make sure you couldn't break anything.", width/2, height/4 + 125);
     text("And BOY would you be angry if the program crashed so better safe than sorry. Now go.", width/2, height/4 + 150);
     sectionButton.display(); 
     break;
   case 8 :
     textSize(40);
     textAlign(CENTER);
     fill(255);
     text("Part 4 : Math - Calculator", width/2, height/4);
     textSize(20);
     text("The final break would be 5 minutes", width/2, height/4 + 50);
     text("Good job on not crashing the program so far. Actually if I were you I wouldn't even be reading this", width/2, height/4 + 75);
     text("But maybe you are because it amuses you. Don't worry these same lines are for every test.", width/2, height/4 + 100);
     text("It will get stale after your second test probably ... Maybe I should make a chance for a SUPER RARE line?", width/2, height/4 + 125);
     text("... That sounds kinda fun. I'll do that later. ANYWAY, hope you did well. All the info will be after this part", width/2, height/4 + 150);
     sectionButton.display(); 
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
   case 4 :
   case 6 :
   case 8 :
    sectionButton.update();
    if (sectionButton.clickedButton()) {
     currentScreen++;
     delay(100);
    }    
    timer.reset();
    break;
   case 3 :
    if (QM.lastR < QM.currentQuestion)
      currentScreen++;
   case 5 :
    if (QM.lastW < QM.currentQuestion)
     currentScreen++;
   case 7 : 
    if (QM.lastM < QM.currentQuestion)
     currentScreen++;
   case 9 : 
    if (QM.lastMC < QM.currentQuestion)
     currentScreen++;  
    if (currentScreen == 5 && timer.endTime != 2100) {
     timer.setEnd(35,0);
    }
    else if (currentScreen == 7 && timer.endTime != 1500)
     timer.setEnd(25,0);
    else if (currentScreen == 9 && timer.endTime != 3300)
     timer.setEnd(55, 0);
    QM.update();
    timer.update();
    if (!timer.isActive)
     timer.activate();
    timerButton.update();
    if (timerButton.clickedButton()) {
     if(!timer.isPaused)
      timer.pause();
     else timer.unpause();
     delay(100);
    }
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