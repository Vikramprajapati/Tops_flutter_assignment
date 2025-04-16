import 'dart:io';

void main()
{
stdout.write("Enter number: ");
var num=double.parse(stdin.readLineSync()!);

print("Square of $num is : ${num*num}");
print("Cube of $num is : ${num*num*num}");
}