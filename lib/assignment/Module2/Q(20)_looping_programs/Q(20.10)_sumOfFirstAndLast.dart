import 'dart:io';

void main() {

  stdout.write('Enter a number: ');
  String? input = stdin.readLineSync();

  if (input != null && input.isNotEmpty) {

    int sum = sumOfFirstAndLastDigit(input);
    print('The sum of the first and last digits is $sum');
  } else {
    print('No input provided.');
  }
}

int sumOfFirstAndLastDigit(String input) {

  String numberString = input.replaceAll('-', '');


  if (numberString.isEmpty) {
    throw FormatException('The input does not contain any digits.');
  }


  String firstChar = numberString[0];
  String lastChar = numberString[numberString.length - 1];

  int firstDigit = int.parse(firstChar);
  int lastDigit = int.parse(lastChar);

  return firstDigit + lastDigit;
}
