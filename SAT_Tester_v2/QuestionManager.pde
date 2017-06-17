class QuestionManager {
 
  ArrayList<Question> Questions = new ArrayList<Question>();
  int currentQuestion;
  RectButton nextButton, lastButton;
  
  QuestionManager() {
    currentQuestion = 0;
    nextButton = new RectButton(1180, 680, width, height, 135, true, false);
    lastButton = new RectButton(0, 680, 100, height, 135, true, false);
    Questions.add(new Question("If (x - 1) / 3 = k and k = 3, what is the value of x ?", 2, 4, 9, 10));
    Questions.add(new Question("For i = √−1 , what is the sum (7 + 3i) + (−8 + 9i)?", "-1 + 12i", "-1 - 6i", "15 + 12i", "15 - 6i"));
    Questions.add(new Question("On Saturday afternoon, Armand sent m text messages each hour for 5 hours, " + 
                               "and Tyrone sent p text messages each hour for 4 hours. Which of the following " +
                               "represents the total number of messages sent by Armand and Tyrone on Saturday " + 
                               "afternoon?", "9mp", "20mp", "5m + 4p", "4m + 5p"));
    Questions.add(new Question("Kathy is a repair technician for a phone company. Each week, she receives a " +
                               "batch of phones that need repairs. The number of phones that she has left to fix " +
                               "at the end of each day can be estimated with the equation P d = 108 − 23 , " +
                               "where P is the number of phones left and d is the number of days she has " +
                               "worked that week. What is the meaning of the value 108 in this equation? ",
                               "Kathy will complete the repairs within 108 days.", "Kathy starts each week with 108 phones to fix. ",
                               "Kathy repairs phones at a rate of 108 per hour", " Kathy repairs phones at a rate of 108 per day. "));
  }
  
  void update() {
    Questions.get(currentQuestion).update();
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
  
}