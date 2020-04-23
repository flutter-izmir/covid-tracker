class DailyData {
  String country;
  String countryCode;
  String lat;
  String lon;
  int cases;
  String status;
  String date;

  DailyData(
      {this.country,
      this.countryCode,
      this.lat,
      this.lon,
      this.cases,
      this.status,
      this.date});

  DailyData.fromJson(Map<String, dynamic> json) {
    country = json['Country'];
    countryCode = json['CountryCode'];
    lat = json['Lat'];
    lon = json['Lon'];
    cases = json['Cases'];
    status = json['Status'];
    date = json['Date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['Country'] = this.country;
    data['CountryCode'] = this.countryCode;
    data['Lat'] = this.lat;
    data['Lon'] = this.lon;
    data['Cases'] = this.cases;
    data['Status'] = this.status;
    data['Date'] = this.date;
    return data;
  }
}
