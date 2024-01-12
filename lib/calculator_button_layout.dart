import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import "calculator_input.dart";
import "calculator_button.dart";

var buttonBuilder =
    (c) => BlocBuilder<CalculatorInput, String>(builder: (context, input) {
          return CalculatorButton(c: c);
        });

class CalculatorButtonLayout extends StatelessWidget {
  const CalculatorButtonLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Expanded(
          child: Row(
              children: List<Widget>.from([
        '7',
        '8',
        '9',
        '×',
      ].map(buttonBuilder)))),
      Expanded(
          child: Row(
              children: List<Widget>.from([
        '4',
        '5',
        '6',
        '÷',
      ].map(buttonBuilder)))),
      Expanded(
          child: Row(
              children: List<Widget>.from([
        '1',
        '2',
        '3',
        '-',
      ].map(buttonBuilder)))),
      Expanded(
          child: Row(
              children: List<Widget>.from([
        '',
        '0',
        '=',
        '+',
      ].map(buttonBuilder))))
    ]);
  }
}
