void main() {
  /**
   * Create a constant named myAge and initialize it with your age. 
   * Write an if statement to print out “Teenager” 
   * if your age is between 13 and 19, 
   * and “Not a teenager” if your age is not between 13 and 19.
   */
  const myAge = 23;
  if (13 <= myAge && myAge < 19) {
    print("Teenager");
  } else {
    print("Not a Teenager");
  }

  /**
   * Use a ternary conditional operator to replace the else-if statement that you used above. 
   * Set the result to a variable named answer.
   */
  const message = (13 <= myAge && myAge < 19) ? "Teenager" : "Not a Teenager";
  print(message);
}
