import 'package:covid_tracker/repositories/abstract_covid_repository.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart' show required;

class CovidRepository extends AbstractCovidRepository {
  final client = Dio()
    ..options.baseUrl = "https://api.covid19api.com"
    ..options.contentType = "application/json";

  @override
  Future<Response> getCountries() async {
    final response = await client.get("/countries");
    return response;
  }

  @override
  Future<Response> getDays({@required String countrySlug}) async {
    final response =
        await client.get("/dayone/country/$countrySlug/status/confirmed");
    return response;
  }

  @override
  Future<Response> getSummary() async {
    final response = await client.get("/summary");
    return response;
  }
}
