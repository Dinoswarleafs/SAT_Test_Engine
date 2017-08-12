class Question {
 // Created 6/16/2017
 // Snippets taken from :
 // 

 // To Do:
 // ---
 // Literally rework everything LOL
 // --- 
 
 
 // Starting Button Co-Ordinates (AKA location of first thing) = 
 
 // Default (without a prompt or image) :
 // (If you have 1 image setting on, the other will take this #) 
  
 float questionX   = 156;
 float questionY   = 100;
 
 float answerX     = 256;
 float answerY     = 200;
 
 // Prompt :
 
 float pQuestionX  = 720;
 float pQuestionY  = 75;
 
 float pAnswerX    = 740;
 float pAnswerY    = 200;
 
 // Both Question & Answer Images :
 
 float bIQuestionX = 50;
 float bIQuestionY = 75;
 
 float bIAnswerX1  = 100;
 float bIAnswerX2  = 740;
 float bIAnswerY   = 380; 
 
 // Question Image Only :
 
 float qIQuestionX = 50;
 float qIQuestionY = 50;
 
 // Answer Image Only :
 
 float aIAnswerX   = 100;
 float aIAnswerX2  = 740;
 float aIAnswerY   = 380;
 
// Distance between answers

 // Default :
 
 float aDSpread   = 100;
 
 // Prompt :
 
 float aPSpread   = 100;
 
 // Both Images :
 
 float aBSpread   = 180;
 
 // Question Images :
 
 float aQSpread   = 100;
 
 // Answer Images :
 
 float aASpread   = 100;
 
 // Default 
  
 // Prompt
  
 // Image Answers
 
 

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
 PVector qPos;
 PVector[] aPos, pPos;
 PVector[] qISize, aTSize, qTSize;
 float aSpread;



 Question(String question_, String answers_[]) {
  aFont = createFont("Arial", 24);
  buttons = new CircleButton[5];
  answers = new String[4];
  question = question_;
  arrayCopy(answers_, answers);
  aPos = new PVector[2];
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
  imageQuestion = false;
  imageAnswer = false;
  aPos = new PVector[2];
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
  aPos = new PVector[2];
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
  aPos = new PVector[2];
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
  aPos = new PVector[2];
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
  aPos = new PVector[2];
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
  aPos = new PVector[2];
  Table promptTable = loadTable("testing/test_questions/prompts/" + testName + ".csv", "header");
  TableRow tempRow = promptTable.getRow(promptNum);
  prompt = tempRow.getString(0);
  formatQuestions();
 }

 void formatQuestions() {
  if (promptNum != 0) {
    qPos = new PVector(pQuestionX, pQuestionY);
    aPos[0] = new PVector(pAnswerX, pAnswerY);
    aSpread = aPSpread; 
  } else {
   if (imageQuestion && imageAnswer) {
    qPos = new PVector(bIQuestionX, bIQuestionY);
    aPos[0] = new PVector(bIAnswerX1, bIAnswerY);
    aPos[1] = new PVector(bIAnswerX2, bIAnswerY); 
    aSpread = aBSpread;
    images[0] = loadImage("/testing/test_questions/test_images/" + testName + "/IMG" + qIndex + ".png");
    for (int i = 1; i < images.length; i++)
     images[i] = loadImage("/testing/test_questions/test_images/" + testName + "/IMG" + qIndex + str(i) + ".png");
   } else if (imageQuestion) {
    qPos = new PVector(qIQuestionX, qIQuestionY);
    aPos[0] = new PVector(answerX, answerY);
    aSpread = aQSpread;
    images[0] = loadImage("/testing/test_questions/test_images/" + testName + "/IMG" + qIndex + ".png");
   } else if (imageAnswer) {
    qPos = new PVector(questionX, questionY);
    aPos[0] = new PVector(aIAnswerX, aIAnswerY);
    aPos[1] = new PVector(aIAnswerX2, aIAnswerY);   
    aSpread = aASpread;
    for (int i = 1; i < images.length; i++)
     images[i] = loadImage("/testing/test_questions/test_images/" + testName + "/IMG" + qIndex + str(i) + ".png");
    }
    else {
     qPos = new PVector(questionX, questionY);
     aPos[0] = new PVector(answerX, answerY);
     aSpread = 100;
    }
  }  
  buttons[0] = new CircleButton(qPos.x, qPos.y, 50, 135, false);
  if (!imageAnswer)
   for (int i = 1; i < buttons.length; i++)
    buttons[i] = new CircleButton(aPos[0].x, aPos[0].y + aSpread * i, 50, 135); 
  else {
    for (int i = 1; i < (buttons.length / 2) + 1; i++)
     buttons[i] = new CircleButton(aPos[0].x, aPos[0].y + aSpread * (i - 1), 50, 135);
    for (int i = (buttons.length / 2) + 1; i < buttons.length; i++)
     buttons[i] = new CircleButton(aPos[1].x, aPos[1].y + aSpread * (i - 3), 50, 135);    
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