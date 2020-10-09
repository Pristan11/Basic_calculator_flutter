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
                  text,
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

  String res, text = "";
  int first, second;
  String oop;
  void btnClicked(String btnText) {
    if (btnText == "C") {
      text = "";
      res = "";
      first = 0;
      second = 0;
    } else if (btnText == "+" ||
        btnText == "-" ||
        btnText == "*" ||
        btnText == "/") {
      first = int.parse(text);
      res = "";
      oop = btnText;
    } else if (btnText == "=") {
      second = int.parse(text);
      if (oop == "+") {
        res = (first + second).toString();
      }
      if (oop == "-") {
        res = (first - second).toString();
      }
      if (oop == "*") {
        res = (first * second).toString();
      }
      if (oop == "/") {
        res = (first / second).toString();
      }
    } else {
      res = int.parse(text + btnText).toString();
    }

    setState(() {
      text = res;
    });
  }
}
