import 'dart:developer';
import 'dart:io';

void main()
{
 stdout.write("Enter Number: ");
 double num=double.parse(stdin.readLineSync()!);

 if(num>0)
   {
     print("$num is positive number.");
   }
 else if(num<0)
   {
     print("$num is negative number.");
   }
 else{
   print("Number is Zero");
 }
}