import 'package:flutter/material.dart';
import "dart:math";

//on change in text field call check answer then the function will get real answer and current answer from user.
//if both the answer match then change variable function is called
void main() {
  runApp(MaterialApp(title: "title", home: HomePage()));
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var answerController = TextEditingController();
  var value1 = 1;
  var value2 = 2;
  var operationList = ['+', '-', '*', '/'];
  var currentOperation;
  var operationRand = Random();
  @override
  void initState() {
    super.initState();
    currentOperation =
        operationList[operationRand.nextInt(operationList.length)];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: 200,
          child: ListView(children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("$value1", style: TextStyle(fontSize: 50)),
                Text("$currentOperation", style: TextStyle(fontSize: 50)),
                Text("$value2", style: TextStyle(fontSize: 50)),
              ],
            ),
            TextField(
              controller: answerController,
              keyboardType: TextInputType.number,
              onChanged: (value) {
                checkAnswer();
              },
            )
          ]),
        ),
      ),
    );
  }

  void checkAnswer() {
    var realAnswer = getRealAnswer();
    var enteredAnswer = int.parse(answerController.text);

    if (realAnswer == enteredAnswer) {
      changeVariables();
    }
  }

  void changeVariables() {
    var rand = Random();
    setState(() {
      value2 = rand.nextInt(20);
      value1 = value2 + rand.nextInt(20); // An wayaround to keep first value greater than second. Makes it easy for substraction purpose.
      currentOperation =
          operationList[operationRand.nextInt(operationList.length)];
      answerController.clear();
    });
  }

  int getRealAnswer() {
    switch (currentOperation) {
      case "+":
        return value1 + value2;
        break;
      case "-":
        return value1 - value2;
        break;
      case "*":
        return value1 * value2;
        break;
      case "/":
        return value1 ~/ value2;
        break;
    }
    return 0;
  }
}
