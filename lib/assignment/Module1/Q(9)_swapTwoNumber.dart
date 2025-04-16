import 'dart:io';

void main()
{
  print("Before Swapping numbers :");
  stdout.write("Enter value od a  : ");
  int a=int.parse(stdin.readLineSync()!);

  stdout.write("Enter value od b : ");
  int b=int.parse(stdin.readLineSync()!);

  a=a+b;
  b=a-b;
  a=a-b;

  print("After Swapping numbers :");
  print("Value of a : $a");
  print("Value of b : $b");

}