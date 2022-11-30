class Bob {
  // Put your code here

  String response(String saying) => saying.isQuestion && saying.isYelling
      ? 'Calm down, I know what I\'m doing!'
      : saying.isQuestion
          ? 'Sure.'
          : saying.isYelling
              ? 'Whoa, chill out!'
              : saying.isNothing
                  ? 'Fine. Be that way!'
                  : 'Whatever.';

  // String response(String saying) {
  //   if (saying.isQuestion && saying.isYelling) {
  //     return 'Calm down, I know what I\'m doing!';
  //   } else if (saying.isQuestion) {
  //     return 'Sure.';
  //   } else if (saying.isYelling) {
  //     return 'Whoa, chill out!';
  //   } else if (saying.isNothing) {
  //     return 'Fine. Be that way!';
  //   } else {
  //     return 'Whatever.';
  //   }
  // }

}

extension on String {
  bool get isQuestion => this.trim().endsWith('?');
  bool get isYelling =>
      this == this.toUpperCase() && this != this.toLowerCase();
  bool get isNothing => this.isEmpty;
}
