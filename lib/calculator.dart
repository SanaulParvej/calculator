import 'package:calculator/widget/calculatorButton.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String _output = '0';
  String _input = '';
  String operand = '';
  double num1 = 0;
  double num2 = 0;

  void buttonPressd(String value) {
    setState(() {
      if (value == 'C') {
        _output = '0';
        _input = '';
        operand = '';
        num1 = 0;
        num2 = 0;
      } else if (value == "=") {
        num2 = double.parse(_input);
        if (operand == '+') {
          _output = (num1 + num2).toString();
        } else if (operand == '-') {
          _output = (num1 - num2).toString();
        } else if (operand == '×') {
          _output = (num1 * num2).toString();
        } else if (operand == '÷') {
          _output = (num2 != 0) ? (num1 / num2).toString() : 'Error';
        }
        _input = _output;
      } else if (['+', '-', '×', '÷'].contains(value)) {
        num1 = double.parse(_input);
        operand = value;
        _input = '';
      } else {
        _input += value;
        _output = _input;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text("Calculator"),
        centerTitle: true,
        backgroundColor: Colors.orange,
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              alignment: Alignment.bottomRight,
              padding: EdgeInsets.all(24),
              child: Text(
                _output,
                style: TextStyle(
                    fontSize: 50,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ),
          ),
          Row(
            children: [
              buildButton(
                text: '7',
                onClick: () => buttonPressd('7'),
              ),
              buildButton(text: '8', onClick: () => buttonPressd('8')),
              buildButton(text: '9', onClick: () => buttonPressd('9')),
              buildButton(
                text: '÷',
                onClick: () => buttonPressd('÷'),
                color: Colors.orange,
              ),
            ],
          ),
          Row(
            children: [
              buildButton(text: '4', onClick: () => buttonPressd('4')),
              buildButton(text: '5', onClick: () => buttonPressd('5')),
              buildButton(text: '6', onClick: () => buttonPressd('6')),
              buildButton(
                text: '×',
                onClick: () => buttonPressd('×'),
                color: Colors.orange,
              ),
            ],
          ),
          Row(
            children: [
              buildButton(text: '1', onClick: () => buttonPressd('1')),
              buildButton(text: '2', onClick: () => buttonPressd('2')),
              buildButton(text: '3', onClick: () => buttonPressd('3')),
              buildButton(
                text: '-',
                onClick: () => buttonPressd('-'),
                color: Colors.orange,
              ),
            ],
          ),
          Row(
            children: [
              buildButton(
                text: 'C',
                onClick: () => buttonPressd('C'),
                color: Colors.red,
              ),
              buildButton(text: '0', onClick: () => buttonPressd('0')),
              buildButton(
                text: '=',
                onClick: () => buttonPressd('='),
                color: Colors.green,
              ),
              buildButton(
                text: '+',
                onClick: () => buttonPressd('+'),
                color: Colors.orange,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
