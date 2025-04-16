import 'dart:io';

void main() {

  stdout.write('Enter a number: ');
  String? input = stdin.readLineSync();

  if (input != null && input.isNotEmpty) {

    int sum = calculateDigitSum(input);
    print('The sum of the digits is $sum');
  } else {
    print('No input provided.');
  }
}

int calculateDigitSum(String input) {
  int sum = 0;


  for (int i = 0; i < input.length; i++) {
   
    if (input[i].contains(RegExp(r'\d'))) {
      int digit = int.parse(input[i]);

      sum += digit;
    }
  }

  return sum;
}
