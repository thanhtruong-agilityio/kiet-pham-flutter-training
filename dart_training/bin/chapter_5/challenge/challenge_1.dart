void main() {
  // Write a function that checks if a number is prime.
  const number = 11;
  if (numberIsPrime(number) == true) {
    print("number is prime");
  } else {
    print("number isn't prime");
  }
}

bool numberIsPrime(int n) {
  // if n < 2 number isn't prime
  if (n < 2) {
    return false;
  }

  for (int i = 2; i < (n - 1); i++) {
    if (n % i == 0) {
      return false;
    }
  }

  return true;
}
