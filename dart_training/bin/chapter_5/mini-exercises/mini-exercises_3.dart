void main() {
  const name = "kiet";
  final addName = youAreWonderful(name: name);
  print(addName + numberPeople());
}

youAreWonderful({required String name}) {
  return "You're wonderful, $name.";
}

numberPeople([int number = 30]) {
  return "$number people think so.";
}
