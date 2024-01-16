import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'calculator_input.freezed.dart';

//import 'package:flutter/material.dart';

@unfreezed
class CalculatorState with _$CalculatorState {
  const factory CalculatorState({required final String input}) =
      _CalculatorState;
}

class CalculatorInput extends Cubit<CalculatorState> {
  CalculatorInput() : super(const CalculatorState(input: ''));

  void add(String c) {
    final cs = state;
    var input = cs.input;
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
    emit(CalculatorState(input: input));
  }
}
