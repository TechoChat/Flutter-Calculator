import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Calculator(),
    );
  }
}

class Calculator extends StatefulWidget {
  const Calculator({super.key});

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  String output = "0";
  String _output = "0";
  String _currentCalculation = "";
  double num1 = 0.0;
  double num2 = 0.0;
  String operand = "";

  buttonPressed(String buttonText) {
    if (buttonText == "C") {
      _output = "0";
      _currentCalculation = "";
      num1 = 0.0;
      num2 = 0.0;
      operand = "";
    } else if (buttonText == "+" ||
        buttonText == "-" ||
        buttonText == "/" ||
        buttonText == "X") {
      num1 = double.parse(output);
      operand = buttonText;
      _output = "0";
      _currentCalculation = "$_currentCalculation $buttonText ";
    } else if (buttonText == ".") {
      if (_output.contains(".")) {
        return;
      } else {
        _output = _output + buttonText;
        _currentCalculation = _currentCalculation + buttonText;
      }
    } else if (buttonText == "=") {
      num2 = double.parse(output);
      if (operand == "+") {
        _output = (num1 + num2).toString();
        _currentCalculation = (num1 + num2).toString();
      }
      if (operand == "-") {
        _output = (num1 - num2).toString();
        _currentCalculation = (num1 - num2).toString();
      }
      if (operand == "X") {
        _output = (num1 * num2).toString();
        _currentCalculation = (num1 * num2).toString();
      }
      if (operand == "/") {
        _output = (num1 / num2).toString();
        _currentCalculation = (num1 / num2).toString();
      }
      num1 = 0.0;
      num2 = 0.0;
      operand = "";
    } else {
      _output = _output + buttonText;
      _currentCalculation = _currentCalculation + buttonText;
    }
    setState(() {
      output = double.parse(_output).toStringAsFixed(2);
    });
  }

  Widget buildButton(String buttonText, Color color, Color textColor) {
    return ElevatedButton(
        onPressed: () => buttonPressed(buttonText),
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.all(20.0),
          shape: const CircleBorder(),
          backgroundColor: color,
        ),
        child: Text(
          buttonText,
          style: TextStyle(fontSize: 35, color: textColor),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Calculator",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.black,
      ),
      body: Container(
        color: Colors.black,
        child: Column(
          children: <Widget>[
            Container(
              alignment: Alignment.centerRight,
              padding: const EdgeInsets.symmetric(
                vertical: 24.0,
                horizontal: 12.0,
              ),
              child: Text(
                output,
                style: const TextStyle(
                  fontSize: 48.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(
                vertical: 24.0,
                horizontal: 12.0,
              ),
              alignment: Alignment.centerRight,
              child: Text(
                _currentCalculation,
                style: const TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            const Expanded(
              child: Divider(
                color: Colors.white,
                thickness: 2.0,
              ),
            ),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    buildButton("7", Colors.grey, Colors.black),
                    buildButton("8", Colors.grey, Colors.black),
                    buildButton("9", Colors.grey, Colors.black),
                    buildButton("/", Colors.amber, Colors.white),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    buildButton("4", Colors.grey, Colors.black),
                    buildButton("5", Colors.grey, Colors.black),
                    buildButton("6", Colors.grey, Colors.black),
                    buildButton("X", Colors.amber, Colors.white),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    buildButton("1", Colors.grey, Colors.black),
                    buildButton("2", Colors.grey, Colors.black),
                    buildButton("3", Colors.grey, Colors.black),
                    buildButton("-", Colors.amber, Colors.white),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    buildButton(".", Colors.grey, Colors.black),
                    buildButton("0", Colors.grey, Colors.black),
                    buildButton("00", Colors.grey, Colors.black),
                    buildButton("+", Colors.amber, Colors.white),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    buildButton("C", Colors.amber, Colors.white),
                    buildButton("=", Colors.amber, Colors.white),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
