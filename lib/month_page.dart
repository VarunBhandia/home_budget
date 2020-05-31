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
      monthName:
      month.name;
    });
    print(monthName);
  }

  @override
  Widget build(BuildContext context) {
    double labelTextFieldWidth = MediaQuery.of(context).size.width / 6;
    double inputTextFieldWidth = MediaQuery.of(context).size.width / 4;
    double monthParentContainerSize = MediaQuery.of(context).size.width *.7;
    double monthParentContainerLeftMargin = MediaQuery.of(context).size.width *.1;

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
      body: Container(
        width: monthParentContainerSize,
        margin: EdgeInsets.only(left: monthParentContainerLeftMargin),
        child: Column(
          children: <Widget>[
            SizedBox(height: 20),
            Row(
              children: <Widget>[
                Text(
                  'Month Expeditures',
                  style: TextStyle(
                    fontSize: monthHeadingSize,
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Row(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.all(6),
                  width: labelTextFieldWidth,
                  child: Text(
                    'Milk : ',
                    style: TextStyle(
                      fontSize: monthTextFieldSize,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(6),
                  width: inputTextFieldWidth,
                  child: TextField(
                    keyboardType: TextInputType.number,
                    style: TextStyle(fontSize: monthTextFieldSize),
                    decoration: InputDecoration(hintText: 'Enter milk bill'),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Row(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.all(6),
                  width: labelTextFieldWidth,
                  child: Text(
                    'Milk : ',
                    style: TextStyle(
                      fontSize: monthTextFieldSize,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(6),
                  width: inputTextFieldWidth,
                  child: TextField(
                    keyboardType: TextInputType.number,
                    style: TextStyle(fontSize: monthTextFieldSize),
                    decoration: InputDecoration(hintText: 'Enter milk bill'),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Row(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.all(6),
                  width: labelTextFieldWidth,
                  child: Text(
                    'Milk : ',
                    style: TextStyle(
                      fontSize: monthTextFieldSize,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(6),
                  width: inputTextFieldWidth,
                  child: TextField(
                    keyboardType: TextInputType.number,
                    style: TextStyle(fontSize: monthTextFieldSize),
                    decoration: InputDecoration(hintText: 'Enter milk bill'),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Row(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.all(6),
                  width: labelTextFieldWidth,
                  child: Text(
                    'Milk : ',
                    style: TextStyle(
                      fontSize: monthTextFieldSize,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(6),
                  width: inputTextFieldWidth,
                  child: TextField(
                    keyboardType: TextInputType.number,
                    style: TextStyle(fontSize: monthTextFieldSize),
                    decoration: InputDecoration(hintText: 'Enter milk bill'),
                  ),
                ),
              ],
            ),
          ],
        ),
      )
    );
  }
}
