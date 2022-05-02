import 'package:flutter/material.dart';

class IPLInfoApp extends StatelessWidget {
  const IPLInfoApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'IPL Info App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:
          //WithoutScaffoldContainer()
          const MyHomePage(title: 'IPL info App'),
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
  Map<String, String> IPLTeamLogo = {
    "CSK": "CSK-Logo.png",
    "DC": "Delhi-Capitals-Logo.png",
    "GT": "Gujarat-Titans-Logo.png",
    "KKR": "KKR-Logo.png",
    "LSG": "Lucnow-Supergiants-IPL-Logo.png",
    "MI": "Mumbai-Indians-logo.png",
    "Punjab Kings": "Punjab-Kings.png",
    "RR": "Rajasthan-Royals-Logo.jpeg",
    "RCB": "Royal-Challengers-Bangalore-Logo.png",
    "SRH": "SRH-team-logo.png"
  };
  String? logoFile;

  @override
  void initState() {
    logoFile = IPLTeamLogo["CSK"];
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
            Container(
              height: 200,
              child: Card(
                shadowColor: Colors.blueAccent,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5)),
                child: Center(child: Image.asset("assets/logo/${logoFile}")),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Expanded(
              child: ListView(
                children: IPLTeamLogo.entries
                    .map((entry) => GestureDetector(
                          onTap: () => setState(() {
                            logoFile = entry.value;
                          }),
                          child: ListTile(
                            focusColor: Colors.blue,
                            title: Text(
                              entry.key,
                            ),
                          ),
                        ))
                    .toList(),
              ),
            )
          ],
        ),
      ),
    );
  }
}
