class Question {
 // Created 6/16/2017
 // Snippets taken from :
 // 

 // To Do:
 // ---
 // Literally rework everything LOL
 // --- 

 int selectedAnswer;
 PFont aFont, qFont;
 CircleButton[] buttons;
 String question;
 String[] answers;
 String type;
 boolean imageQuestion, imageAnswer;
 PImage[] images;
 int qIndex;
 String testName;
 int promptNum = 0;
 String prompt;


 Question(String question_, String answers_[]) {
  aFont = createFont("Arial", 24);
  buttons = new CircleButton[5];
  answers = new String[4];
  question = question_;
  arrayCopy(answers_, answers);
  buttons[0] = new CircleButton(156, 100, 50, 135, false);
  for (int i = 1; i < buttons.length; i++) {
   buttons[i] = new CircleButton(256, 200 + 100 * i, 50, 135);
  }
 }

 Question(String question_, String ans1, String ans2, String ans3, String ans4) {
  aFont = createFont("Arial", 24);
  buttons = new CircleButton[5];
  answers = new String[4];
  question = question_;
  answers = new String[] {
   ans1,
   ans2,
   ans3,
   ans4
  };
  buttons[0] = new CircleButton(156, 100, 50, 135, false);
  for (int i = 1; i < buttons.length; i++)
   buttons[i] = new CircleButton(256, 200 + 100 * i, 50, 135);
  imageQuestion = false;
  imageAnswer = false;
 }

 Question(String type_, String question_, int ans1, int ans2, int ans3, int ans4) {
  type = type_;
  aFont = createFont("Arial", 24);
  buttons = new CircleButton[5];
  answers = new String[4];
  question = question_;
  answers = new String[] {
   str(ans1), str(ans2), str(ans3), str(ans4)
  };
  buttons[0] = new CircleButton(156, 100, 50, 135, false);
  for (int i = 1; i < buttons.length; i++)
   buttons[i] = new CircleButton(256, 200 + 100 * i, 50, 135);
  imageQuestion = false;
  imageAnswer = false;
 }

 Question(String type_, String question_, String ans1, String ans2, String ans3, String ans4) {
  type = type_;
  aFont = createFont("Arial", 24);
  buttons = new CircleButton[5];
  answers = new String[4];
  question = question_;
  answers = new String[] {
   ans1,
   ans2,
   ans3,
   ans4
  };
  buttons[0] = new CircleButton(156, 100, 50, 135, false);
  for (int i = 1; i < buttons.length; i++)
   buttons[i] = new CircleButton(256, 200 + 100 * i, 50, 135);
  imageQuestion = false;
  imageAnswer = false;
 }

 Question(String type_, String question_, int ans1, int ans2, int ans3, int ans4, boolean imageQuestion_, boolean imageAnswer_, int qIndex_, String testName_) {
  type = type_;
  aFont = createFont("Arial", 24);
  buttons = new CircleButton[5];
  answers = new String[4];
  question = question_;
  testName = testName_;
  qIndex = qIndex_;
  answers = new String[] {
   str(ans1), str(ans2), str(ans3), str(ans4)
  };
  buttons[0] = new CircleButton(156, 100, 50, 135, false);
  for (int i = 1; i < buttons.length; i++)
   buttons[i] = new CircleButton(256, 200 + 100 * i, 50, 135);
  images = new PImage[5];
  imageQuestion = imageQuestion_;
  imageAnswer = imageAnswer_;
  formatQuestions();
 }

 Question(String type_, String question_, String ans1, String ans2, String ans3, String ans4, boolean imageQuestion_, boolean imageAnswer_, int qIndex_, String testName_) {
  type = type_;
  aFont = createFont("Arial", 24);
  buttons = new CircleButton[5];
  answers = new String[4];
  question = question_;
  qIndex = qIndex_;
  testName = testName_;
  answers = new String[] {
   ans1,
   ans2,
   ans3,
   ans4
  };
  buttons[0] = new CircleButton(156, 100, 50, 135, false);
  for (int i = 1; i < buttons.length; i++)
   buttons[i] = new CircleButton(256, 200 + 100 * i, 50, 135);
  images = new PImage[5];
  imageQuestion = imageQuestion_;
  imageAnswer = imageAnswer_;
  formatQuestions();
 }

 Question(String type_, String question_, String ans1, String ans2, String ans3, String ans4, int promptNum_, int qIndex_, String testName_) {
  type = type_;
  aFont = createFont("Arial", 24);
  buttons = new CircleButton[5];
  answers = new String[4];
  question = question_;
  qIndex = qIndex_;
  testName = testName_;
  promptNum = promptNum_;
  answers = new String[] {
   ans1,
   ans2,
   ans3,
   ans4
  };
  Table promptTable = loadTable("testing/test_questions/prompts/" + testName + ".csv", "header");
  TableRow tempRow = promptTable.getRow(promptNum);
  prompt = tempRow.getString(0);
  println(prompt);
  buttons[0] = new CircleButton(156, 100, 50, 135, false);
  for (int i = 1; i < buttons.length; i++)
   buttons[i] = new CircleButton(256, 200 + 100 * i, 50, 135);
  formatQuestions();
 }

 void formatQuestions() {
  if (promptNum != 0) {
    buttons[0] = new CircleButton(720, 75, 50, 135, false);
    for (int i = 1; i < buttons.length; i++)
     buttons[i] = new CircleButton(740, 200 + 100 * i, 50, 135);    
  } else {
   if (imageQuestion && imageAnswer) {
    buttons[0] = new CircleButton(50, 75, 50, 135, false);
    for (int i = 1; i < (buttons.length / 2) + 1; i++)
     buttons[i] = new CircleButton(100, 380 + 180 * (i - 1), 50, 135);
    for (int i = (buttons.length / 2) + 1; i < buttons.length; i++)
     buttons[i] = new CircleButton(740, 380 + 180 * (i - 3), 50, 135);
    images[0] = loadImage("/testing/test_questions/test_images/" + testName + "/IMG" + qIndex + ".png");
    for (int i = 1; i < images.length; i++)
     images[i] = loadImage("/testing/test_questions/test_images/" + testName + "/IMG" + qIndex + str(i) + ".png");
   } else if (imageQuestion) {
    buttons[0] = new CircleButton(50, 50, 50, 135, false);
    images[0] = loadImage("/testing/test_questions/test_images/" + testName + "/IMG" + qIndex + ".png");
   } else if (imageAnswer) {
    for (int i = 1; i < (buttons.length / 2) + 1; i++)
     buttons[i] = new CircleButton(100, 380 + 180 * (i - 1), 50, 135);
    for (int i = (buttons.length / 2) + 1; i < buttons.length; i++)
     buttons[i] = new CircleButton(740, 380 + 180 * (i - 3), 50, 135);
    for (int i = 1; i < images.length; i++) {
     images[i] = loadImage("/testing/test_questions/test_images/" + testName + "/IMG" + qIndex + str(i) + ".png");
    }
   }
  }
 }

 void formatDisplay() {
  if (promptNum != 0) {
    text(question, 770, 60, 480, 165);
  for (int i = 0; i < answers.length; i++) {
   float yPosition = 200 + 100 * (i + 1);
   text(answers[i], 790, yPosition - 10, 460, yPosition + 50);
  }
  text(prompt, 30, 75, 660, 570);    
  }
  else {
  if (imageQuestion && imageAnswer) {
   text(question, 90, 50, 460, 310);
   image(images[0], 690, 50, 500, 250);
   for (int i = 1; i < (buttons.length / 2) + 1; i++)
    image(images[i], 150, 380 + 180 * (i - 1) - 75, 150, 150);
   for (int i = (buttons.length / 2) + 1; i < buttons.length; i++)
    image(images[i], 790, 380 + 180 * (i - 3) - 75, 150, 150);
  } else if (imageQuestion) {
   text(question, 90, 50, 460, 310);
   image(images[0], 400, 50, 1190, 360);
   for (int i = 0; i < answers.length; i++) {
    float yPosition = 280 + 100 * i;
    text(answers[i], 300, yPosition, 950, yPosition + 50);
   }
  } else if (imageAnswer) {
   text(question, 200, 85, 900, 165);
   for (int i = 1; i < (buttons.length / 2) + 1; i++)
    image(images[i], 150, 380 + 180 * (i - 1) - 75, 150, 150);
   for (int i = (buttons.length / 2) + 1; i < buttons.length; i++)
    image(images[i], 790, 380 + 180 * (i - 3) - 75, 150, 150);
   } else text(question, 200, 85, 900, 165);
  }
 }


 void display() {
  for (int i = 0; i < buttons.length; i++)
   buttons[i].display();
  // Text Attributes
  textFont(aFont);
  textAlign(LEFT);
  fill(255);
  // Drawing text FIX ALLIGNMENT
  if (promptNum == 0)
  for (int i = 0; i < answers.length; i++) {
   float yPosition = 280 + 100 * i;
   text(answers[i], 300, yPosition, 1250, yPosition);
  }
  formatDisplay();
 }

 int update() {
  for (int i = 0; i < buttons.length; i++) {
   buttons[i].update();
   if (buttons[i].isSelected && selectedAnswer != i) {
    // If a new button is selected, make it the selected answer and deselect all other buttons
    selectedAnswer = i;
    for (int j = 0; j < buttons.length; j++)
     if (j != i)
      buttons[j].isSelected = false;
    return i;
   }
  }
  return -1;
 }
}