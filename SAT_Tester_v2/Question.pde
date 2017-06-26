class Question {
  // Created 6/16/2017
  // Snippets taken from :
  // 
  
  // To Do:
  // ---
  // Fix allignment of text (not sure how text is exactly alligned, further test it)
  // Scale font based on length of questions (& answers?)
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
    answers = new String[] {ans1, ans2, ans3, ans4};
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
    answers = new String[] {str(ans1), str(ans2), str(ans3), str(ans4)};
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
    answers = new String[] {ans1, ans2, ans3, ans4};
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
    answers = new String[] {str(ans1), str(ans2), str(ans3), str(ans4)};
    buttons[0] = new CircleButton(156, 100, 50, 135, false);
    for (int i = 1; i < buttons.length; i++) 
     buttons[i] = new CircleButton(256, 200 + 100 * i, 50, 135); 
    images = new PImage[5];
    imageQuestion = imageQuestion_;
    imageAnswer = imageAnswer_; 
    if (imageQuestion && imageAnswer) {
      buttons[0] = new CircleButton(50, 50, 50, 135, false);
      for (int i = 1; i < (buttons.length - 1) / 2; i++) 
       buttons[i] = new CircleButton(100, 380 + 180 * i, 50, 135);  
      for (int i = (buttons.length - 1) / 2; i < buttons.length; i++) 
       buttons[i] = new CircleButton(740, 380 + 180 * i, 50, 135);  
      images[0] = loadImage("/testing/test_questions/test_images/" + testName + "/IMG" + qIndex + ".png");
      for (int i = 1; i < images.length; i++)
       images[i] = loadImage("/testing/test_questions/test_images/" + testName + "/IMG" + qIndex + str(i) + ".png");
    }
    else if (imageQuestion) {
     buttons[0] = new CircleButton(50, 50, 50, 135, false);
     images[0] = loadImage("/testing/test_questions/test_images/" + testName + "/IMG" + qIndex + ".png");
    }
    else if (imageAnswer) {
      for (int i = 1; i < (buttons.length - 1) / 2; i++) 
       buttons[i] = new CircleButton(100, 380 + 180 * i, 50, 135);  
      for (int i = (buttons.length - 1) / 2; i < buttons.length; i++) 
       buttons[i] = new CircleButton(740, 380 + 180 * i, 50, 135);  
      for (int i = 1; i < images.length; i++) {   
       images[i] = loadImage("/testing/test_questions/test_images/" + testName + "/IMG" + qIndex + str(i) + ".png"); 
      }
    }      
  }
  
   Question(String type_, String question_, String ans1, String ans2, String ans3, String ans4, boolean imageQuestion_, boolean imageAnswer_, int qIndex_, String testName_) {
    type = type_;
    aFont = createFont("Arial", 24);
    buttons = new CircleButton[5];
    answers = new String[4];
    question = question_;
    qIndex = qIndex_;
    testName = testName_;
    answers = new String[] {ans1, ans2, ans3, ans4};
    buttons[0] = new CircleButton(156, 100, 50, 135, false);
    for (int i = 1; i < buttons.length; i++) 
     buttons[i] = new CircleButton(256, 200 + 100 * i, 50, 135);    
    images = new PImage[5];
    imageQuestion = imageQuestion_;
    imageAnswer = imageAnswer_;  
    if (imageQuestion && imageAnswer) {
      buttons[0] = new CircleButton(50, 75, 50, 135, false);
      for (int i = 1; i < (buttons.length / 2) + 1; i++) 
       buttons[i] = new CircleButton(100, 380 + 180 * (i - 1), 50, 135);  
      for (int i = (buttons.length / 2) + 1; i < buttons.length; i++) 
       buttons[i] = new CircleButton(740, 380 + 180 * (i - 3), 50, 135);   
      images[0] = loadImage("/testing/test_questions/test_images/" + testName + "/IMG" + qIndex + ".png");
      for (int i = 1; i < images.length; i++)
       images[i] = loadImage("/testing/test_questions/test_images/" + testName + "/IMG" + qIndex + str(i) + ".png");
    }
    else if (imageQuestion) {
     buttons[0] = new CircleButton(50, 50, 50, 135, false);
     images[0] = loadImage("/testing/test_questions/test_images/" + testName + "/IMG" + qIndex + ".png");
    }
    else if (imageAnswer) {
      for (int i = 1; i < (buttons.length / 2) + 1; i++) 
       buttons[i] = new CircleButton(100, 380 + 180 * (i - 1), 50, 135);
      for (int i = (buttons.length / 2) + 1; i < buttons.length; i++) 
       buttons[i] = new CircleButton(740, 380 + 180 * (i - 3), 50, 135);  
      for (int i = 1; i < images.length; i++) {   
       images[i] = loadImage("/testing/test_questions/test_images/" + testName + "/IMG" + qIndex + str(i) + ".png"); 
      }
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
    if (!(imageQuestion || imageAnswer)) {
    text(question, 200, 85, 1104, 250);
    for (int i = 0; i < answers.length; i++) {
     float yPosition = 280 + 100 * i;
     text(answers[i], 300, yPosition, 1250, yPosition);
     }
    }
    if (imageQuestion && imageAnswer) {
     text(question, 90, 50, 550, 360);
     image(images[0], 690, 50, 500, 250);
     for (int i = 1; i < (buttons.length / 2) + 1; i++)
      image(images[i], 150, 380 + 180 * (i - 1), 150, 150);
     for (int i = (buttons.length / 2) + 1; i < buttons.length; i++)
      image(images[i], 790, 380 + 180 * (i - 3), 150, 150);     
    }
    else if (imageQuestion) {
     text(question, 90, 50, 550, 360);
     image(images[0], 400, 50, 1190, 360);
     for (int i = 0; i < answers.length; i++) {
      float yPosition = 280 + 100 * i;
      text(answers[i], 300, yPosition, 1250, yPosition);
     }
    }
    else if (imageAnswer) {
     text(question, 200, 85, 1104, 250);
     for (int i = 1; i < (buttons.length / 2) + 1; i++)
      image(images[i], 150, 380 + 180 * (i - 1), 150, 150);
     for (int i = (buttons.length / 2) + 1; i < buttons.length; i++)
      image(images[i], 790, 380 + 180 * (i - 3), 150, 150);  
    }
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