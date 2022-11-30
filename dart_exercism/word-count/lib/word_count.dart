class WordCount {
  // Put your code here

  Map<String, int> countWords(String doc) {
    RegExp regExp = RegExp(r"\d+|[a-z]+('[a-z]+ )?", caseSensitive: false);
    Map<String, int> result = Map();
    // print(regExp
    //     .allMatches(doc)
    //     .map((element) => element.group(0)!.toLowerCase()));
    regExp.allMatches(doc).forEach((element) => result.update(
        element.group(0)!.toLowerCase(), (value) => value + 1,
        ifAbsent: () => 1));

    return result;
  }
}

// void main() {
//   final wordCount = WordCount();
//   final Map<String, int> result = wordCount.countWords(
//       "That's the password: 'PASSWORD 123'!, cried the Special Agent.\nSo I fled.");
//   print(result);
// }
