import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import "calculator_button_layout.dart";
import "calculator_input.dart";

void main() {
  runApp(
      BlocProvider(create: (_) => CalculatorInput(), child: const MainApp()));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        //color: Colors.white,
        theme: ThemeData(
            colorScheme: const ColorScheme.light(),
            textTheme: GoogleFonts.openSansTextTheme()),
        title: 'Calculator',
        home: Scaffold(
          //backgroundColor: Colors.white,
          appBar: AppBar(
            //backgroundColor: Colors.white,
            title: const Text(""),
          ),
          body: const MyCalculator(),
        ));
  }
}

class MyCalculator extends StatelessWidget {
  const MyCalculator({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
      BlocBuilder<CalculatorInput, CalculatorState>(builder: (context, cs) {
        return Container(
            color: Colors.white,
            padding: const EdgeInsets.only(right: 40, left: 40),
            child: Text(cs.input,
                textAlign: TextAlign.right,
                style: const TextStyle(fontSize: 30)));
      }),
      const Expanded(child: CalculatorButtonLayout())
    ]);
  }
}
