import 'dart:io';

void main()
{
  stdout.write("Enter marks of 1st subject : ");
  double mark1=double.parse(stdin.readLineSync()!);

  stdout.write("Enter marks of 2nd subject : ");
  double mark2=double.parse(stdin.readLineSync()!);

  stdout.write("Enter marks of 3rd subject : ");
  double mark3=double.parse(stdin.readLineSync()!);

  stdout.write("Enter marks of 4th subject : ");
  double mark4=double.parse(stdin.readLineSync()!);

  stdout.write("Enter marks of 5th subject : ");
  double mark5=double.parse(stdin.readLineSync()!);


  double totalMarks=mark1+mark2+mark3+mark4+mark5;

  print("Sum of all marks is : $totalMarks");
  print("Percentage is :${(totalMarks/500)*100}");


}