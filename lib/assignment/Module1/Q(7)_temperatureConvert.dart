import 'dart:io';

void main()
{
  stdout.write("Enter temperature (degree centigrade) : ");
  double cent=double.parse(stdin.readLineSync()!);

  double fahrenheit=(cent * 9 / 5) + 32;

  print("Temperature in Fahrenheit is : $fahrenheit");
}