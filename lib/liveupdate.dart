import 'package:covid_tracker/bar_chart.dart';
import 'package:covid_tracker/constants/color_constants.dart';
import 'package:flutter/material.dart';

class LiveUpdateScreen extends StatefulWidget {
  LiveUpdateScreen({Key key}) : super(key: key);

  @override
  _LiveUpdateState createState() => _LiveUpdateState();
}

class _LiveUpdateState extends State<LiveUpdateScreen> {
  String country = "Turkey";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: backgroundColor,
        title: Text("Live Update"),
      ),
      backgroundColor: backgroundColor,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage("liveupdatebg.png"))),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Stack(
            children: <Widget>[
              Container(
                width: 200,
                height: 100,
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: backgroundColor.withOpacity(0.6),
                    borderRadius: BorderRadius.circular(10)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "Select Country",
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                    DropdownButton<String>(
                      value: country,
                      onChanged: (value) {
                        setState(() {
                          country = value;
                        });
                      },
                      underline: Container(
                        height: 2,
                        color: Colors.white,
                      ),
                      isExpanded: true,
                      items: <String>['Turkey', 'France', 'Italia', 'Germany']
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(
                            value,
                            style: TextStyle(color: Colors.white),
                          ),
                        );
                      }).toList(),
                    ),
                  ],
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: BarChartSample(countryName: country,),
              )
            ],
          ),
        ),
      ),
    );
  }
}
