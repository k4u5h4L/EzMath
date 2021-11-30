import 'package:flutter/material.dart';
import './widgets/calc_button.dart';
import 'package:math_expressions/math_expressions.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Calculator',
      home: Scaffold(
        backgroundColor: Color(0xff2e3440),
        // appBar: AppBar(
        //   title: const Text('EzMath'),
        // ),
        body: CalciApp(),
      ),
    );
  }
}

class CalciApp extends StatefulWidget {
  const CalciApp({Key? key}) : super(key: key);

  @override
  CalciAppState createState() => CalciAppState();
}

class CalciAppState extends State<CalciApp> {
  String _history = '';
  String _expression = '';

  RegExp operatorRegexp = RegExp(
    r"[-+*\/%]",
    caseSensitive: false,
    multiLine: false,
  );

  // static const IconData backspace =
  //     IconData(0xe0c5, fontFamily: 'MaterialIcons', matchTextDirection: true);

  void numClick(String text) {
    setState(() => _expression += text);
  }

  void allClear(String text) {
    setState(() {
      _history = '';
      _expression = '';
    });
  }

  void backspace(String text) {
    setState(() {
      if (_expression != "") {
        _expression = _expression.substring(0, _expression.length - 1);
      }
    });
  }

  void approx(String text) {
    if (!operatorRegexp.hasMatch(_expression)) {
      var num = double.parse(_expression);

      setState(
        () => _expression = (.5 * num).round().toString(),
      );
    }
  }

  void evaluate(String text) {
    Parser p = Parser();
    Expression exp = p.parse(_expression);
    ContextModel cm = ContextModel();

    setState(() {
      _history = _expression;
      _expression = exp.evaluate(EvaluationType.REAL, cm).toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Expanded(
            child: Container(
              child: Padding(
                padding: const EdgeInsets.only(right: 12),
                child: Text(
                  _history,
                  style: GoogleFonts.rubik(
                    textStyle: const TextStyle(
                      fontSize: 24,
                      color: Colors.grey,
                    ),
                  ),
                ),
              ),
              alignment: const Alignment(1.0, 1.0),
            ),
          ),
          Expanded(
            child: Container(
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Text(
                  _expression != "" ? _expression : "0",
                  style: GoogleFonts.rubik(
                    textStyle: const TextStyle(
                      fontSize: 48,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              alignment: const Alignment(1.0, 1.0),
            ),
          ),
          const SizedBox(height: 40),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Expanded(
                  child: CalcButton(
                    text: 'AC',
                    fillColor: 0xFF3b4252,
                    textSize: 20,
                    callback: allClear,
                  ),
                ),
                Expanded(
                  child: CalcButton(
                    text: "⌫",
                    fillColor: 0xFF3b4252,
                    callback: backspace,
                  ),
                ),
                Expanded(
                  child: CalcButton(
                    text: '%',
                    fillColor: 0xFF434c5e,
                    textColor: 0xFF65BDAC,
                    callback: numClick,
                  ),
                ),
                Expanded(
                  child: CalcButton(
                    text: '/',
                    fillColor: 0xFF434c5e,
                    textColor: 0xFF65BDAC,
                    callback: numClick,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Expanded(
                  child: CalcButton(
                    text: '7',
                    callback: numClick,
                  ),
                ),
                Expanded(
                  child: CalcButton(
                    text: '8',
                    callback: numClick,
                  ),
                ),
                Expanded(
                  child: CalcButton(
                    text: '9',
                    callback: numClick,
                  ),
                ),
                Expanded(
                  child: CalcButton(
                    text: '*',
                    fillColor: 0xFF434c5e,
                    textColor: 0xFF65BDAC,
                    textSize: 24,
                    callback: numClick,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Expanded(
                  child: CalcButton(
                    text: '4',
                    callback: numClick,
                  ),
                ),
                Expanded(
                  child: CalcButton(
                    text: '5',
                    callback: numClick,
                  ),
                ),
                Expanded(
                  child: CalcButton(
                    text: '6',
                    callback: numClick,
                  ),
                ),
                Expanded(
                  child: CalcButton(
                    text: '-',
                    fillColor: 0xFF434c5e,
                    textColor: 0xFF65BDAC,
                    textSize: 38,
                    callback: numClick,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Expanded(
                  child: CalcButton(
                    text: '1',
                    callback: numClick,
                  ),
                ),
                Expanded(
                  child: CalcButton(
                    text: '2',
                    callback: numClick,
                  ),
                ),
                Expanded(
                  child: CalcButton(
                    text: '3',
                    callback: numClick,
                  ),
                ),
                Expanded(
                  child: CalcButton(
                    text: '+',
                    fillColor: 0xFF434c5e,
                    textColor: 0xFF65BDAC,
                    textSize: 30,
                    callback: numClick,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Expanded(
                  child: CalcButton(
                    text: '.',
                    callback: numClick,
                  ),
                ),
                Expanded(
                  child: CalcButton(
                    text: '0',
                    callback: numClick,
                  ),
                ),
                Expanded(
                  child: CalcButton(
                    text: '≈',
                    callback: approx,
                    textSize: 26,
                  ),
                ),
                Expanded(
                  child: CalcButton(
                    text: '=',
                    fillColor: 0xFF434c5e,
                    textColor: 0xFF65BDAC,
                    callback: evaluate,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
