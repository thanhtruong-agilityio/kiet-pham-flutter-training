void main() {
  /**
   * Create a constant called myAge and set it to your age. 
   * Then, create a constant named isTeenager that uses Boolean logic to determine if the age denotes someone in the age range of 13 to 19.
   */
  const int myAge = 23;
  const isTeenager = (myAge >= 13 && myAge < 19);
  print(isTeenager);

  /**
   * Create another constant named maryAge and set it to 30. 
   * Then, create a constant named bothTeenagers that uses Boolean logic to determine if both you and Mary are teenagers.
   */
  const maryAge = 30;
  const bothTeenagers =
      (myAge >= 13 && myAge < 19) && (maryAge >= 13 && maryAge < 19);
  print(bothTeenagers);

  /**
   * Create a String constant named reader and set it to your name. 
   * Create another String constant named ray and set it to 'Ray Wenderlich'. 
   * Create a Boolean constant named rayIsReader that uses string equality to determine if reader and ray are equal.
   */
  const String reader = 'Kiet';
  const String ray = 'Ray Wenderlich';
  const rayIsReader = ray == reader;
  print(rayIsReader);
}
