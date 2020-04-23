class Country {
  String name;
  String slug;
  String iSO2;

  Country({this.name, this.slug, this.iSO2});

  Country.fromJson(Map<String, dynamic> json) {
    name = json['Country'];
    slug = json['Slug'];
    iSO2 = json['ISO2'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['Country'] = this.name;
    data['Slug'] = this.slug;
    data['ISO2'] = this.iSO2;
    return data;
  }
}
