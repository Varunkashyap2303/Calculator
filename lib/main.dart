import 'dart:ui';

import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Calculator'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
 
  
    String output = "0";

    String _output = "0";
    double num1 = 0.0;
    double num2 = 0.0;
    String operand = "";

    buttonPressed(String buttonText) {
      if (buttonText == "CLEAR") {
         _output = "0";
         num1 = 0.0;
         num2 = 0.0;
         operand = "";
      }
      else if(buttonText == "+" || buttonText == "-" || buttonText == "*" || buttonText == "/"){
        num1 = double.parse(output);

        operand = buttonText;

        _output = "0";
      }
      else if(buttonText == "."){
        if(_output.contains(".")){
          print("Already contains a decimal point");
          return;
        }
        else{
          _output = _output + buttonText;
        }
      }
      else if(buttonText == "="){
        num2 = double.parse(output);

        // if(operand == "+"){
        //   _output = (num1 + num2).toString();
        // }
        // if(operand == "-"){
        //   _output = (num1 - num2).toString();
        // }
        // if(operand == "*"){
        //   _output = (num1 * num2).toString();
        // }
        // if(operand == "/"){
        //   _output = (num1 / num2).toString();
        // }
        switch(operand){
          case "+": _output = (num1 + num2).toString();
                    break;
          case "-": _output = (num1 - num2).toString();
                    break;
          case "*": _output = (num1 * num2).toString();
                    break;
          case "/": _output = (num1 / num2).toString();
                    break;
        }

        num1 = 0; 
        num2 = 0;
        operand = "";

      }else{
        _output = _output + buttonText;
      }

      print(_output);

      setState(() {
        output = double.parse(_output).toStringAsFixed(2);
      });
    }

    Widget buildButtonNumber(String buttonText) {
      return new Expanded(
        child: new MaterialButton(
          padding: EdgeInsets.all(24.0),
          child: new Text(
            buttonText,
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          onPressed: () => buttonPressed(buttonText),
          color: Colors.white,
        ),
      );
    }

    Widget buildButtonOperand(String buttonText) {
      return new Expanded(
        child: new MaterialButton(
          padding: EdgeInsets.all(24.0),
          child: new Text(
            buttonText,
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          onPressed: () => buttonPressed(buttonText),
          color: Colors.yellow,
        ),
      );
    }

    Widget buildButtonEquals(String buttonText) {
      return new Expanded(
        child: new MaterialButton(
          padding: EdgeInsets.all(24.0),
          child: new Text(
            buttonText,
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          onPressed: () => buttonPressed(buttonText),
          color: Colors.green,
        ),
      );
    }

    Widget buildButtonClear(String buttonText) {
      return new Expanded(
        child: new MaterialButton(
          padding: EdgeInsets.all(24.0),
          child: new Text(
            buttonText,
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          onPressed: () => buttonPressed(buttonText),
          color: Colors.red,
        ),
      );
    }

   @override
  Widget build(BuildContext context){
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: new Container(
          child: new Column(
            children: <Widget>[
              new Container(
                  alignment: Alignment.centerRight,
                  padding: new EdgeInsets.symmetric(
                      vertical: 24.0, horizontal: 12.0),
                  child: new Text(
                    output,
                    style: new TextStyle(
                        fontSize: 48.0, fontWeight: FontWeight.bold),
                  )),
              new Expanded(
                child: new Divider(),
              ),
              new Column(
                children: [
                  new Row(children: [
                    buildButtonNumber("7"),
                    buildButtonNumber("8"),
                    buildButtonNumber("9"),
                    buildButtonOperand("/")
                  ]),
                  new Row(children: [
                    buildButtonNumber("4"),
                    buildButtonNumber("5"),
                    buildButtonNumber("6"),
                    buildButtonOperand("X")
                  ]),
                  new Row(children: [
                    buildButtonNumber("1"),
                    buildButtonNumber("2"),
                    buildButtonNumber("3"),
                    buildButtonOperand("-")
                  ]),
                  new Row(children: [
                    buildButtonNumber("."),
                    buildButtonNumber("0"),
                    buildButtonClear("AC"),
                    buildButtonOperand("+")
                  ]),
                  new Row(children: [
                    buildButtonEquals("="),
                  ]),
                ],
              )
            ],
          ),
        ));
  }
}
