import 'package:flutter/material.dart';

import 'constant.dart';

class MonthPage extends StatefulWidget {
  MonthPage({Key key, this.id}) : super(key: key);
  final int id;

  @override
  _MonthPageState createState() => _MonthPageState();
}

class _MonthPageState extends State<MonthPage> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: scaffoldTextColor,

      body: Center(
        child: Text(widget.id.toString()),
      ),
    );
  }
}
