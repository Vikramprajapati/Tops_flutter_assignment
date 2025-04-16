import 'dart:io';

void main() {
  stdout.write("Enter 1st number : ");
  int a=int.parse(stdin.readLineSync()!);

  stdout.write("Enter 2nd number : ");
  int b=int.parse(stdin.readLineSync()!);

  stdout.write("Enter 3rd  number : ");
  int c=int.parse(stdin.readLineSync()!);

  if (a >= b) {
    if (a >=c) {
      print("$a is a greatest number among three numbers.");
    }
    else {
      print("$c is a greatest number among three numbers.");
    }
  }
  else {
    if (b >= c) {
      print("$b is a greatest number among three numbers.");
    }
    else {
      print("$c is a greatest number among three numbers.");
    }
  }
}
