import 'package:flutter/material.dart';
import 'home_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Home Budget',
      theme: ThemeData(primarySwatch: Colors.blue, fontFamily: 'Rubik'),
      home: MyHomePage(title: 'Home Budget'),
    );
  }
}
