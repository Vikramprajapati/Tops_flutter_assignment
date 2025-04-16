import 'dart:io';
void main()
{
  stdout.write("Enter year : ");
  int year=int.parse(stdin.readLineSync()!);

  if(year%4==0){

        print("$year is a leap year.");

  }
  else{
    print("$year is not a leap year.");
  }

}