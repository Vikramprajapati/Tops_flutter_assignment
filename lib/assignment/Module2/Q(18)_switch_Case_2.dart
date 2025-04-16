import 'dart:async';
import 'dart:io';

void main()
{
  double? a,b;

  while(true)
    {
      double? input()  {
        stdout.write("Enter 1st number : ");
        a=double.parse(stdin.readLineSync()!);

        stdout.write("Enter 2nd number : ");
        b=double.parse(stdin.readLineSync()!);
      }

      void menu(){
        print("Enter 1 for Addition.");
        print("Enter 2 for Subtraction.");
        print("Enter 3 for Multiplication.");
        print("Enter 4 for Division ");
        print("Enter 5 for Exit: ");
        stdout.write("Enter your choice:");
      }

      menu();

      int choice=int.parse(stdin.readLineSync()!);

      if(choice==5)
        {
          break;
        }
      else{
        switch(choice)
        {
          case 1:
            input();
            double sum=a!+b!;
            print("Addition of $a and $b is : $sum");

            break;

          case 2:
            input();
            double sub=a!-b!;
            print("Subtraction of $a and $b is : $sub");


            break;

          case 3:
            input();
            double mul=a!*b!;
            print("Multiplication of $a and $b is : $mul");


            break;

          case 4:
            input();
            double div=a!/b!;
            print("Division of $a and $b is : $div");

            break;

          default:
            print("Please enter a valid choice.");

        }
      }
      }





}
