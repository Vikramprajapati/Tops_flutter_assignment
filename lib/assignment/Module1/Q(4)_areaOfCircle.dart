import 'dart:io';

void main()
{
  stdout.write("Enter the radius of the circle: ");
  var radius=double.parse(stdin.readLineSync()!);
  print("Area of circle is : ${3.14*radius*radius}");

}