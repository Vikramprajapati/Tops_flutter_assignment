import 'dart:io';

void main()
{
  stdout.write("Enter number: ");
  String number=stdin.readLineSync()!;


  String reverse=number.split('').reversed.join('');

  print(reverse);

}