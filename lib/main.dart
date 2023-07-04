// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';
import 'package:vault_calc_1/vault.dart';

import 'button.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        routes: {
          // When navigating to the "/" route, build the FirstScreen widget.
          '/': (context) => MyHomePage(),
          // When navigating to the "/second" route, build the SecondScreen widget.
          '/second': (context) => VoltPage(),
        });
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var userquestion = '';

  var useranswer = '';

  bool Opretor(String x) {
    if (x == '*' ||
        x == '(' ||
        x == '/' ||
        x == '-' ||
        x == '+' ||
        x == '=' ||
        x == ')') {
      return true;
    } else {
      return false;
    }
  }

  List<String> botton = [
    'AC',
    '(',
    ')',
    '/',
    '9',
    '8',
    '7',
    '*',
    '6',
    '5',
    '4',
    '-',
    '3',
    '2',
    '1',
    '+',
    '0',
    '.',
    'del',
    '='
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 5, 1, 10),
      body: Column(
        children: [
          Expanded(
            child: Container(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      alignment: Alignment.bottomLeft,
                      child: Text(
                        userquestion,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 35,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                    Container(
                      alignment: Alignment.bottomRight,
                      child: Text(
                        useranswer,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 35,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ]),
              // color: Colors.amber,
            ),
          ),
          Expanded(
              flex: 2,
              child: Container(
                  child: GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 4),
                      itemCount: botton.length,
                      itemBuilder: (BuildContext context, int index) {
                        if (index == 0) {
                          return MaterialButton(
                            onPressed: () {
                              setState(() {
                                userquestion = '';
                                useranswer = '';
                              });
                            },
                            child: MyButton(
                                color: Opretor(botton[index])
                                    ? Color.fromARGB(255, 54, 23, 107)
                                    : Color.fromARGB(255, 9, 20, 31),
                                textcolor: Colors.white,
                                text: botton[index]),
                          );
                        } else if (index == 18) {
                          return MaterialButton(
                            onPressed: () {
                              if (userquestion.length == 0) {
                              } else {
                                setState(() {
                                  userquestion = userquestion.substring(
                                      0, userquestion.length - 1);
                                });
                              }
                            },
                            child: MyButton(
                                color: Opretor(botton[index])
                                    ? Color.fromARGB(255, 54, 23, 107)
                                    : Color.fromARGB(255, 42, 22, 22),
                                textcolor: Colors.white,
                                text: botton[index]),
                          );
                        } else if (index == 19) {
                          return MaterialButton(
                            onPressed: () {
                              setState(() {
                                if (userquestion == '696969') {
                                  Navigator.pushNamed(context, '/second');
                                } else {
                                  equalto();
                                }
                              });
                            },
                            child: MyButton(
                                color: Opretor(botton[index])
                                    ? Color.fromARGB(255, 54, 23, 107)
                                    : Color.fromARGB(255, 54, 23, 107),
                                textcolor: Colors.white,
                                text: botton[index]),
                          );
                        } else {
                          return MaterialButton(
                            onPressed: () {
                              setState(() {
                                userquestion += botton[index];
                              });
                            },
                            child: MyButton(
                                color: Opretor(botton[index])
                                    ? Color.fromARGB(255, 54, 23, 107)
                                    : Color.fromARGB(255, 5, 53, 62),
                                textcolor: Colors.white,
                                text: botton[index]),
                          );
                        }
                      })))
        ],
      ),
    );
  }

  void equalto() {
    setState(() {
      var finalquestion = userquestion;
      Parser p = Parser();
      Expression exp = p.parse(finalquestion);
      ContextModel cm = ContextModel();
      double eval = exp.evaluate(EvaluationType.REAL, cm);
      useranswer = eval.toString();
    });
  }
}
