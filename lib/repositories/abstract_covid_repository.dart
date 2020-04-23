import 'package:dio/dio.dart';

abstract class AbstractCovidRepository {
  Future<Response> getSummary();
  Future<Response> getCountries();
  Future<Response> getDays();
}
