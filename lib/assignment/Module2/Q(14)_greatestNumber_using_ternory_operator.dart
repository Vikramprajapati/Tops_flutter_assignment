import 'dart:io';

void main() {
  stdout.write("Enter 1st number : ");
  int a = int.parse(stdin.readLineSync()!);

  stdout.write("Enter 2nd number : ");
  int b = int.parse(stdin.readLineSync()!);

  stdout.write("Enter 3rd  number : ");
  int c = int.parse(stdin.readLineSync()!);

  if (a == null || b == null || c == null) {
    print('Invalid input. Please enter valid integers.');
  } else {


    int max=(a>=b) ? (a>=c ? a : c)
    : (b>=c ? b : c);
    print("greatest number is $max");

  }

}