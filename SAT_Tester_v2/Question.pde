class Question {
 // Created 6/16/2017
 // Snippets taken from :
 // 

 // To Do:
 // ---
 // Fix Constructor
 // --- 


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
   qPos = new PVector(SAT.pQuestionX, SAT.pQuestionY);
   aPos[0] = new PVector(SAT.pAnswerX, SAT.pAnswerY);
   pPos[0] = new PVector(SAT.promptX, SAT.promptY);
   pPos[1] = new PVector(SAT.pSizeX, SAT.pSizeY);
   qTPos[0] = new PVector(SAT.qPDiffX, SAT.qPDiffY);
   qTPos[1] = new PVector(SAT.qPSizeX, SAT.qPSizeY);
   aTPos[0] = new PVector(SAT.aPDiffX, SAT.aPDiffY);
   aTPos[1] = new PVector(SAT.aPSizeX, SAT.aPSizeY);
   scrollBar = new ScrollBar((SAT.promptX + SAT.pSizeX) - 10, SAT.promptY, 20, 100, 0, SAT.graphicHeight, color(125), true);      
   aSpread = SAT.aPSpread;
  } else {
   if (imageQuestion && imageAnswer) {
    qPos = new PVector(SAT.qIQuestionX, SAT.qIQuestionY);
    aPos[0] = new PVector(SAT.aIAnswerX, SAT.aIAnswerY);
    aPos[1] = new PVector(SAT.aIAnswerX2, SAT.aIAnswerY);
    qTPos[0] = new PVector(SAT.qQTDiffX, SAT.qQTDiffY);
    qTPos[1] = new PVector(SAT.qQTSizeX, SAT.qQTSizeY);
    qIPos[0] = new PVector(SAT.qQIDiffX, SAT.qQIDiffY);
    qIPos[1] = new PVector(SAT.qQISizeX, SAT.qQISizeY);
    aIPos[0] = new PVector(SAT.aAIDiffX, SAT.aAIDiffY);
    aIPos[1] = new PVector(SAT.aAISizeX, SAT.aAISizeY);
    aSpread = SAT.aBSpread;
    importImage(0);
    for (int i = 1; i < images.length; i++)
     importImage(i);
   } else if (imageQuestion) {
    qPos = new PVector(SAT.qIQuestionX, SAT.qIQuestionY);
    aPos[0] = new PVector(SAT.answerX, SAT.answerY);
    qTPos[0] = new PVector(SAT.qQTDiffX, SAT.qQTDiffY);
    qTPos[1] = new PVector(SAT.qQTSizeX, SAT.qQTSizeY);
    qIPos[0] = new PVector(SAT.qQIDiffX, SAT.qQIDiffY);
    qIPos[1] = new PVector(SAT.qQISizeX, SAT.qQISizeY);
    aTPos[0] = new PVector(SAT.aTDiffX, SAT.aTDiffY);
    aTPos[1] = new PVector(SAT.aTSizeX, SAT.aTSizeY);
    aSpread = SAT.aQSpread;
    importImage(0);
   } else if (imageAnswer) {
    qPos = new PVector(SAT.questionX, SAT.questionY);
    aPos[0] = new PVector(SAT.aIAnswerX, SAT.aIAnswerY);
    aPos[1] = new PVector(SAT.aIAnswerX2, SAT.aIAnswerY);
    qTPos[0] = new PVector(SAT.qTDiffX, SAT.qTDiffY);
    qTPos[1] = new PVector(SAT.qTSizeX, SAT.qTSizeY);
    aIPos[0] = new PVector(SAT.aAIDiffX, SAT.aAIDiffY);
    aIPos[1] = new PVector(SAT.aAISizeX, SAT.aAISizeY);
    aSpread = SAT.aASpread;
    for (int i = 1; i < images.length; i++)
     importImage(i);
   } else {
    qPos = new PVector(SAT.questionX, SAT.questionY);
    aPos[0] = new PVector(SAT.answerX, SAT.answerY);
    qTPos[0] = new PVector(SAT.qTDiffX, SAT.qTDiffY);
    qTPos[1] = new PVector(SAT.qTSizeX, SAT.qTSizeY);
    aTPos[0] = new PVector(SAT.aTDiffX, SAT.aTDiffY);
    aTPos[1] = new PVector(SAT.aTSizeX, SAT.aTSizeY);
    aSpread = SAT.aDSpread;
   }
  }
  aFont = createFont("Arial", 24);
  if (promptNum != 0) {
   promptImage = createGraphics((int) SAT.pSizeX, (int) SAT.pSizeY);
   promptImage.beginDraw();
   promptImage.textFont(aFont);
   promptImage.endDraw();
  }
  buttons[0] = new CircleButton(qPos.x, qPos.y, 50, 135, false);
  buttons[0].setText(str(qIndex + 1));
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
   promptImage.text(prompt, SAT.promptX, scrollCount, SAT.pSizeX, SAT.graphicHeight);
   promptImage.endDraw();
   image(promptImage, SAT.promptX, SAT.promptY);
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
    image(images[i], aPos[1].x + aIPos[0].x + SAT.aAIDiffX2, aPos[1].y + aIPos[0].y + aSpread * i, aIPos[1].x, aIPos[1].y);
  } else {
   textAlign(LEFT, CENTER);
   for (int i = 0; i < answers.length; i++)
    text(answers[i], aPos[0].x + aTPos[0].x, aPos[0].y + aTPos[0].y + aSpread * i, aTPos[1].x, aTPos[1].y);
  }
 }

 void display() {
  if (scrollCount != scrollBar.getScrollValue())
   if (scrollBar.wasMoved())
    scrollCount = (int) - scrollBar.getScrollValue();
   else
    scrollBar.setLocation(scrollCount);
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
  scrollCount = constrain(scrollCount, (int) -SAT.graphicHeight, 0);
 }
}