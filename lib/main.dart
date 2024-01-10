import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
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

class MyCalculator extends StatefulWidget {
  const MyCalculator({super.key});

  @override 
  State<StatefulWidget> createState() => _CalculatorState();
}

class _CalculatorState extends State<MyCalculator> {
  String input = "";

  @override
  Widget build(BuildContext context) {
    return  Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(input, textAlign: TextAlign.right), 
        Expanded(child: GridView.count(
            crossAxisCount: 4, 
            children: List<Widget>.from(
              ['7','8','9','×', '4','5','6','÷','1','2','3','-','0','=','+'].map((c)=> CalculatorButton(c : c, callback: clickHandler))
            ) 
          )
        )
      ]
    );
  }

  clickHandler(String s) {
    setState(() {
      if (s.compareTo('=') != 0) {
      input += s;
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
    });
  }

}


class CalculatorButton extends StatelessWidget {
  const CalculatorButton({required this.c, required this.callback , super.key});
  final String c;
  final void Function(String) callback;

  @override
  Widget build(BuildContext context) {
    return TextButton(onPressed: () => callback(c), child: Text(c));
  }
}