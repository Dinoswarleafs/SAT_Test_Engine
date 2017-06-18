class QuestionManager {
 
  ArrayList<Question> Questions = new ArrayList<Question>();
  int currentQuestion;
  int previousAnswer, selectedAnswer;
  RectButton nextButton, lastButton;
  Table answerTable;
  TableRow questionRow;
  String filename;
  
  QuestionManager() {
    currentQuestion = 0;
    nextButton = new RectButton(1180, 680, width, height, 135, true, false);
    lastButton = new RectButton(0, 680, 100, height, 135, true, false);
    answerTable = new Table();
    answerTable.addColumn("Question", Table.INT);
    answerTable.addColumn("Answer", Table.INT);
    loadQuestions("resources/testing/test_questions/SAT_Test_1.csv");
    filename = "resources/testing/user_answers/test_" + year() + "_" + month() + "_" + day() + "_" + hour() + "_" + minute() + ".csv";                               
    for (int i = 0; i < Questions.size(); i++) {
     questionRow = answerTable.addRow();
     questionRow.setInt("Question", i);
     questionRow.setInt("Answer", 0);
     saveTable(answerTable, filename);
    }
    println(answerTable.getRowCount());
  }
  
  void update() {
    selectedAnswer = Questions.get(currentQuestion).update();
    if (!(selectedAnswer == previousAnswer) && !(selectedAnswer == -1)) {
     println(selectedAnswer); 
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
    Table tempTable = loadTable(filename_, "header");
    TableRow tempRow;
    for (int i = 0; i < tempTable.getRowCount(); i++) {
      tempRow = tempTable.getRow(i);
      Questions.add(new Question(tempRow.getString(0), tempRow.getString(1), tempRow.getString(2), tempRow.getString(3), tempRow.getString(4)));
    }
    
  }
  
}