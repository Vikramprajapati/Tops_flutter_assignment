import 'dart:io';

void main()
{
  stdout.write("Enter Principle Amount(p) : ");
  double p=double.parse(stdin.readLineSync()!);

  stdout.write("Enter Interest Rate(R) : ");
  double r=double.parse(stdin.readLineSync()!);

  stdout.write("Enter Time(t) in years : ");
  double t=double.parse(stdin.readLineSync()!);

  print("Simple Interest is : ${(p*r*t)/100}");
}