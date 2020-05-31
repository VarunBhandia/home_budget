import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {


  @override
  Widget build(BuildContext context) {
    final monthContainerColor = Colors.amber[600];

    double monthContainerWidth = MediaQuery.of(context).size.width/4;
    double monthContainerHeight = monthContainerWidth;

    final monthContainerMargin = EdgeInsets.all(monthContainerWidth/6);

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Row(
              children: <Widget>[
                Container(
                  margin: monthContainerMargin,
                  color: monthContainerColor,
                  width: monthContainerWidth,
                  height: monthContainerHeight,
                ),
                Container(
                  margin: monthContainerMargin,
                  color: monthContainerColor,
                  width: monthContainerWidth,
                  height: monthContainerHeight,
                ),
                Container(
                  margin: monthContainerMargin,
                  color: monthContainerColor,
                  width: monthContainerWidth,
                  height: monthContainerHeight,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
