import 'package:characters/characters.dart';

void main(List<String> args) {
  /**
   * This string has two flags that look the same. But they aren’t! 
   * One of them is the flag of Chad and the other is the flag of Romania.
   */
  const twoCountries = '🇹🇩🇷🇴';
  twoCountries.characters.length;
  print(twoCountries.runes);
}
