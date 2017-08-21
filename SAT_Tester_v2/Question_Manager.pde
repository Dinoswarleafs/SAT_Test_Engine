class Question_Manager {

 ArrayList < Question > Questions = new ArrayList < Question > ();
 int currentMode;
 int currentQuestion, sectionQuestion;
 int previousAnswer, selectedAnswer;
 RectButton nextButton, lastButton;
 Table answerTable;
 TableRow questionRow;
 String filename;
 int[] lastQ;
 ScrollBar qScrollBar;


 Question_Manager() {
  nextButton = new RectButton(width - SAT.nButtonWidth, height - SAT.nButtonHeight, width, height, 135, true, false);
  lastButton = new RectButton(0, height - SAT.nButtonHeight, 100, height, 135, true, false);
  qScrollBar = new ScrollBar(SAT.nButtonWidth + SAT.qScrollOffset, height - SAT.qScrollHeight, SAT.qScrollWidth, SAT.qScrollHeight, 0, 20, color(135), false);  
  lastQ = new int[4];
  answerTable = new Table();
  answerTable.addColumn("Question", Table.INT);
  answerTable.addColumn("Answer", Table.INT);
  filename = "data/testing/user_answers/test_" + year() + "_" + month() + "_" + day() + "_" + hour() + "_" + minute() + ".csv";
 }

 Question_Manager(String testName) {
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
  if ((!(currentQuestion == Questions.size() - 1)))
   nextButton.update();
  if (!(currentQuestion == 0) && !(checkIfLastQuestion()))
   lastButton.update();
  if (nextButton.isSelected && !(currentQuestion == Questions.size() - 1)) {
   currentQuestion++;
   delay(100);
  }
  if (lastButton.isSelected && !(currentQuestion == 0)) {
   currentQuestion--;
   delay(100);
  }
  qScrollBar.update();
 }

 void display() {
  Questions.get(currentQuestion).display();
  if ((!(currentQuestion == Questions.size() - 1)))
   nextButton.display();
  if (!(currentQuestion == 0) && !(checkIfLastQuestion()))
   lastButton.display();
   qScrollBar.display();
 }

 void loadQuestions(String filename_) {
  Table tempTable = loadTable("/testing/test_questions/" + filename_ + ".csv", "header");
  TableRow tempRow;
  boolean imageQuestion;
  boolean imageAnswer;
  int promptNum;
  for (int i = 0; i < tempTable.getRowCount() - 1; i++) {
   tempRow = tempTable.getRow(i);
   imageQuestion = (tempRow.getString(6).equals("T")) ? true : false;
   imageAnswer = (tempRow.getString(7).equals("T")) ? true : false;
   promptNum = int(tempRow.getString(8));
   println("Loading Prompt : " + tempRow.getString(8));
   if (tempRow.getString(8).equals(""))
    Questions.add(new Question(tempRow.getString(0), tempRow.getString(1), tempRow.getString(2), tempRow.getString(3), tempRow.getString(4), tempRow.getString(5), imageQuestion, imageAnswer, i, filename_));
   else Questions.add(new Question(tempRow.getString(0), tempRow.getString(1), tempRow.getString(2), tempRow.getString(3), tempRow.getString(4), tempRow.getString(5), promptNum, i, filename_));
  }
  tempRow = tempTable.getRow(tempTable.getRowCount() - 1);
  for (int i = 0; i < lastQ.length; i++)
   lastQ[i] = int(tempRow.getString(i));
  for (int i = 0; i < Questions.size(); i++) {
   questionRow = answerTable.addRow();
   questionRow.setInt("Question", i);
   questionRow.setInt("Answer", 0);
   saveTable(answerTable, filename);
  }
 }
 
 boolean checkIfLastQuestion() {
  for (int i = 0; i < lastQ.length; i++)
   if (currentQuestion - 1 == lastQ[i])
    return true;
  return false;
 }
 
 void getSectionQuestion() {
   
 }
}