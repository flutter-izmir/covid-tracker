import 'package:auto_size_text/auto_size_text.dart';
import 'package:covid_tracker/constants/breakpoint_constants.dart';
import 'package:covid_tracker/constants/color_constants.dart';
import 'package:covid_tracker/liveupdate.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'constants/color_constants.dart';

void main() => runApp(
      DevicePreview(
        builder: (context) => MyApp(),
        enabled: true,
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
              Align( // BAŞLIK
                alignment: Alignment.centerLeft,
                child: Text(
                  "Stay Home\nStay Safe",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize:
                        MediaQuery.of(context).size.width > tabletBreakpoint
                            ? 50
                            : 36,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              GridView.count( //GRID VIEW 
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                crossAxisCount: size.width > tabletBreakpoint ? 4 : 2,
                mainAxisSpacing: 5,
                crossAxisSpacing: 5,
                childAspectRatio: size.width / (size.height / 3),
                children: [
                  SummaryBox(
                    title: "Deceased",
                    count: 18,
                    color: deceasedBoxColor,
                  ),
                ],
              ),
              SizedBox(height: 10),
              InkWell( // LIVE UPDATE BUTTON
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
                          "see live updates for countries",
                          style: TextStyle(
                            color: Colors.white.withOpacity(0.8),
                            fontSize: 14,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              AspectRatio( //SYMPTOMS ABOUT CORONA
                aspectRatio: size.width / (size.height / 3),
                child: Container(
                  margin: EdgeInsets.only(top: 20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    color: symptomsBoxColor,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      SizedBox(width: 20),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            "5 Symptoms\nabout Corona",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 23,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(height: 10),
                          Container( //LEARN MORE BUTTON
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
                      Flexible(
                        child: Image.asset("doctor.png"),
                      )
                    ],
                  ),
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
    var size = MediaQuery.of(context).size;
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
            Expanded(
              child: AutoSizeText(
                title.toUpperCase(),
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w300,
                ),
                presetFontSizes: [40, 20, 15],
                maxLines: 1,
              ),
            ),
            Expanded(
              flex: 2,
              child: AutoSizeText(
                "$count",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                  // fontSize: size.width > tabletBreakpoint ? 40 : 26,
                ),
                presetFontSizes: [120, 60, 30],
                // overflowReplacement: Text("String can't be placed"),
                // minFontSize: 10,
                maxLines: 1,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
