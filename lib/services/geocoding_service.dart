import 'package:dio/dio.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GeocodingService {
  static String _apiKey = "<YOUR-API-KEY>";
  static Future<LatLngBounds> getCountryBounds(String countryName) async {
    Response response = await Dio().get(
        "https://maps.googleapis.com/maps/api/geocode/json?address=$countryName&key=$_apiKey");
        print(response.data);
    LatLng southwest = LatLng(
        response.data["results"][0]["geometry"]["viewport"]["southwest"]["lat"],
        response.data["results"][0]["geometry"]["viewport"]["southwest"]["lng"]);
    LatLng northeast = LatLng(
        response.data["results"][0]["geometry"]["viewport"]["northeast"]["lat"],
        response.data["results"][0]["geometry"]["viewport"]["northeast"]["lng"]);

    return LatLngBounds(southwest: southwest, northeast: northeast);
  }
}
