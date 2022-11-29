// Put your code here
int score(String word) {
  word = word.toUpperCase();
  var characters = word.split('');
  var score = 0;

  characters.forEach((character) {
    letterValues.keys.forEach((key) {
      if (letterValues[key]!.contains(character)) {
        score += key;
      }
    });
  });

  return score;
}

Map<int, List<String>> letterValues = {
  1: ['A', 'E', 'I', 'O', 'U', 'L', 'N', 'R', 'S', 'T'],
  2: ['D', 'G'],
  3: ['B', 'C', 'M', 'P'],
  4: ['F', 'H', 'V', 'W', 'Y'],
  5: ['K'],
  8: ['J', 'X'],
  10: ['Q', 'Z']
};
