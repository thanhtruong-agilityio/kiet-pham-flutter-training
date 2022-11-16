void main() {
  /**
   * Create a variable named counter and set it equal to 0. 
   * Create a while loop with the condition counter < 10. 
   * The loop body should print out “counter is X” 
   * (where X is replaced with the value of counter) 
   * and then increment counter by 1.
   */
  var counter = 0;
  while (counter < 10) {
    print("Counter is $counter");
    counter += 1;
  }

  /**
   * Write a for loop starting at 1 and ending with 10 inclusive. 
   * Print the square of each number.
   */
  for (var i = 1; i <= 10; i++) {
    print("Square root of $i = ${i * i}");
  }

  /**
   * Write a for-in loop to iterate over the following collection of numbers. 
   * Print the square root of each number.
   */
  const numbers = [1, 2, 4, 7];
  for (var number in numbers) {
    print("Square root of $number = ${number * number}");
  }

  /**
   * Repeat Mini-exercise 3 using a forEach loop.
   */
  numbers.forEach(
      (number) => print("Square root of $number = ${number * number}"));
}
