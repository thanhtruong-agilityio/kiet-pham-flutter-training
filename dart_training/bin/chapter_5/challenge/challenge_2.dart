void main(List<String> args) {
  var test = repeatTask(4, 2, (task) => task * task);
  print(test);
}

int repeatTask(int times, int input, Function task) {
  int result = input;
  for (int i = 0; i < times; i++) {
    result = task(result);
  }
  return result;
}
