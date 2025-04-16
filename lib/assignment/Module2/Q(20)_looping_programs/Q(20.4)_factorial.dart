import 'dart:io';

void main() {
  stdout.write("Enter a number to find its factorial: ");
  int input = int.parse(stdin.readLineSync()!);


  if (input < 0) {
    print("Factorial is not defined for negative numbers.");
    return;
  }

  int factorial = 1;

  for (int i = 1; i <= input; i++) {
    factorial=factorial*i;
  }

  print("The factorial of $input is $factorial");
}
