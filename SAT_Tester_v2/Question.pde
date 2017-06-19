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
  }
  
   Question(String question_, int ans1, int ans2, int ans3, int ans4) {
    aFont = createFont("Arial", 24);
    buttons = new CircleButton[5];
    answers = new String[4];
    question = question_;
    answers = new String[] {str(ans1), str(ans2), str(ans3), str(ans4)};
    buttons[0] = new CircleButton(156, 100, 50, 135, false);
    for (int i = 1; i < buttons.length; i++) 
     buttons[i] = new CircleButton(256, 200 + 100 * i, 50, 135); 
  }
  
  void display() {
    for (int i = 0; i < buttons.length; i++)
     buttons[i].display();
    // Text Attributes
    textFont(aFont);    
    textAlign(LEFT);
    fill(255);
    // Drawing text FIX ALLIGNMENT
    text(question, 200, 85, 1104, 250);
    for (int i = 0; i < answers.length; i++) {
     float yPosition = 280 + 100 * i;
     text(answers[i], 300, yPosition, 1250, yPosition);
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