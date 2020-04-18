import 'package:covid_tracker/constants/color_constants.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Column(
        children: <Widget>[
          SizedBox(
            height: 100,
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.all(25.0),
              child: Text(
                "Stay Home\nStay Safe",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Container(
            height: 400,
            child: GridView.count(
              crossAxisCount: 2,
              mainAxisSpacing: 5,
              crossAxisSpacing: 5,
              childAspectRatio: 2,
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              children: [
                SummaryBox(
                  title: "Confirmed",
                  count: 746,
                  color: confirmedBoxColor,
                ),
                SummaryBox(
                  title: "Active",
                  count: 626,
                  color: activeBoxColor,
                ),
                SummaryBox(
                  title: "Recovered",
                  count: 67,
                  color: recoveredBoxColor,
                ),
                SummaryBox(
                  title: "Deceased",
                  count: 18,
                  color: deceasedBoxColor,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class SummaryBox extends StatelessWidget {
  const SummaryBox({
    @required this.color,
    @required this.title,
    @required this.count,
  });
  final String title;
  final int count;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      width: 120,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Text(
              title.toUpperCase(),
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w500,
                fontSize: 14,
              ),
            ),
            Text(
              "$count",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w500,
                fontSize: 30,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
