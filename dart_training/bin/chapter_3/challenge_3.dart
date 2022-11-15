import 'package:characters/characters.dart';

void main(List<String> args) {
  /**
   * How many UTF-16 code units are there? 
   * How many Unicode code points are there? 
   * How many Unicode grapheme clusters are there?
   */
  const vote = 'Thumbs up! 👍';
  print("Has ${vote.codeUnits.length} UTF-16 code units");
  print("Has ${vote} Unicode code points");
  print("has ${vote.runes.length} Unicode grapheme clusters");
}
