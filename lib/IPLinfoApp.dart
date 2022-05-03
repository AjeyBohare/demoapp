import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import 'TeamInfoScreen.dart';

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
      home: const MyHomePage(title: 'IPL info App'),
      routes: {
        TeamInfoScreen.routeName: (context) => TeamInfoScreen(),
      },
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
  int i = 0;

  @override
  void initState() {
    logoFile = IPLTeamLogo["CSK"];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    i = 0;
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
                child: Container(
                    padding: EdgeInsets.all(0),
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("assets/logo/${logoFile}"),
                          fit: BoxFit.cover),
                    )),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Expanded(
              child: ListView.separated(
                itemCount: IPLTeamLogo.length,
                itemBuilder: (_, index) {
                  var key = IPLTeamLogo.keys.elementAt(i);
                  return GestureDetector(
                    onTap: () => setState(() {
                      logoFile = IPLTeamLogo[key];
                    }),
                    child: Slidable(
                      endActionPane: ActionPane(
                        motion: ScrollMotion(),
                        children: [
                          SlidableAction(
                            // An action can be bigger than the others.
                            flex: 1,
                            onPressed: (_) {
                              Navigator.of(context).pushNamed(
                                  TeamInfoScreen.routeName,
                                  arguments: (index + 1));
                            },
                            backgroundColor: Color(0xFF7BC043),
                            foregroundColor: Colors.white,
                            icon: Icons.info_outline_rounded,
                            label: 'Team Info',
                          ),
                        ],
                      ),
                      child: ListTile(
                        leading: Text("${++i}"),
                        focusColor: Colors.blue,
                        title: Text(
                          key,
                        ),
                        trailing: FavoriteButton(
                          isFavorite: false,
                        ),
                      ),
                    ),
                  );
                },
                separatorBuilder: (_, index) => Divider(
                  height: 8,
                  thickness: 2.0,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class FavoriteButton extends StatefulWidget {
  FavoriteButton({Key? key, required this.isFavorite}) : super(key: key);
  bool isFavorite;
  @override
  State<FavoriteButton> createState() => _FavoriteButtonState();
}

class _FavoriteButtonState extends State<FavoriteButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => setState(() {
        widget.isFavorite = !widget.isFavorite;
      }),
      child: Icon(
          widget.isFavorite
              ? Icons.favorite_rounded
              : Icons.favorite_border_rounded,
          color: Colors.red[300]),
    );
  }
}
