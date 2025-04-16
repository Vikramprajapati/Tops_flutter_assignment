import 'dart:io';

void main(){
  stdout.write("Enter 1st number: ");
  double a=double.parse(stdin.readLineSync()!);
  stdout.write("Enter 2nd number: ");
  double b=double.parse(stdin.readLineSync()!);


  print("Addition of  $a and $b is : ${a+b}");
  print("Subtraction of  $a and $b is : ${a-b}");
  print("Multiplication of  $a and $b is : ${a*b}");
  print("Division of  $a and $b is : ${a/b}");
}