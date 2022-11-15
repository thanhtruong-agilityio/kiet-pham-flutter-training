import 'dart:math';

void main() {
  // Challenge 4
  // a*x^2 + b*x + c = 0
  // value a, b, and c
  double a = 2.3, b = 4, c = 5.6;
  double root1, root2;

  // calculate the delta (b^2 - 4ac)
  double delta = b * b - 4 * a * c;

  // check if delta is greater than 0
  if (delta > 0) {
    // two real and distinct roots
    root1 = (-b + sqrt(delta)) / (2 * a);
    root2 = (-b - sqrt(delta)) / (2 * a);
    print("root1 = $root1\n root2 = $root2");
  }

  // check if delta is equal to 0
  else if (delta == 0) {
    // two real and equal roots
    root1 = root2 = -b / (2 * a);
    print("root1 = root2 = $root1");
  }

  // if determinant is less than zero
  else {
    print("roots do not exist");
  }
}
