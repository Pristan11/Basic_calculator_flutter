import 'package:flutter/material.dart';

void main() => runApp(Newapp());

class Newapp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
      ),
      home: HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String output = "0";
  String _output = "0";
  double num1 = 0.0;
  double num2 = 0.0;
  String operand = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Calculator"),
        leading: IconButton(icon: Icon(Icons.filter)),
        actions: [IconButton(icon: Icon(Icons.more_vert))],
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Expanded(
              child: Container(
                padding: EdgeInsets.all(10.0),
                alignment: Alignment.bottomRight,
                child: Text(
                  output,
                  style: TextStyle(
                      fontSize: 30.0,
                      fontWeight: FontWeight.w500,
                      color: Colors.lightGreen),
                ),
              ),
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.all(10.0),
                alignment: Alignment.bottomRight,
                child: Text(
                  output,
                  style: TextStyle(
                      fontSize: 50.0,
                      fontWeight: FontWeight.w500,
                      color: Colors.deepOrange),
                ),
              ),
            ),
            Row(
              children: [
                customOutlineButton("9"),
                customOutlineButton("8"),
                customOutlineButton("7"),
                customOutlineButton("+"),
              ],
            ),
            Row(
              children: [
                customOutlineButton("7"),
                customOutlineButton("6"),
                customOutlineButton("5"),
                customOutlineButton("-"),
              ],
            ),
            Row(
              children: [
                customOutlineButton("3"),
                customOutlineButton("2"),
                customOutlineButton("1"),
                customOutlineButton("*"),
              ],
            ),
            Row(
              children: [
                customOutlineButton("C"),
                customOutlineButton("0"),
                customOutlineButton("="),
                customOutlineButton("/"),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget customOutlineButton(String val) {
    return Expanded(
      child: OutlineButton(
        padding: EdgeInsets.all(25.0),
        onPressed: () => btnClicked(val),
        child: Text(
          val,
          style: TextStyle(fontSize: 25.0),
        ),
      ),
    );
  }

  void btnClicked(String buttonText) {
    if (buttonText == "C") {
      _output = "0";
      num1 = 0.0;
      num2 = 0.0;
      operand = "";
    } else if (buttonText == "+" ||
        buttonText == "-" ||
        buttonText == "*" ||
        buttonText == "/") {
      num1 = double.parse(output);
      operand = buttonText;
      _output = "0";
    }
    //else if(buttonText =="."){
    //   if(_output.contains("."){
    //   print("already contains a decimals");
    //   return;
    //   } else{
    //   _output =_output + buttonText;
    //   }
    //   }
    else if (buttonText == "=") {
      num2 = double.parse(output);
      if (operand == "+") {
        _output = (num1 + num2).toString();
      }
      if (operand == "-") {
        _output = (num1 - num2).toString();
      }
      if (operand == "*") {
        _output = (num1 + num2).toString();
      }
      if (operand == "/") {
        _output = (num1 + num2).toString();
      }

      num1 = 0.0;
      num2 = 0.0;
      operand = "";
    } else {
      _output = _output + buttonText;
    }

    print(_output);
    setState(() {
      output = double.parse(_output).toStringAsFixed(2);
    });
  }

  // if (btnText == "+") {
  //     Number = int.parse(Pfirst);
  //     total += Number;
  //     res = "";
  //     Number = 0;
  //   } else if (btnText == "-") {
  //     Number = int.parse(Pfirst);
  //     total -= Number;
  //     Pfirst = "";
  //     Number = 0;
  //   } else if (btnText == "*") {
  //     Number = int.parse(Pfirst);
  //     total *= Number;
  //     Pfirst = "";
  //     Number = 0;
  //   } else if (btnText == "/") {
  //     Number = int.parse(Pfirst);
  //     total = (total / Number) as int;
  //     Pfirst = "";
  //     Number = 0;
  //   } else if (btnText == "=") {
  //     res = total.toString();
  //   } else if (btnText == "C") {
  //     total = 0;
  //   res = "";
  //   Number = 0;
  // } else {
  //   res = Pfirst + btnText;
  // }
  //
  // setState(() {
  //   Pfirst = res;
  // });
}
