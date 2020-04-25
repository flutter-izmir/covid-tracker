import 'package:covid_tracker/models/daily_data_model.dart';
import 'package:covid_tracker/models/summary_model.dart';
import 'package:covid_tracker/repositories/covid_repository.dart';
import 'package:covid_tracker/repositories/mock_covid_repository.dart';
import 'package:meta/meta.dart' show required;

class CovidService {
  final covidRepository = CovidRepository();
  Future<Summary> getSummary() async {
    try {
      final response = await covidRepository.getSummary();
      final data = response.data;
      return Summary.fromJson(data);
    } catch (e) {}
  }

  Future<List<DailyData>> getDailyData({@required String countrySlug}) async {
    try {
      final response = await covidRepository.getDays(countrySlug: countrySlug);
      final data = response.data;
      return (data as List).map((item) {
        return DailyData.fromJson(item);
      }).toList();
    } catch (e) {
      print(e);
    }
  }
}
