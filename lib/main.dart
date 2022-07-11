import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _MyAppState();
}

class _MyAppState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculator'),
        centerTitle: true,
      ),
      body: Container(
        child: Column(mainAxisAlignment: MainAxisAlignment.end, children: [
          Expanded(
              child: Container(
            padding: EdgeInsets.all(12.0),
            alignment: Alignment.bottomRight,
            child: Text(
              text,
              style: TextStyle(
                  fontSize: 60.0,
                  fontWeight: FontWeight.w500,
                  color: Colors.blueGrey),
            ),
          )),
          Row(
            children: [
              customButton("7"),
              customButton("8"),
              customButton("9"),
              customButton("+"),
            ],
          ),
          Row(
            children: [
              customButton("4"),
              customButton("5"),
              customButton("6"),
              customButton("-"),
            ],
          ),
          Row(
            children: [
              customButton("1"),
              customButton("2"),
              customButton("3"),
              customButton("*"),
            ],
          ),
          Row(
            children: [
              customButton("C"),
              customButton("0"),
              customButton("/"),
              spCustomButton("="),
            ],
          ),
        ]),
      ),
    );
  }

  Widget customButton(String value) {
    return Expanded(
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(padding: EdgeInsets.all(40)),
        onPressed: () => btnClicked(value),
        child: Text(
          value,
          style: TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 22.0,
            color: Colors.grey.shade800,
          ),
        ),
      ),
    );
  }

  Widget spCustomButton(String value) {
    return Expanded(
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          padding: EdgeInsets.all(40),
          backgroundColor: Colors.blue,
        ),
        onPressed: () => btnClicked(value),
        child: Text(
          value,
          style: TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 22.0,
            color: Colors.grey.shade800,
          ),
        ),
      ),
    );
  }

  int first = 0, second = 0;
  String text = '';
  String opp = '';
  String res = '';
  bool flag = false;
  String temp = '';

  void btnClicked(String btnValue) {
    if (btnValue == 'C') {
      res = '';
      text = '';
      first = 0;
      second = 0;
      flag = false;
    } else if (btnValue == '+' ||
        btnValue == '-' ||
        btnValue == '*' ||
        btnValue == '/') {
      first = int.parse(text);
      res = first.toString() + btnValue;
      opp = btnValue;
      flag = true;
    } else if (btnValue == '=') {
      if (opp == "+") {
        res = (first + second).toString();
      }
      if (opp == '-') {
        res = (first - second).toString();
      }
      if (opp == '*') {
        res = (first * second).toString();
      }
      if (opp == '/') {
        res = (first ~/ second).toString();
      }
      first = 0;
      second = 0;
      flag = false;
      temp = '';
    } else if (flag == true) {
      res = '';
      temp = temp + btnValue;
      second = int.parse(temp);
      res = text + btnValue;
    } else {
      res = (text + btnValue).toString();
    }
    setState(() {
      text = res;
    });
    res = '';
  }
}
