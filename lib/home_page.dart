import 'package:calculator_app/button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var userInput = '';
  var answer = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Align(
                    alignment: Alignment.bottomRight,

                    child: Text(
                      userInput,
                      style: TextStyle(fontSize: 25, color: Colors.white),
                    ),
                  ),
                  SizedBox(height: 7,),
                  Text(
                    answer,
                    style: TextStyle(fontSize: 25, color: Colors.white),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 2,
              child: Column(
                children: [
                  Row(
                    children: [
                      MyButton(
                        title: 'AC',
                        onpress: () {
                          userInput = '';
                          answer = '';
                          setState(() {});
                        },
                      ),
                      MyButton(
                        title: '+/-',
                        onpress: () {
                          userInput += '+/-';
                          setState(() {});
                        },
                      ),
                      MyButton(
                        title: '%',
                        onpress: () {
                          userInput += '%';
                          setState(() {});
                        },
                      ),
                      MyButton(
                        title: '/',
                        onpress: () {
                          userInput += '/';
                          setState(() {});
                        },
                        color: Colors.orange,
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      MyButton(
                        title: '7',
                        onpress: () {
                          userInput += '7';
                          setState(() {});
                        },
                      ),
                      MyButton(
                        title: '8',
                        onpress: () {
                          userInput += '8';
                          setState(() {});
                        },
                      ),
                      MyButton(
                        title: '0',
                        onpress: () {
                          userInput += '0';
                          setState(() {});
                        },
                      ),
                      MyButton(
                        title: 'x',
                        onpress: () {
                          userInput += 'x';
                          setState(() {});
                        },
                        color: Colors.orange,
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      MyButton(
                        title: '4',
                        onpress: () {
                          userInput += '4';
                          setState(() {});
                        },
                      ),
                      MyButton(
                        title: '5',
                        onpress: () {
                          userInput += '5';
                          setState(() {});
                        },
                      ),
                      MyButton(
                        title: '6',
                        onpress: () {
                          userInput += '6';
                          setState(() {});
                        },
                      ),
                      MyButton(
                        title: '-',
                        onpress: () {
                          userInput += '-';
                          setState(() {});
                        },
                        color: Colors.orange,
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      MyButton(
                        title: '1',
                        onpress: () {
                          userInput += '1';
                          setState(() {});
                        },
                      ),
                      MyButton(
                        title: '2',
                        onpress: () {
                          userInput += '2';
                          setState(() {});
                        },
                      ),
                      MyButton(
                        title: '3',
                        onpress: () {
                          userInput += '3';
                          setState(() {});
                        },
                      ),
                      MyButton(
                        title: '+',
                        onpress: () {
                          userInput += '+';
                          setState(() {});
                        },
                        color: Colors.orange,
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      MyButton(
                        title: '0',
                        onpress: () {
                          userInput += '0';
                          setState(() {});
                        },
                      ),
                      MyButton(
                        title: '.',
                        onpress: () {
                          userInput += '.';
                          setState(() {});
                        },
                      ),
                      MyButton(
                        title: 'DEL',
                        onpress: () {
                          userInput = userInput.substring(
                            0,
                            userInput.length - 1,
                          );
                          setState(() {});
                        },
                      ),
                      MyButton(
                        title: '=',
                        onpress: () {
                          equalPress();
                          setState(() {});
                        },
                        color: Colors.orange,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void equalPress() {
    String finalUserInput = userInput;
    finalUserInput = finalUserInput.replaceAll('x', '*');
    Parser p = Parser();
    Expression expression = p.parse(finalUserInput);
    ContextModel contextModel = ContextModel();
    double evaluate = expression.evaluate(EvaluationType.REAL, ContextModel());
    setState(() {
      answer = evaluate.toString();
    });
  }
}
