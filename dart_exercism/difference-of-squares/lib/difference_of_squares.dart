import 'dart:math';

class DifferenceOfSquares {
  // Put your code here

  // int squareOfSum(int n) {
  //   var list = List<int>.generate(n, (index) => index +1);
  //   var number = list.reduce((value, element) => value + element);
  //   var result = pow(number, 2).toInt();
  //   return result;

  // }

  int squareOfSum(int n) => pow(
          List<int>.generate(n, (index) => index + 1)
              .reduce((value, element) => value + element),
          2)
      .toInt();

  // int sumOfSquares(int n) {
  //   var list = List<int>.generate(n, (index) => pow(index + 1, 2).toInt());
  //   var result = list.reduce((value, element) => value + element);
  //   return result;
  // }

  int sumOfSquares(int n) =>
      List<int>.generate(n, (index) => pow(index + 1, 2).toInt())
          .reduce((value, element) => value + element);

  int differenceOfSquares(int n) => squareOfSum(n) - sumOfSquares(n);
}
