import 'package:flutter/material.dart';

void main() => runApp(CalculatorApp());

class CalculatorApp extends StatefulWidget {
  const CalculatorApp({Key? key}) : super(key: key);

  @override
  State<CalculatorApp> createState() => _CalculatorAppState();
}

class _CalculatorAppState extends State<CalculatorApp> {
  int first = 0;
  int second = 0;
  String opp = '';
  String res = '';
  String text = '0';
  String history = '';

  void btnClicked(String btnText) {
    if (btnText == 'C') {
      res = '';
      text = '0';
      first = 0;
      second = 0;
      history = '';
    } else if (btnText == '+' ||
        btnText == '-' ||
        btnText == 'x' ||
        btnText == '/') {
      first = int.parse(text);
      res = '';
      opp = btnText;
      history = opp;
    } else if (btnText == '=') {
      second = int.parse(text);
      if (opp == '+') {
        res = (first + second).toString();
        history = first.toString() + opp.toString() + second.toString();
      } else if (opp == '-') {
        res = (first - second).toString();
        history = first.toString() + opp.toString() + second.toString();
      } else if (opp == 'x') {
        res = (first * second).toString();
        history = first.toString() + opp.toString() + second.toString();
      } else if (opp == '/') {
        res = (first / second).toString();
        history = first.toString() + opp.toString() + second.toString();
      }
    } else {
      res = int.parse(text + btnText).toString();
      history = res;
    }

    setState(() {
      text = res;
    });
  }

  @override
  Widget customBtn(String value) {
    return Expanded(
        child: OutlinedButton(
      onPressed: () => btnClicked(value),
      style: ButtonStyle(
        padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.all(30.0)),
      ),
      child: Text(
        value,
        style: TextStyle(fontSize: 30.0, color: Colors.grey),
      ),
    ));
  }

  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          backgroundColor: Colors.blueGrey[800],
          appBar: AppBar(
            title: Text('Calculator'),
            backgroundColor: Colors.blueGrey[900],
          ),
          body: Container(
            child: Column(
              children: [
                Expanded(
                  child: Container(
                    alignment: Alignment.bottomRight,
                    child: Text(
                      history,
                      style: TextStyle(
                          fontSize: 40.0,
                          color: Colors.grey[500]),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    alignment: Alignment.bottomRight,
                    child: Text(
                      text,
                      style: TextStyle(
                          fontSize: 60.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey[200]),
                    ),
                  ),
                ),
                Row(
                  children: [
                    customBtn('9'),
                    customBtn('8'),
                    customBtn('7'),
                    customBtn('+')
                  ],
                ),
                Row(
                  children: [
                    customBtn('6'),
                    customBtn('5'),
                    customBtn('4'),
                    customBtn('-')
                  ],
                ),
                Row(
                  children: [
                    customBtn('3'),
                    customBtn('2'),
                    customBtn('1'),
                    customBtn('x')
                  ],
                ),
                Row(
                  children: [
                    customBtn('C'),
                    customBtn('0'),
                    customBtn('='),
                    customBtn('/')
                  ],
                ),
              ],
            ),
          )),
    );
  }
}
