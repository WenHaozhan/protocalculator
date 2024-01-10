import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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