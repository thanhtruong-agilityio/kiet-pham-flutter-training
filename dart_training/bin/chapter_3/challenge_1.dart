void main(List<String> args) {
  /**
   * You’re a teacher, and in your class, 
   * attendance is worth 20% of the grade, 
   * the homework is worth 30% and the exam is worth 50%. 
   * Your student got 90 points for her attendance, 
   * 80 points for her homework and 94 points on her exam. 
   * Calculate her grade as an integer percentage rounded down.
   */
  int attendance = 90; //20%
  int homework = 80; // 30%
  int theExam = 94; // 50%
  var total = (attendance * 0.2) + (homework * 0.3) + (theExam * 0.5);
  print("total: $total");
}
