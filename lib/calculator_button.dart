import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import "calculator_input.dart";

class CalculatorButton extends StatelessWidget {
  const CalculatorButton({required this.c, super.key});
  final String c;

  @override
  Widget build(BuildContext context) {
    final input = context.watch<CalculatorInput>();
    return Expanded(
        child: TextButton(
            onPressed: c == ''
                ? null
                : () {
                    input.add(c);
                  },
            style: const ButtonStyle(
                overlayColor: MaterialStatePropertyAll<Color>(Colors.grey),
                foregroundColor: MaterialStatePropertyAll<Color>(Colors.black),
                backgroundColor: MaterialStatePropertyAll<Color>(Colors.white),
                shape: MaterialStatePropertyAll<RoundedRectangleBorder>(
                    RoundedRectangleBorder())),
            child: Text(c, style: const TextStyle(fontSize: 25))));
  }
}
