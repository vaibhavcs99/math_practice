 int getRealAnswer(value1,value2,currentOperation) {
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

  
  void changeList(bool operCheck, String operation,operationList) {
    if (operCheck) {
      //true received from the checkbox
      if (!operationList.contains(operation)) {
        //if not present then add
        operationList.add(operation);
      }
    } else {
      if (operationList.contains(operation)) {
        operationList.remove(operation);
      }
    }
    print(operationList);
  }

  