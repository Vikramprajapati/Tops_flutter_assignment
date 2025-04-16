import 'dart:io';

void main() {
  stdout.write("Enter a number to print the Fibonacci series up to that number: ");
  int number = int.parse(stdin.readLineSync()!);


  if (number < 0) {
    print("Please enter a non-negative number.");
    return;
  }

  List<int> fibonacciSeries = [];
  int a = 0, b = 1;


  while (a <= number) {
    fibonacciSeries.add(a);
    int next = a + b;
    a = b;
    b = next;
  }

  print("Fibonacci series up to $number:");
  print(fibonacciSeries.join(' '));
}
