void main() {
  /**
   * Add another int parameter to that function called numberPeople 
   * so that the function returns something like “You’re wonderful, Bob. 
   * 10 people think so.”
   */
  const name = "kiet";
  final addName = youAreWonderful(name);
  const number = 30;
  final addNumber = numberPeople(number);
  print(addName + addNumber);
}

youAreWonderful(String name) {
  return "You're wonderful, $name.";
}

numberPeople([int number = 30]) {
  return "$number people think so.";
}
