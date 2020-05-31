import 'package:flutter/material.dart';

import 'constant.dart';
import 'month_page.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    final monthContainerColor = Colors.blueAccent[200];
    double monthContainerWidth = MediaQuery.of(context).size.width / 4;
    double monthContainerHeight = monthContainerWidth;
    final monthContainerMargin = EdgeInsets.all(monthContainerWidth / 6);



    _openMonthWidget(int id) {
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => MonthPage(id: id),
          ));
    }

    return Scaffold(
      backgroundColor: scaffoldTextColor,
      appBar: AppBar(
        title: Text(
          widget.title,
          style: TextStyle(
            fontSize: appBarTextSize,
            color: appBarTextColor,
          ),
        ),
        backgroundColor: appBarBackgroundColor,
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Row(
              children: <Widget>[
                GestureDetector(
                  onTap: () => _openMonthWidget(1),
                  child: Container(
                    margin: monthContainerMargin,
                    color: monthContainerColor,
                    width: monthContainerWidth,
                    height: monthContainerHeight,
                    child: Center(
                      child: Text(
                        'May',
                        style: TextStyle(
                          fontSize: monthTextSize,
                          color: monthTextColor,
                        ),
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () => _openMonthWidget(2),
                  child: Container(
                    margin: monthContainerMargin,
                    color: monthContainerColor,
                    width: monthContainerWidth,
                    height: monthContainerHeight,
                    child: Center(
                      child: Text(
                        'June',
                        style: TextStyle(
                          fontSize: monthTextSize,
                          color: monthTextColor,
                        ),
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () => _openMonthWidget(3),
                  child: Container(
                    margin: monthContainerMargin,
                    color: monthContainerColor,
                    width: monthContainerWidth,
                    height: monthContainerHeight,
                    child: Center(
                      child: Text(
                        'July',
                        style: TextStyle(
                          fontSize: monthTextSize,
                          color: monthTextColor,
                        ),
                      ),
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
