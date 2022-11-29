import 'dart:math' as math;

class ArmstrongNumbers {
  // Put your code here

  bool isArmstrongNumber(String number) {
    var result = number.split('');
    dynamic calc = 0;
    for (var n in result) {
      var value = math.pow(int.parse(n), result.length);
      calc += value;
      print(calc);
    }
    return number == calc.toString();
  }
}
