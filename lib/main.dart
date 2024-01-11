import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import "calculator_button.dart";
import "calculator_input.dart";

void main() {
  runApp(BlocProvider(create: (_) => CalculatorInput(), child: const MainApp()));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text(""),
        ),
        body: const MyCalculator(),
      )
    );
  }

}


class MyCalculator extends StatelessWidget {
  const MyCalculator({super.key});

  @override 
  Widget build(BuildContext context) {
    return  Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        BlocBuilder<CalculatorInput, String>(
           builder: (context, input) {
            return Container( padding: const EdgeInsets.only(right: 40) , child : Text(input, textAlign: TextAlign.right, style: const TextStyle(fontSize: 30) ));
           }),
        Expanded(child: GridView.count(
            crossAxisCount: 4, 
            children: List<Widget>.from(
              ['7','8','9','×', '4','5','6','÷','1','2','3','-','','0','=','+'].map((c)=> 
                BlocBuilder<CalculatorInput, String>(builder: (context, input) {
                  return CalculatorButton(c : c);
                }))
              ) 
          )
        )
      ]
    );
  }
}


