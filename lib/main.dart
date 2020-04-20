import 'package:covid_tracker/constants/color_constants.dart';
import 'package:covid_tracker/liveupdate.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';

import 'constants/color_constants.dart';

void main() => runApp(
      DevicePreview(
        builder: (context) => MyApp(),
      ),
    );

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      builder: DevicePreview.appBuilder,
      theme: ThemeData(
        canvasColor: textColor,
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
    var size = MediaQuery.of(context).size;

    final double itemHeight = (size.height - kToolbarHeight - 24) / 2;

    return Scaffold(
      backgroundColor: backgroundColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 55,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Stay Home\nStay Safe",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Container(
                height: 220,
                child: GridView.count(
                  crossAxisCount: 2,
                  mainAxisSpacing: 5,
                  crossAxisSpacing: 5,
                  childAspectRatio: 1.8,
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
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LiveUpdateScreen()),
                  );
                },
                child: Ink(
                  height: 80,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      color: Colors.white,
                      image: DecorationImage(
                          image: AssetImage("imagebg.png"), fit: BoxFit.fill)),
                  child: Padding(
                    padding: const EdgeInsets.all(13.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "Live Update",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 26,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          "about Corona Virus",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.w100,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 20),
                width: double.infinity,
                height: 200,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  color: simptomsBoxColor,
                ),
                child: Stack(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            "5 Simptoms\nabout Corona",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 23,
                                fontWeight: FontWeight.w600),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 5),
                            padding: EdgeInsets.only(
                                top: 13, bottom: 13, right: 40, left: 40),
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(13)),
                              color: learnMoreButtonColor,
                            ),
                            child: Text(
                              "Learn more",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w300),
                            ),
                          )
                        ],
                      ),
                    ),
                    Align(
                        alignment: Alignment.centerRight,
                        child: Image.asset("doctor.png"))
                  ],
                ),
              )
            ],
          ),
        ),
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
