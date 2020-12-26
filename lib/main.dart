import 'package:flutter/material.dart';
import "dart:math";
import 'Util/mathsOperations.dart';

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
  var operationList = ['+'];
  var currentOperation;
  var operationRand = Random();
  var plusCheck = true;
  var minusCheck = false;
  var multiCheck = false;
  var divCheck = false;
  @override
  void initState() {
    super.initState();
    currentOperation =
        operationList[operationRand.nextInt(operationList.length)];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Maths Practice"),
      ),
      body: Center(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: 200,
          child: ListView(children: [
            operationCheckBox(),
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
                checkAnswer(value1,value2,currentOperation);
              },
            ),
            Align(
              child: RaisedButton(
                  child: Text("Skip"),
                  onPressed: () {
                    changeVariables();
                  }),
            ),
          ]),
        ),
      ),
    );
  }

  Widget operationCheckBox() {
    return Row(mainAxisAlignment: MainAxisAlignment.center,
        children: [
    checkBoxSkeleton("+"),
    checkBoxSkeleton("-"),
    checkBoxSkeleton("*"),
    checkBoxSkeleton("/")
        ],
      );
  }

  Column checkBoxSkeleton(String opr) {
    return Column(
      children: [
        Text(opr),
        Checkbox(
          value: giveOprCheck(opr),
          onChanged: (value) {
            setState(() {
              changeList(value, opr,operationList);
              checksCurrentValue("$opr", value);
            });
          },
        ),
      ],
    );
  }

  giveOprCheck(String opr) {
    
    switch (opr) {
      case "+":
        return plusCheck;
      case "-":
        return minusCheck;
      case "*":
        return multiCheck;
      case "/":
        return divCheck;
    }
  }

  void checksCurrentValue(String opr, bool value) {
    //used to set current value of checkbox.
    setState(() {
      switch (opr) {
        case "+":
          plusCheck = value;
          break;
        case "-":
          minusCheck = value;

          break;
        case "*":
          multiCheck = value;
          break;
        case "/":
          divCheck = value;
          break;
      }
    });
  }

  void checkAnswer(value1,value2,currentOperation) {
    var realAnswer = getRealAnswer(value1,value2,currentOperation);
    var enteredAnswer = int.parse(answerController.text);

    if (realAnswer == enteredAnswer) {
      changeVariables();
    }
  }

  void changeVariables() {
    var rand = Random();
    setState(() {
      value2 = rand.nextInt(20) + 1;
      value1 = value2 +
          rand.nextInt(
              20); // An wayaround to keep first value greater than second. Makes it easy for substraction purpose.
      currentOperation =
          operationList[operationRand.nextInt(operationList.length)];
      answerController.clear();
    });
  }

 

}
