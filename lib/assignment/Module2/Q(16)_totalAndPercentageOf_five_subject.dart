import 'dart:developer';
import 'dart:io';

void main()
{
  int total;
  double percentage;
  stdout.write("Enter 1st subject mark: ");
  int mark1=int.parse(stdin.readLineSync()!);

  stdout.write("Enter 2nd subject mark: ");
  int mark2=int.parse(stdin.readLineSync()!);

  stdout.write("Enter 3rd subject mark: ");
  int mark3=int.parse(stdin.readLineSync()!);

  stdout.write("Enter 4th subject mark: ");
  int mark4=int.parse(stdin.readLineSync()!);

  stdout.write("Enter 5th subject mark: ");
  int mark5=int.parse(stdin.readLineSync()!);

if(mark1==null || mark1<0 || mark2==null || mark2<0 || mark3==null || mark3<0 || mark4==null || mark4<0 || mark5==null || mark5<0 ) {
  print("Please enter a valid number between 0 to 100.");
}
else{
   total=mark1+mark2+mark3+mark4+mark5;
   percentage=(total/500)*100;
  print(total);
  print(percentage);

  if(percentage>75){
    print("Distinction");
  }
  else if(percentage > 60 && percentage <= 75){
print("First class");
  }
  else if( percentage >50 && percentage <= 60){
    print("Second class");

  }
  else if(  percentage > 35 && percentage <= 50){
    print("Pass class");

  }
  else{
    print("Fail");
  }


}



}