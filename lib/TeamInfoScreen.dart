import 'package:flutter/material.dart';

class TeamInfoScreen extends StatefulWidget {
  static const routeName = "/Team_info_screen";

  @override
  State<TeamInfoScreen> createState() => _TeamInfoScreenState();
}

class _TeamInfoScreenState extends State<TeamInfoScreen> {
  var apiUrl = "";
  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as int;
    print(args);
    return Scaffold(
        body: Center(
      child: Text(
        args.toString(),
        style: TextStyle(color: Colors.red),
      ),
    ));
  }
}
