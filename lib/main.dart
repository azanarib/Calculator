import 'package:calculator/Components/structure.dart';
import 'package:flutter/material.dart';
import 'package:calculator/Components/button.dart';
import 'package:math_expressions/math_expressions.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          titleTextStyle: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: Colors.amber,
          ),
          backgroundColor: Colors.black,
        ),
      ),
      home: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          title: Text(
            'Calculator',
            style: TextStyle(
              fontSize: 40,
            ),
          ),
        ),
        body: Padding(
          padding: EdgeInsets.all(10.0),
          child: CustomCalculatorState(),
        ),
      ),
    );
  }
}

class CustomCalculatorState extends StatefulWidget {
  const CustomCalculatorState({super.key});

  @override
  State<CustomCalculatorState> createState() => _CustomCalculatorStateState();
}

class _CustomCalculatorStateState extends State<CustomCalculatorState> {
  var userInput = '';
  var answer = '';
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Align(
                  alignment: AlignmentDirectional.topEnd,
                  child: Text(
                    userInput,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 60,
                    ),
                  ),
                ),
                Text(
                  answer,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 60,
                  ),
                ),
              ],
            ),
          ),
        ),
        Expanded(
          flex: 2,
          child: Wrap(
            children: [
              buildButton(
                CalculatorStructure.ac,
                buttonColor: Colors.amber,
                onPress: () {
                  setState(() {
                    userInput = userInput.substring(
                      0,
                      userInput.length - 1,
                    );
                    answer = '';
                  });
                },
              ),
              buildButton(
                CalculatorStructure.sign,
                onPress: () {
                  userInput += '-';
                },
                buttonColor: Colors.amber,
              ),
              buildButton(CalculatorStructure.percentage,
                  buttonColor: Colors.amber, onPress: () {
                setState(() {
                  userInput += '%';
                });
              }),
              buildButton(CalculatorStructure.divide, buttonColor: Colors.amber,
                  onPress: () {
                setState(() {
                  userInput += '/';
                });
              }),
              buildButton(CalculatorStructure.seven, onPress: () {
                setState(() {
                  userInput += '7';
                });
              }),
              buildButton(CalculatorStructure.eight, onPress: () {
                setState(() {
                  userInput += '8';
                });
              }),
              buildButton(CalculatorStructure.nine, onPress: () {
                setState(() {
                  userInput += '9';
                });
              }),
              buildButton(CalculatorStructure.multiply,
                  buttonColor: Colors.amber, onPress: () {
                setState(() {
                  userInput += 'x';
                });
              }),
              buildButton(CalculatorStructure.four, onPress: () {
                setState(() {
                  userInput += '4';
                });
              }),
              buildButton(CalculatorStructure.five, onPress: () {
                setState(() {
                  userInput += '5';
                });
              }),
              buildButton(CalculatorStructure.six, onPress: () {
                setState(() {
                  userInput += '6';
                });
              }),
              buildButton(CalculatorStructure.subtraction,
                  buttonColor: Colors.amber, size: 60, onPress: () {
                setState(() {
                  userInput += '-';
                });
              }),
              buildButton(CalculatorStructure.one, onPress: () {
                setState(() {
                  userInput += '1';
                });
              }),
              buildButton(CalculatorStructure.two, onPress: () {
                setState(() {
                  userInput += '2';
                });
              }),
              buildButton(CalculatorStructure.three, onPress: () {
                setState(() {
                  userInput += '3';
                });
              }),
              buildButton(CalculatorStructure.addition,
                  buttonColor: Colors.amber, onPress: () {
                setState(() {
                  userInput += '+';
                });
              }),
              buildButton(CalculatorStructure.zero, onPress: () {
                setState(() {
                  userInput += '0';
                });
              }),
              buildButton(CalculatorStructure.point, onPress: () {
                setState(() {
                  userInput += '0.';
                });
              }),
              buildButton(CalculatorStructure.delete, onPress: () {
                setState(() {
                  userInput = '';
                  answer = '';
                });
              }),
              buildButton(CalculatorStructure.equalSign,
                  buttonColor: Colors.amber, onPress: () {
                setState(() {
                  equalBtn();
                });
              }),
            ],
          ),
        ),
      ],
    );
  }

  void equalBtn() {
    String finalUserInput = userInput;
    finalUserInput = userInput.replaceAll('x', '*');

    Parser p = Parser();
    Expression expression = p.parse(finalUserInput);
    ContextModel contextModel = ContextModel();
    double evaluation = expression.evaluate(EvaluationType.REAL, contextModel);
    answer = evaluation.toString();
  }
}
