import 'dart:io';
import 'dart:math';

void calculateAreaOfTriangle(double base, double height) {
  double area = 0.5 * base * height;
  print("The area of the triangle is ${area.toStringAsFixed(2)}");
}

void calculateAreaOfRectangle(double length, double width) {
  double area = length * width;
  print("The area of the rectangle is ${area.toStringAsFixed(2)}");
}

void calculateAreaOfCircle(double radius) {
  double area = pi * radius * radius;
  print("The area of the circle is ${area.toStringAsFixed(2)}");
}

void main() {
  while (true) {
    print("Menu:");
    print("1. Calculate Area of Triangle");
    print("2. Calculate Area of Rectangle");
    print("3. Calculate Area of Circle");
    print("4. Exit");

    stdout.write("Enter your choice between 1 to 4 : ");
    String? choice = stdin.readLineSync();

    if (choice == '1') {
      stdout.write("Enter the base of the triangle: ");
      double base = double.parse(stdin.readLineSync()!);
      stdout.write("Enter the height of the triangle: ");
      double height = double.parse(stdin.readLineSync()!);
      calculateAreaOfTriangle(base, height);
    }
    else if (choice == '2') {
      stdout.write("Enter the length of the rectangle: ");
      double length = double.parse(stdin.readLineSync()!);
      stdout.write("Enter the width of the rectangle: ");
      double width = double.parse(stdin.readLineSync()!);
      calculateAreaOfRectangle(length, width);
    }
    else if (choice == '3') {
      stdout.write("Enter the radius of the circle: ");
      double radius = double.parse(stdin.readLineSync()!);
      calculateAreaOfCircle(radius);
    }
    else if (choice == '4') {
      print("Exiting the program.");
      break;
    }
    else {
      print("Invalid choice, please select a valid option.");
    }
  }
}
