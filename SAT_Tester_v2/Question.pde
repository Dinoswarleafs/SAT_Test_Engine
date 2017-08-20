class Question {
 // Created 6/16/2017
 // Snippets taken from :
 // 

 // To Do:
 // ---
 // Fix Constructor
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
 float pAnswerY    = 100;
 
 // Question Image :
 
 float qIQuestionX = 50;
 float qIQuestionY = 50;
 
 // Answer Image  :
 
 float aIAnswerX   = 100;
 float aIAnswerX2  = 740;
 float aIAnswerY   = 380;
 
// Distance from button to elements & element size
// (T = Text difference, I = Image Difference, Size = ... Size)

 // Default :
 
 float qTDiffX = 44;
 float qTDiffY = -15;
 float qTSizeX = 100;
 float qTSizeY = 165;
 
 float aTDiffX = 114;
 float aTDiffY = 280;
 float aTSizeX = 980;
 float aTSizeY = 100;
 
 
 // Prompt :
 
 float promptX = 15;
 float promptY = 50;
 float pSizeX = 660;
 float pSizeY = 650;
 
 float qPDiffX = 50;
 float qPDiffY = -15;
 float qPSizeX = 480;
 float qPSizeY = 165;
 
 float aPDiffX = 50;
 float aPDiffY = 53;
 float aPSizeX = 460;
 float aPSizeY = 150;
 
 // Question Image :
 
 float qQTDiffX = 40;
 float qQTDiffY = -25;
 float qQTSizeX = 460;
 float qQTSizeY = 310;
 
 float qQIDiffX = 610;
 float qQIDiffY = -25;
 float qQISizeX = 500;
 float qQISizeY = 250;
 
 // Answer Image :
 
 float aAIDiffX = 50;
 float aAIDiffX2 = 710;
 float aAIDiffY = -75;
 float aAISizeX = 150;
 float aAISizeY = 150;
 
 
// Distance between answers

 // Default :
 
 float aDSpread   = 100;
 
 // Prompt :
 
 float aPSpread   = 135;
 
 // Both Images :
 
 float aBSpread   = 180;
 
 // Question Images :
 
 float aQSpread   = 100;
 
 // Answer Images :
 
 float aASpread   = 180;
 
 // Default 
  
 // Prompt
  
 // Image Answers
 
 

 int selectedAnswer;
 PFont aFont;
 CircleButton[] buttons;
 ScrollBar scrollBar;
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
 PVector[] qIPos, qTPos, aTPos;
 PVector[] aIPos;
 float aSpread, aISpread, aTSpread;
 int scrollCount;
 PGraphics promptImage;
 

 Question(String type_, String question_, int ans1, int ans2, int ans3, int ans4, boolean imageQuestion_, boolean imageAnswer_, int qIndex_, String testName_) {
  type = type_;
  buttons = new CircleButton[5];
  answers = new String[4];
  question = question_;
  testName = testName_;
  qIndex = qIndex_;
  answers = new String[] {
   str(ans1), str(ans2), str(ans3), str(ans4)
  };
  aPos = new PVector[2];
  pPos = new PVector[2];
  qIPos = new PVector[2];
  qTPos = new PVector[2];
  aTPos = new PVector[2];
  aIPos = new PVector[2];
  images = new PImage[5];
  imageQuestion = imageQuestion_;
  imageAnswer = imageAnswer_;
  formatElements();
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
  pPos = new PVector[2];
  qIPos = new PVector[2];
  qTPos = new PVector[2];
  aTPos = new PVector[2];
  aIPos = new PVector[2];
  images = new PImage[5];
  imageQuestion = imageQuestion_;
  imageAnswer = imageAnswer_;
  formatElements();
 }

 Question(String type_, String question_, String ans1, String ans2, String ans3, String ans4, int promptNum_, int qIndex_, String testName_) {
  aFont = createFont("Georgia", 12);
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
  pPos = new PVector[2];
  qIPos = new PVector[2];
  qTPos = new PVector[2];
  aTPos = new PVector[2];
  aIPos = new PVector[2];
  Table promptTable = loadTable("testing/test_questions/prompts/" + testName + ".csv", "header");
  TableRow tempRow = promptTable.getRow(promptNum);
  prompt = tempRow.getString(0);
  formatElements();
 }

 void formatElements() {
  if (promptNum != 0) {
    qPos = new PVector(pQuestionX, pQuestionY);
    aPos[0] = new PVector(pAnswerX, pAnswerY);
    pPos[0] = new PVector(promptX, promptY);
    pPos[1] = new PVector(pSizeX, pSizeY); 
    qTPos[0] = new PVector(qPDiffX, qPDiffY);
    qTPos[1] = new PVector(qPSizeX, qPSizeY);
    aTPos[0] = new PVector(aPDiffX, aPDiffY);
    aTPos[1] = new PVector(aPSizeX, aPSizeY);
    aSpread = aPSpread;
  } else {
   if (imageQuestion && imageAnswer) {
    qPos = new PVector(qIQuestionX, qIQuestionY);
    aPos[0] = new PVector(aIAnswerX, aIAnswerY);
    aPos[1] = new PVector(aIAnswerX2, aIAnswerY); 
    qTPos[0] = new PVector(qQTDiffX, qQTDiffY);
    qTPos[1] = new PVector(qQTSizeX, qQTSizeY);
    qIPos[0] = new PVector(qQIDiffX, qQIDiffY);
    qIPos[1] = new PVector(qQISizeX, qQISizeY);
    aIPos[0] = new PVector(aAIDiffX, aAIDiffY);
    aIPos[1] = new PVector(aAISizeX, aAISizeY);
    aSpread = aBSpread;
    importImage(0);
    for (int i = 1; i < images.length; i++)
     importImage(i);
   } else if (imageQuestion) {
    qPos = new PVector(qIQuestionX, qIQuestionY);
    aPos[0] = new PVector(answerX, answerY);
    qTPos[0] = new PVector(qQTDiffX, qQTDiffY);
    qTPos[1] = new PVector(qQTSizeX, qQTSizeY);
    qIPos[0] = new PVector(qQIDiffX, qQIDiffY);
    qIPos[1] = new PVector(qQISizeX, qQISizeY);
    aTPos[0] = new PVector(aTDiffX, aTDiffY);
    aTPos[1] = new PVector(aTSizeX, aTSizeY);
    aSpread = aQSpread;
    importImage(0);
   } else if (imageAnswer) {
    qPos = new PVector(questionX, questionY);
    aPos[0] = new PVector(aIAnswerX, aIAnswerY);
    aPos[1] = new PVector(aIAnswerX2, aIAnswerY);   
    qTPos[0] = new PVector(qTDiffX, qTDiffY);
    qTPos[1] = new PVector(qTSizeX, qTSizeY);
    aIPos[0] = new PVector(aAIDiffX, aAIDiffY);
    aIPos[1] = new PVector(aAISizeX, aAISizeY);
    aSpread = aASpread;
    for (int i = 1; i < images.length; i++)
     importImage(i);
    }
    else {
     qPos = new PVector(questionX, questionY);
     aPos[0] = new PVector(answerX, answerY);
     qTPos[0] = new PVector(qTDiffX, qTDiffY);
     qTPos[1] = new PVector(qTSizeX, qTSizeY);
     aTPos[0] = new PVector(aTDiffX, aTDiffY);
     aTPos[1] = new PVector(aTSizeX, aTSizeY);
     aSpread = aDSpread;
    }
  }  
  aFont = createFont("Arial", 24);
  if (promptNum != 0) {
    promptImage = createGraphics((int) pSizeX, (int) pSizeY);
    promptImage.beginDraw();
    promptImage.textFont(aFont);
    promptImage.endDraw();
  }  
  buttons[0] = new CircleButton(qPos.x, qPos.y, 50, 135, false);
  buttons[0].setText(str(qIndex + 1));
  scrollBar = new ScrollBar((promptX + pSizeX) - 10, promptY, 20, 100, color(125));
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

 void displayElements() {
  textAlign(LEFT);
  if (promptNum != 0) {
   promptImage.beginDraw();
   promptImage.background(0);
   promptImage.text(prompt, promptX, scrollCount, pSizeX, 4000); 
   promptImage.endDraw();
   image(promptImage, promptX, promptY);
   scrollBar.display();
  }
  fill(255);
  text(question, qPos.x + qTPos[0].x, qPos.y + qTPos[0].y, qTPos[1].x, qTPos[1].y);
  if (imageQuestion)
   image(images[0], qPos.x + qIPos[0].x, qPos.y + qIPos[0].y, qIPos[1].x, qIPos[1].y);
  if (imageAnswer) {
   for (int i = 1; i < (buttons.length / 2) + 1; i++)
    image(images[i], aPos[0].x + aIPos[0].x, aPos[0].y + aIPos[0].y + aSpread * i, aIPos[1].x, aIPos[1].y);
   for (int i = (buttons.length / 2) + 1; i < buttons.length; i++)
    image(images[i], aPos[1].x + aIPos[0].x + aAIDiffX2, aPos[1].y + aIPos[0].y + aSpread * i, aIPos[1].x, aIPos[1].y);    
  } else {
   textAlign(LEFT, CENTER);
   for (int i = 0; i < answers.length; i++)
    text(answers[i], aPos[0].x + aTPos[0].x, aPos[0].y + aTPos[0].y + aSpread * i, aTPos[1].x, aTPos[1].y);
  }
 }

 void display() {
  if (scrollCount != scrollBar.getScrollValue())
   if (scrollBar.wasMoved())
    scrollCount = (int) -scrollBar.getScrollValue();
   else
    scrollBar.setLocationY(scrollCount); 
  println(scrollCount);
  for (int i = 0; i < buttons.length; i++)
   buttons[i].display();
  // Text Attributes
  textFont(aFont);
  fill(255);
  displayElements();
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
  if (promptNum != 0)
   scrollBar.update();
  return -1;
 }
 
 void importImage(int index) {
  if (index == 0)
   loadImage("/testing/test_questions/test_images/" + testName + "/IMG" + qIndex + ".png");
  else loadImage("/testing/test_questions/test_images/" + testName + "/IMG" + qIndex + str(index) + ".png");
 }
 
 void getScrollValue(float value) {
  scrollCount += (int) value;
  scrollCount = constrain(scrollCount, -4000, 0);
 }
}