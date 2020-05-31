import 'package:flutter/material.dart';

import 'constant.dart';
import 'database_helper.dart';

class MonthPage extends StatefulWidget {
  MonthPage({Key key, this.id}) : super(key: key);
  final int id;

  @override
  _MonthPageState createState() => _MonthPageState();
}

class _MonthPageState extends State<MonthPage> {
  String monthName = '';

  void _readDB(int id) async {
    print('Reading local DB');
    DatabaseHelper helper = DatabaseHelper.instance;
    int rowId = id;
    Month month = await helper.queryMonth(rowId);
    monthName = month.name;
    setState(() {
      monthName:month.name;
    });
    print(monthName );
  }

  void _initState(){
    _readDB(widget.id);
  }
  @override
  Widget build(BuildContext context) {

    _readDB(widget.id);
    return Scaffold(
      backgroundColor: scaffoldTextColor,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: appBarTextColor),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(
          monthName,
          style: TextStyle(
            fontSize: appBarTextSize,
            color: appBarTextColor,
          ),
        ),
        backgroundColor: appBarBackgroundColor,
      ),
      body: Center(
        child: Text(monthName),
      ),
    );
  }
}
