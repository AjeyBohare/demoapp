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
      home:
          //WithoutScaffoldContainer()
          const MyHomePage(title: 'Demo App'),
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

class MyHomePage extends StatefulWidget {
  const MyHomePage({required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  double scaleMultiplier = 1;

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
              constraints: BoxConstraints(
                  minWidth: double.infinity, minHeight: 10, maxHeight: 300),
              child: Card(
                shadowColor: Colors.blueAccent,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5)),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  child: Center(
                    child: Text(
                      'Got a scaffold!!',
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
                    ListTile(
                      focusColor: Colors.blue,
                      title: Text(
                        i.toString(),
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
