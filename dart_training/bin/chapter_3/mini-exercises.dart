void main(List<String> args) {
  const age1 = 42;
  const age2 = 21;
  const averageAge = (age1 + age2) / 2;
  print(averageAge);

  /**
   * 1. Create a string constant called firstName and initialize it to your first name. 
   *    Also create a string constant called lastName and initialize it to your last name.
   * 2. Create a string constant called fullName by adding the firstName and lastName constants together, separated by a space.
   * 3. Using interpolation, create a string constant called myDetails that uses the fullName constant to create a string introducing yourself. 
   *    For example, Ray Wenderlich’s string would read: Hello, my name is Ray Wenderlich.
   */

  const firstName = "Kiet ";
  const lastName = "Pham Vo Anh";
  const fullName = firstName + lastName;
  const myDetails = "Hello my name is $fullName";
  print(myDetails);

  num someNumber = 3;
  final someInt = someNumber as int;
  print(someInt.isEven);
}
