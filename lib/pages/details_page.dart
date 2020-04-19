import 'package:flutter/material.dart';

class DetailsPage extends StatefulWidget {
  @override
  _DetailsPageState createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  List<String> _countries = [
    "Turkey",
    "Romania",
    "Germany",
    "United States of America",
    "Poland",
    "Italy",
    "France",
    "Israel",
    "China",
    "Russia",
    "Georgia"
  ];
  String _selectedCountry;
  @override
  void initState() {
    _selectedCountry = _countries[0];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth < 700) {
          return Scaffold(
            appBar: AppBar(
              title: Text('mobile'),
            ),
            body: Center(
              child: Column(
                children: <Widget>[
                  DropdownButton(
                    items: _countries
                        .map(
                          (country) => DropdownMenuItem(
                            value: country,
                            child: Text(country),
                          ),
                        )
                        .toList(),
                    onChanged: (val) {
                      setState(() {
                        _selectedCountry = val;
                      });
                    },
                    value: _selectedCountry,
                  ),
                ],
              ),
            ),
          );
        } else {
          return Row(
            children: <Widget>[
              Container(
                width: 300,
                child: Scaffold(
                  appBar: AppBar(
                    title: Text("Countries"),
                  ),
                  body: ListView.builder(
                    itemCount: _countries.length,
                    itemBuilder: (context, index) {
                      final country = _countries[index];
                      return Container(
                        color:
                            country == _selectedCountry ? Colors.green : null,
                        child: ListTile(
                          title: Text(country),
                          onTap: () {
                            setState(() {
                              _selectedCountry = country;
                            });
                          },
                        ),
                      );
                    },
                  ),
                ),
              ),
              Expanded(
                child: Scaffold(
                  appBar: AppBar(
                    title: Text(_selectedCountry),
                  ),
                ),
              )
            ],
          );
        }
      },
    );
  }
}
