import 'package:flutter/material.dart';
import 'package:home_budget/database_helper.dart';
import 'home_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  void _readDB() async {

    DatabaseHelper helper = DatabaseHelper.instance;
    int rowId = 1;
    Month month = await helper.queryMonth(rowId);
    if (month == null) {
      _save('May');
      _save('June');
      _save('July');
    } else {
//      print(month.name);
    }
  }

  void _save(String name) async{
    Month month = Month();
    month.name = name;
    DatabaseHelper helper = DatabaseHelper.instance;

    int id = await helper.insert(month);
    print(month.name);
  }

  @override
  Widget build(BuildContext context) {
    _readDB();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Home Budget',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: MyHomePage(title: 'Home Budget'),
    );
  }
}
