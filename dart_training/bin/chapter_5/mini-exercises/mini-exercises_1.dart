void main() {
  /**
   * Write a function named youAreWonderful, with a String parameter called name. 
   * It should return a string using name, and say something like “You’re wonderful, Bob.”
   */
  const name = "kiet";
  final addName = youAreWonderful(name);
  print(addName);
}

youAreWonderful(String name) {
  return "You're wonderful, $name.";
}

numberPeople([int number = 30]) {
  return "$number people think so.";
}
