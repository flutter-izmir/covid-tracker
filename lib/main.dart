import 'package:covid_tracker/constants/color_constants.dart';
import 'package:covid_tracker/liveupdate.dart';
import 'package:covid_tracker/summarybox.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        canvasColor: backgroundColor
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
              padding: EdgeInsets.all(22),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(
                    height: 80,
                  ),
                  Text("Stay Home \nStay Safe",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 26,
                          fontWeight: FontWeight.w600)),
                  GridView.count(
                    shrinkWrap: true,
                    crossAxisCount: 2,
                    mainAxisSpacing: 5,
                    crossAxisSpacing: 5,
                    childAspectRatio: size.width / (size.height / 3),
                    children: <Widget>[
                      SummaryBox(
                        title: "Confirmed",
                        count: "144",
                        color: confirmedBoxColor,
                      ),
                      SummaryBox(
                        title: "Active",
                        count: "144",
                        color: activeBoxColor,
                      ),
                      SummaryBox(
                        title: "Recovered",
                        count: "144",
                        color: recoveredBoxColor,
                      ),
                      SummaryBox(
                        title: "Deceased",
                        count: "144",
                        color: deceasedBoxColor,
                      )
                    ],
                  ),
                  SizedBox(
                    height: 20,
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
                          image: DecorationImage(
                              image: AssetImage("imagebg.png"),
                              fit: BoxFit.fill)),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              "LIVE UPDATE",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600),
                            ),
                            Text(
                              "about Corona Virus",
                              style: TextStyle(
                                  color: Colors.white.withOpacity(0.7)),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: 200,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: simptomsBoxColor.withOpacity(0.8),
                        borderRadius: BorderRadius.circular(20)),
                    child: Stack(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(25.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                "5 Simptoms \nabout Corona",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 22),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Container(
                                width: 130,
                                height: 40,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                    color: Color(0xFF233750).withOpacity(0.7),
                                    borderRadius: BorderRadius.circular(10)),
                                child: Text(
                                  "LEARN MORE",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 12),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Align(
                          alignment: Alignment.bottomRight,
                          child: Image.asset("doctor.png"),
                        )
                      ],
                    ),
                  )
                ],
              )),
        ));
  }
}
