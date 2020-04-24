import 'package:covid_tracker/models/country_model.dart';
import 'package:covid_tracker/models/daily_data_model.dart';
import 'package:covid_tracker/services/covid_service.dart';
import 'package:covid_tracker/widgets/bar_chart.dart';
import 'package:flutter/material.dart';

import 'constants/color_constants.dart';

class LiveUpdateScreen extends StatefulWidget {
  LiveUpdateScreen({Key key}) : super(key: key);

  @override
  _LiveUpdateScreenState createState() => _LiveUpdateScreenState();
}

class _LiveUpdateScreenState extends State<LiveUpdateScreen> {
  final covidService = CovidService();
  Future<List<Country>> countryListFuture;
  Future<List<DailyData>> dailyDataFuture;

  void selectCountry(Country country) {
    setState(() {
      selectedCountry = country;
      dailyDataFuture =
          covidService.getDailyData(countrySlug: selectedCountry.slug);
    });
  }

  @override
  void initState() {
    countryListFuture = covidService.getCountries()
      ..then((countryList) {
        selectCountry(countryList[30]);
      });
    super.initState();
  }

  Country selectedCountry;

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
            FutureBuilder<List<Country>>(
              future: countryListFuture,
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return Container();
                }
                if (snapshot.hasData) {
                  final countryList = snapshot.data;
                  return Container(
                    padding: EdgeInsets.all(10),
                    width: 230,
                    height: 130,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        color: Color(0xFF0E3360).withOpacity(0.8)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "Select Country",
                          style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 20,
                              color: Colors.white),
                        ),
                        DropdownButton<Country>(
                          value: selectedCountry,
                          style: TextStyle(color: Colors.white),
                          underline: Container(
                            height: 2,
                            color: Colors.white,
                          ),
                          isExpanded: true,
                          onChanged: (Country newValue) {
                            selectCountry(newValue);
                          },
                          items: countryList.map<DropdownMenuItem<Country>>(
                              (Country country) {
                            return DropdownMenuItem<Country>(
                              value: country,
                              child: Text(country.name),
                            );
                          }).toList(),
                        )
                      ],
                    ),
                  );
                }

                return Center(
                  child: CircularProgressIndicator(),
                );
              },
            ),
            FutureBuilder<List<DailyData>>(
              future: dailyDataFuture,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Align(
                    alignment: Alignment.bottomCenter,
                    child: BarChartSample1(
                      country: selectedCountry.name,
                      content: snapshot.data,
                    ),
                  );
                }
                if (snapshot.hasError) {
                  return Container();
                }
                return CircularProgressIndicator();
              },
            ),
            // Positioned(
            //   bottom: 10,
            //   left: 10,
            //   child: Container(
            //     height: 200,
            //     width: 200,
            //     child: FutureBuilder<List<DailyData>>(
            //       future: dailyDataFuture,
            //       builder: (context, snapshot) {
            //         if (snapshot.hasError) {
            //           return Container();
            //         }
            //         if (snapshot.hasData) {
            //           return ListView.builder(
            //               itemCount: snapshot.data.length,
            //               itemBuilder: (context, index) {
            //                 final data = snapshot.data[index];
            //                 return ListTile(
            //                   title: Text(
            //                     data.cases.toString(),
            //                     style: TextStyle(color: Colors.white),
            //                   ),
            //                 );
            //               });
            //         }
            //         return CircularProgressIndicator();
            //       },
            //     ),
            //   ),
            // )
            // Align(
            //   alignment: Alignment.center,
            //   child: BarChartSample1(),
            // ),
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
