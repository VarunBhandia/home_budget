import 'package:flutter/material.dart';

class MonthPage extends StatefulWidget {
  MonthPage({Key key, this.id}) : super(key: key);
  final int id;

  @override
  _MonthPageState createState() => _MonthPageState();
}

class _MonthPageState extends State<MonthPage> {
  @override
  Widget build(BuildContext context) {

    final scaffoldTextColor = Colors.grey[300];


    final appBarTextColor = Colors.grey[300];
    final appBarBackgroundColor = Colors.blueAccent[100];
    double appBarTextSize = 20.0;

    final monthContainerColor = Colors.blueAccent[100];
    double monthContainerWidth = MediaQuery.of(context).size.width / 4;
    double monthContainerHeight = monthContainerWidth;
    final monthContainerMargin = EdgeInsets.all(monthContainerWidth / 6);

    final monthTextColor = Colors.grey[300];
    double monthTextSize = 40.0;

    return Scaffold(
      backgroundColor: scaffoldTextColor,

      body: Center(
        child: Text(widget.id.toString()),
      ),
    );
  }
}
