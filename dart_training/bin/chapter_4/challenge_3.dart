void main(List<String> args) {
  /**
   * Given a number, determine the next power of two above or equal to that number.
   *  Powers of two are the numbers in the sequence of 21, 22, 23, and so on. 
   * You may also recognize the series as 1, 2, 4, 8, 16, 32, 64...
   */
  int i = 1;
  while (i < 100) {
    i *= 2;
    print(i);
  }
}
