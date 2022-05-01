import 'package:demoapp/MyApp.dart';
import 'package:flutter/material.dart';

void main() {
  //dart_basic();
  runApp(MyApp());
}

class CentreText extends StatelessWidget {
  const CentreText({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Center(
        child: DefaultTextStyle(
          style: TextStyle(),
          child: Text(
            "First App",
            //  textDirection: TextDirection.ltr,
          ),
        ),
      ),
    );
  }
}

class WithoutScaffoldContainer extends StatelessWidget {
  const WithoutScaffoldContainer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.blueAccent,
        child: const Center(
          child: Text("First Widget after Material App",
              style: TextStyle(decoration: TextDecoration.none),
              //without this widget it gives error "RichText widgets require a Directionality widget ancestor."

              textDirection: TextDirection.ltr),
        ));
  }
}

void dart_basic() {
  var runRate = 106.5;
  var count = 10;
  var message = "Message of the day";
  var isLeapYear = false;

  print("runRate data type is \"" + runRate.runtimeType.toString() + "\"");
  print("count data type is \"" + count.runtimeType.toString() + "\"");
  print("message data type is \"" + message.runtimeType.toString() + "\"");
  print(
      "isLeapYear data type is \"" + isLeapYear.runtimeType.toString() + "\"");

  dynamic currentYear = "Twenty Twnety Two";
  print("currentYear data type is \"" +
      currentYear.runtimeType.toString() +
      "\"");

  currentYear = 2022;
  print("currentYear data type is \"" +
      currentYear.runtimeType.toString() +
      "\"");

  /*Same is not possible with var type variable
   *  Compilation error occurred:
   * A value of type 'String' can't be assigned to a variable of type 'double'
   */
  //runRate="Hundred and Six";//Error
  print("=====Airthemtic Operators===");
  airthmeticoperation();
  print("=====Comparison Operators=======");
  comparisonOperator();
  print("=====String Operators========");
  stringOperation();
  print("=======Loop in Flutter ======");
  loopSample();
  print("===Condition in Flutter ====");
  conditionSample();
  print("====Collection List====");
  simpleCollections();
  print("===Function with named paramter and one required parameter");
  print(fullNameWithNamedParam(firstname: "Sachin"));
  print(fullNameWithNamedParam(firstname: "Sachin", middleName: "Ramesh"));
  print(fullNameWithNamedParam(
      firstname: "Sachin", middleName: "Ramesh", lastName: "Tendulkar"));

  print("===Function with paramter and one optionsl parameter");
  print(fullNameWithNamedParam(firstname: "Sachin"));
  print(fullNameWithNamedParam(firstname: "Sachin", middleName: "Ramesh"));
  print(fullNameWithNamedParam(
      firstname: "Sachin", middleName: "Ramesh", lastName: "Tendulkar"));

  print("===Anonymous function===");
  print(increment());
  print(increment(value: 2));
}

void stringOperation() {
  String message = "Hello Everyone!";
  print("length of message: " + message.length.toString());
  print(
      "length of message and String interpolation operator: ${message.length}");
  String? response;
  print("Response from other side: $response");
  print(
      "length of message and String interpolation operator: ${response?.length}");

  response = "Hii!!";
  print("Response from other side: $response");
  print(
      "length of message and String interpolation operator: ${response?.length}");

  String nullMessage;
  //print("Getting Error on null object: $nullMessage");

  String? firstName;
  String lastName = "Neer";
  print("Full Name is: $firstName " + lastName);
}

void airthmeticoperation() {
  int a = 2;
  int b = 3;
  print("$a + $b = ${a + b}");
  print("$a - $b = ${a - b}");
  print("$a * $b = ${a * b}");
  print("$a / $b = ${a / b}");
  print("$a % $b = ${a % b}");
}

void comparisonOperator() {
  int a = 2;
  int b = 3;
  print(" $a < $b =  ${a < b}");
  print(" $a > $b =  ${a > b}");
  print(" $a == $b =  ${a == b}");
  print(" $a != $b =  ${a != b}");
}

void loopSample() {
  for (int i = 0; i < 5; i++) {
    print("for loop iterated $i times");
  }
  print("\n");
  int i = 0;
  while (i < 5) {
    print("while loop iterated $i times");
    i++;
  }
  print("\n");
  i = 0;
  do {
    print("do while loop iterated $i times");
    i++;
  } while (i < 5);
}

void conditionSample() {
  int a = 2, b = 3;
  if (a > b) {
    print("$a > $b is true");
  } else if (a == b) {
    print("$a == $b is true");
  } else {
    print("$a < $b is true");
  }

  print("==ternary operator ===");

  a > b
      ? print("$a > $b is true")
      : a == b
          ? print("$a == $b is true")
          : print("$a < $b is true");
}

void simpleCollections() {
  List colors = ["Red", "Black", "Blue", "Yellow", 2];
  print("===for-each loop===");
  for (var color in colors) {
    print(color);
  }

  colors.add("Green");
  colors.addAll(["Purple", "White"]);
  print("===Traverse through iterator==");
  Iterator iterator = colors.iterator;
  while (iterator.moveNext()) {
    print(iterator.current);
  }

  print("====Map in Dart==");
  Map<String, String> maps = {
    "e": "First",
    "B": "Second",
    "G": "Third",
    "D": "Fourth",
    "A": "Fifth",
    "E": "Sixth"
  };

  for (var key in maps.keys) {
    print("String $key is ${maps[key]}");
  }
}

String fullNameWithNamedParam(
    {required String firstname, String? middleName, String lastName = ""}) {
  return middleName == null
      ? "$firstname  $lastName"
      : "$firstname $middleName $lastName";
}

String fullName(String firstname, String? middleName, {String lastName = ""}) {
  return middleName == null
      ? "$firstname  $lastName"
      : "$firstname $middleName $lastName";
}

var increment = ({value}) => value == null ? 0 : value + 1;
