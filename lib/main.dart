import 'dart:async';

import 'package:covid_tracker/models/Country.dart';
import 'package:covid_tracker/services/corona_service.dart';
import 'package:covid_tracker/services/geocoding_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: GoogleMapsView(),
    );
  }
}

class GoogleMapsView extends StatefulWidget {
  @override
  _GoogleMapsViewState createState() => _GoogleMapsViewState();
}

class _GoogleMapsViewState extends State<GoogleMapsView> {
  Completer<GoogleMapController> _controller = Completer();

  static final CameraPosition _initialPosition = CameraPosition(
    target: LatLng(60, -95),
  );

  String _mapStyle;

  List<Country> countries = [];
  Set<Circle> circles = Set.identity();

  Future<void> _goToCountry(String countryName) async {
    try {
      LatLngBounds bounds =
          await GeocodingService.getCountryBounds(countryName);
      final GoogleMapController controller = await _controller.future;
      controller.animateCamera(CameraUpdate.newLatLngBounds(bounds, 0));
    } catch (e) {
      print(e);
    }
  }

  Future _future;

  Future _getCountries() async {
    countries = await CoronaService.getCountries();
    _mapStyle = await rootBundle.loadString('assets/map_style.json');
    for (var c in countries) {
      Circle circle = Circle(
          circleId: CircleId(c.country),
          center: LatLng(c.countryInfo.lat, c.countryInfo.long),
          fillColor: Colors.red.withOpacity(0.7),
          strokeColor: Colors.red,
          radius: 40000,
          strokeWidth: 0);
      circles.add(circle);
    }
    setState(() {});
    return countries;
  }

  @override
  void initState() {
    super.initState();
    _future = _getCountries();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: _future,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            return GoogleMap(
              mapToolbarEnabled: false,
              compassEnabled: false,
              myLocationButtonEnabled: false,
              zoomControlsEnabled: false,
              zoomGesturesEnabled: false,
              rotateGesturesEnabled: false,
              scrollGesturesEnabled: false,
              tiltGesturesEnabled: false,
              mapType: MapType.normal,
              initialCameraPosition: _initialPosition,
              onMapCreated: (GoogleMapController controller) async {
                _controller.complete(controller);
                controller.setMapStyle(_mapStyle);
              },
              circles: circles,
            );
          } else if (snapshot.hasError) {
            print(snapshot.error);
            return Center(
              child: Text("Error loading data"),
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.white,
          onPressed: () {
            _goToCountry("Turkey");
          }),
    );
  }
}
