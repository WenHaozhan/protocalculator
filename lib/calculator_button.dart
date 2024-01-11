import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import "calculator_input.dart";

class CalculatorButton extends StatelessWidget {
  const CalculatorButton({required this.c, super.key});
  final String c;

  @override
  Widget build(BuildContext context) {
    return TextButton(onPressed: (){
      var input = context.read<CalculatorInput>();
      input.add(c);
    }, child: Text(c));
  }
}