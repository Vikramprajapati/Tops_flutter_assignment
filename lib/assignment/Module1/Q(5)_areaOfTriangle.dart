import 'dart:io';

void main()
{
  stdout.write("Enter base of triangle : ");
  double base=double.parse(stdin.readLineSync()!);

  stdout.write("Enter height of triangle : ");
  double height=double.parse(stdin.readLineSync()!);

  print("Area of Triangle is : ${0.5*base*height}");

}