import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

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
      home:
          //WithoutScaffoldContainer()
          const MyHomePage(title: 'Demo App'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  double scaleMultiplier = 1;
  List<String> number = [
    "One",
    "Two",
    "Three",
    "Four",
    "Five",
    "Six",
    "Seven",
    "Eight",
    "Nine",
    "Ten",
    "Eleven",
    "Twelve",
    "Thirteen",
    "Fourteen",
    "Fifteen"
  ];
  String? numberInString;

  @override
  void initState() {
    numberInString = number[0];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            ConstrainedBox(
              constraints: const BoxConstraints(minHeight: 20, maxHeight: 500),
              child: SingleChildScrollView(
                child: Card(
                  shadowColor: Colors.blueAccent,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5)),
                  child: Center(
                    child: Text(
                      numberInString ?? "One",
                      style: Theme.of(context).textTheme.headline4,
                      textScaleFactor: scaleMultiplier,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Expanded(
              child: ListView(
                children: [
                  for (int i = 0; i < 15; i++)
                    GestureDetector(
                      onTap: () => setState(() {
                        numberInString = number[i];
                      }),
                      child: ListTile(
                        focusColor: Colors.blue,
                        title: Text(
                          (i + 1).toString(),
                        ),
                      ),
                    )
                ],
              ),
            )
          ],
        ),
      ),
      floatingActionButton: Container(
        decoration: BoxDecoration(
            border: Border.all(
          color: Colors.red,
        )),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FloatingActionButton(
              onPressed: () =>
                  setState(() => scaleMultiplier = scaleMultiplier * 1.25),
              child: const Icon(Icons.add),
            ),
            SizedBox(
              height: 5,
              width: 5,
            ),
            FloatingActionButton(
              onPressed: () =>
                  setState(() => scaleMultiplier = scaleMultiplier * 0.75),
              child: const Icon(Icons.remove),
            ),
          ],
        ),
      ),
    );
  }
}
