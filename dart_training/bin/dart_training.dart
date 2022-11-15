import 'package:dart_training/dart_training.dart' as dart_training;

void main(List<String> arguments) {
  // print('Hello world: ${dart_training.calculate()}!');

  const andTrue = 1 < 2 && 4 > 3;
  const andFalse = 1 < 2 && 3 > 4;
  const orTrue = 1 < 2 || 3 > 4;
  const orFalse = 1 == 2 || 3 == 4;
}
