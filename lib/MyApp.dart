import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: WithoutScaffoldContainer()
        //const MyHomePage(title: 'Demo App'),
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
          child: Text(
            "First Widget after Material App",
            style: TextStyle(decoration: TextDecoration.none),
          ),
        ));
  }
}
