void main() {
  /**
   * 1. Create a class called Password and give it a string property called value.
   * 2. Override the toString method of Password so that it prints value.
   * 3. Add a method to Password called isValid that returns true only if the length of value is greater than 8.
   */
  final password = Password();
  var testPassword = password.isValid();
  print(testPassword);
}

class Password {
  String value = "kiet";
  @override
  String toString() {
    return 'value: $value';
  }

  bool isValid() {
    if (value.length < 8) {
      return false;
    } else {
      return true;
    }
  }
}
