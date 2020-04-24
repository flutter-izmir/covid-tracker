import 'package:covid_tracker/widgets/bar_chart.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import 'constants/color_constants.dart';
import 'constants/color_constants.dart';
import 'constants/color_constants.dart';
import 'constants/color_constants.dart';

class LiveUpdateScreen extends StatefulWidget {
  LiveUpdateScreen({Key key}) : super(key: key);

  @override
  _LiveUpdateScreenState createState() => _LiveUpdateScreenState();
}

class _LiveUpdateScreenState extends State<LiveUpdateScreen> {
  String country = 'Turkey';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: backgroundColor,
        elevation: 0.0,
        title: Text(
          "Live Update",
          style: TextStyle(fontWeight: FontWeight.w400, fontSize: 17),
        ),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        margin: EdgeInsets.only(top: 40),
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("liveupdatebg.png"), fit: BoxFit.fill)),
        child: Stack(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(10),
              width: double.infinity,
              height: 113,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  color: Color(0xFF0E3360).withOpacity(0.8)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "Select Country",
                    style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 20,
                        color: Colors.white),
                  ),
                  DropdownButton<String>(
                    value: country,
                    style: TextStyle(color: Colors.white),
                    underline: Container(
                      height: 2,
                      color: Colors.white,
                    ),
                    isExpanded: true,
                    onChanged: (String newValue) {
                      setState(() {
                        country = newValue;
                      });
                    },
                    items: <String>['Turkey', 'France', 'Italia', 'Germany']
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: BarChartSample1(
                country: country,
                content: "Virüs Detayları",
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class VirusInfoBox extends StatelessWidget {
  const VirusInfoBox(
      {@required this.color,
      @required this.medicalCount,
      @required this.medicalTitle,
      @required this.imageURL});

  final String medicalCount;
  final String medicalTitle;
  final Color color;
  final String imageURL;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 130,
      height: 67,
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(20)),
        color: color,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Image.asset("$imageURL"),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              Text("$medicalCount",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w800,
                      fontSize: 19)),
              Text("$medicalTitle",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w300,
                      fontSize: 13))
            ],
          )
        ],
      ),
    );
  }
}
