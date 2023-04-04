class AuthValidator {
  // Check is valid email address
  static bool isValidEmail(String email) {
    return RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
    ).hasMatch(email);
  }

  // Password must be more than 6 characters
  static bool isValidPassword(String password) {
    return password.length >= 6;
  }

  // Confirm password must match password
  static bool isValidPasswordConfirm(String password, String passwordConfirm) {
    return passwordConfirm == password;
  }
}
