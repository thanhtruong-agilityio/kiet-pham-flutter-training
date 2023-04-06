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
  static bool isValidConfirmPassword(String password, String confirmPassword) {
    return confirmPassword == password;
  }

  static bool formSignUpValid({
    String email = '',
    String password = '',
    String confirmPassword = '',
  }) {
    return (email.isNotEmpty && isValidEmail(email)) &&
        (password.isNotEmpty && isValidPassword(password)) &&
        (confirmPassword.isNotEmpty &&
            isValidConfirmPassword(password, confirmPassword));
  }

  static bool formLoginValid({
    String email = '',
    String password = '',
  }) {
    return (email.isNotEmpty && isValidEmail(email)) &&
        (password.isNotEmpty && isValidPassword(password));
  }

  static bool formForgotPaasswordValid({
    String email = '',
  }) {
    return email.isNotEmpty && isValidEmail(email);
  }
}
