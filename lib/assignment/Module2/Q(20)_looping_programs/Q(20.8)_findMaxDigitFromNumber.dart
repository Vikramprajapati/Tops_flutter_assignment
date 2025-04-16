import 'dart:io';

void main() {

  stdout.write('Enter a number: ');
  String? input = stdin.readLineSync();

  if (input != null && input.isNotEmpty) {

    int maxDigit = findMaxDigit(input);
    print('Max number is $maxDigit');
  } else {
    print('No input provided.');
  }
}

int findMaxDigit(String input) {
  int maxDigit = -1;


  for (int i = 0; i < input.length; i++) {

    if (input[i].contains(RegExp(r'\d'))) {
      int digit = int.parse(input[i]);

      if (digit > maxDigit) {
        maxDigit = digit;
      }
    }
  }
  return maxDigit;
}
