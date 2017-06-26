class Question_Manager {
 
  ArrayList<Question> Questions = new ArrayList<Question>();
  int currentMode;
  int currentQuestion;
  int previousAnswer, selectedAnswer;
  RectButton nextButton, lastButton;
  Table answerTable;
  TableRow questionRow;
  String filename;
  
  
  Question_Manager() {
    currentQuestion = 0;
    nextButton = new RectButton(1180, 680, width, height, 135, true, false);
    lastButton = new RectButton(0, 680, 100, height, 135, true, false);
    answerTable = new Table();
    answerTable.addColumn("Question", Table.INT);
    answerTable.addColumn("Answer", Table.INT);
    filename = "data/testing/user_answers/test_" + year() + "_" + month() + "_" + day() + "_" + hour() + "_" + minute() + ".csv";                               
  }
  
  Question_Manager(String testName) {
    currentQuestion = 0;
    nextButton = new RectButton(1180, 680, width, height, 135, true, false);
    lastButton = new RectButton(0, 680, 100, height, 135, true, false);
    answerTable = new Table();
    answerTable.addColumn("Question", Table.INT);
    answerTable.addColumn("Answer", Table.INT);
    loadQuestions("data/testing/test_questions/" + testName + ".csv");
    filename = "data/testing/user_answers/test_" + year() + "_" + month() + "_" + day() + "_" + hour() + "_" + minute() + ".csv";                               
  }
  
  void update() {
    selectedAnswer = Questions.get(currentQuestion).update();
    if (!(selectedAnswer == previousAnswer) && !(selectedAnswer == -1)) {
     answerTable.setInt(currentQuestion, "Answer", selectedAnswer);
     saveTable(answerTable, filename);
    }
    previousAnswer = selectedAnswer;
    nextButton.update();
    lastButton.update();
    if (nextButton.isSelected && !(currentQuestion == Questions.size() - 1)) {
     currentQuestion++;
     delay(100);
    }  
    if (lastButton.isSelected && !(currentQuestion == 0)) {
     currentQuestion--;
     delay(100);      
    }
  }
  
  void display() {
   Questions.get(currentQuestion).display();
   if (!(currentQuestion == Questions.size() - 1))
    nextButton.display();
   if (!(currentQuestion == 0))
    lastButton.display();
  }
  
  void loadQuestions(String filename_) {
    Table tempTable = loadTable("/testing/test_questions/" + filename_ + ".csv", "header");
    TableRow tempRow;
    boolean imageQuestion;
    boolean answerQuestion;
    for (int i = 0; i < tempTable.getRowCount(); i++) {
      tempRow = tempTable.getRow(i);      
      imageQuestion = (tempRow.getString(6).equals("T")) ? true : false;
      answerQuestion = (tempRow.getString(7).equals("T")) ? true : false;
      Questions.add(new Question(tempRow.getString(0), tempRow.getString(1), tempRow.getString(2), tempRow.getString(3), tempRow.getString(4), tempRow.getString(5), imageQuestion, answerQuestion, i, filename_));
    }
    for (int i = 0; i < Questions.size(); i++) {
     questionRow = answerTable.addRow();
     questionRow.setInt("Question", i);
     questionRow.setInt("Answer", 0);
     saveTable(answerTable, filename);
  }
 }   
}