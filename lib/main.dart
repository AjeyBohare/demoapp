//import 'package:flutter/material.dart';
//import './MyApp.dart';

void main() {
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
}
