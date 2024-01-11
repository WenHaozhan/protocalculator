import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import "calculator_button.dart";
import "calculator_input.dart";

void main() {
  runApp(ChangeNotifierProvider(create: (context) => CalculatorInput(), child: const MainApp()));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text(""),
        ),
        body: MyCalculator(),
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
        Consumer<CalculatorInput>(
           builder: (context, input, child) {
            return Text(input.input, textAlign: TextAlign.right);
           }),
        Expanded(child: GridView.count(
            crossAxisCount: 4, 
            children: List<Widget>.from(
              ['7','8','9','×', '4','5','6','÷','1','2','3','-','0','=','+'].map((c)=> 
                Consumer<CalculatorInput>(builder: (context, input, child) {
                  return CalculatorButton(c : c);
                }))
              ) 
          )
        )
      ]
    );
  }
}


