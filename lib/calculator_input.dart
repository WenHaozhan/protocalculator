import 'package:flutter/material.dart';

class CalculatorInput extends ChangeNotifier {
  String input = "";

  void add(String c) {
    if (c != '=') {
      input += c;
    } else {
      var temp = input.split(RegExp(r'[+\-×÷]'));
      assert(temp.length == 2);
      String op = input[temp[0].length];
      int num1 = int.parse(temp[0]);
      int num2 = int.parse(temp[1]);

      switch (op) {
        case '+':
          input = "${num1 + num2}";
        case '-':
          input = "${num1 - num2}";
        case '×':
          input = "${num1 * num2}";
        case '÷':
          input = "${num1 / num2}";
        default:
          //error
      }
    }
    notifyListeners();
  }
}