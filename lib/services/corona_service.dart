import 'package:covid_tracker/models/Country.dart';
import 'package:dio/dio.dart';

class CoronaService {
  static Future<List<Country>> getCountries() async {
    try {
      List<Country> countries = [];

      Response response = await Dio()
          .get("https://corona.lmao.ninja/v2/countries?sort=country");
      for (var c in response.data) {
        countries.add(Country.fromJson(c));
      }
      return countries;
    } catch (e) {
      return Future.error(e);
    }
  }
}
