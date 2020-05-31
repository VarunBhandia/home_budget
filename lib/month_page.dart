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
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: appBarTextColor),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(
          "Month Name",
          style: TextStyle(
            fontSize: appBarTextSize,
            color: appBarTextColor,
          ),
        ),
        backgroundColor: appBarBackgroundColor,
      ),
      body: Center(
        child: Text(widget.id.toString()),
      ),
    );
  }
}
