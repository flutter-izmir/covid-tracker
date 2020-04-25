import 'package:flutter/material.dart';

import 'constants/color_constants.dart';

class SummaryBox extends StatefulWidget {
  final String title;
  final String count;
  final Color color;

  const SummaryBox({@required this.title, @required this.count, @required this.color});

  @override
  _SummaryBoxState createState() => _SummaryBoxState();
}

class _SummaryBoxState extends State<SummaryBox> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(14.0),
      decoration: BoxDecoration(
          color: widget.color, borderRadius: BorderRadius.circular(20)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Text(
            widget.title,
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
          ),
          Text(
            widget.count,
            style: TextStyle(
                fontSize: 22, color: Colors.white, fontWeight: FontWeight.w700),
          )
        ],
      ),
    );
  }
}
