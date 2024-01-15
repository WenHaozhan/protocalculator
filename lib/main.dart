import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import "calculator_button_layout.dart";
import "calculator_input.dart";

void main() /* async */ {
  // WidgetsFlutterBinding.ensureInitialized();
  // final SharedPreferences prefs = await SharedPreferences.getInstance();
  // final String? input = prefs.getString('input');
  // var ret =
  //     await prefs.setString('input', input != null ? "${input}1" : "123456789");
  // print(await prefs.getString('input'));
  runApp(
      BlocProvider(create: (_) => CalculatorInput(), child: const MainApp()));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        //color: Colors.white,
        home: Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
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
      BlocBuilder<CalculatorInput, String>(builder: (context, input) {
        return Container(
            color: Colors.white,
            padding: const EdgeInsets.only(right: 40, left: 40),
            child: Text(input,
                textAlign: TextAlign.right,
                style: const TextStyle(fontSize: 30)));
      }),
      const Expanded(child: CalculatorButtonLayout())
    ]);
  }
}
