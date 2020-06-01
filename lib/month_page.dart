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
  int monthTotal = 0;
  final categoryOneController = TextEditingController();
  final categoryTwoController = TextEditingController();
  final categoryThreeController = TextEditingController();
  final categoryFourController = TextEditingController();

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

  void updateMonthTotal(number) {
    int cat1 = 0;
    int cat2 = 0;
    int cat3 = 0;
    int cat4 = 0;

    if (categoryOneController.text != '') {
      cat1 = int.parse(categoryOneController.text);
    }

    if (categoryTwoController.text != '') {
      cat2 = int.parse(categoryTwoController.text);
    }

    if (categoryThreeController.text != '') {
      cat3 = int.parse(categoryThreeController.text);
    }

    if (categoryFourController.text != '') {
      cat4 = int.parse(categoryFourController.text);
    }

    monthTotal = cat1 + cat2 + cat3 + cat4;
    setState(() {
      monthTotal:
      monthTotal;
    });
  }

  @override
  void initState() {
    super.initState();
    _readDB(widget.id);
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    categoryOneController.dispose();
    categoryTwoController.dispose();
    categoryThreeController.dispose();
    categoryFourController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double labelTextFieldWidth = MediaQuery.of(context).size.width * .6;
    double inputTextFieldWidth = MediaQuery.of(context).size.width * .2;
    double monthParentContainerSize = MediaQuery.of(context).size.width * .8;
    double monthSaveButtonSize = MediaQuery.of(context).size.width * .8;

    double monthParentContainerLeftMargin =
        MediaQuery.of(context).size.width * .1;

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
        body: Stack(
          children: <Widget>[

            Container(
              width: monthParentContainerSize,
              margin: EdgeInsets.only(
                  left: monthParentContainerLeftMargin,
                  right: monthParentContainerLeftMargin),
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
//                    margin: EdgeInsets.only(left: 6),
                        width: labelTextFieldWidth,
                        child: Text(
                          'Milk',
                          style: TextStyle(
                            fontSize: monthTextFieldSize,
                          ),
                        ),
                      ),
                      Container(
//                    margin: EdgeInsets.all(6),
                        width: inputTextFieldWidth,
                        child: TextField(
                          controller: categoryOneController,
                          onChanged: (number) {
                            updateMonthTotal(number);
                          },
                          keyboardType: TextInputType.number,
                          style: TextStyle(fontSize: monthTextFieldSize),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 5),
                  Row(
                    children: <Widget>[
                      Container(
//                    margin: EdgeInsets.all(6),
                        width: labelTextFieldWidth,
                        child: Text(
                          'Maid',
                          style: TextStyle(
                            fontSize: monthTextFieldSize,
                          ),
                        ),
                      ),
                      Container(
//                    margin: EdgeInsets.all(6),
                        width: inputTextFieldWidth,
                        child: TextField(
                          onChanged: (number) {
                            updateMonthTotal(number);
                          },
                          controller: categoryTwoController,
                          keyboardType: TextInputType.number,
                          style: TextStyle(fontSize: monthTextFieldSize),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 5),
                  Row(
                    children: <Widget>[
                      Container(
//                    margin: EdgeInsets.all(6),
                        width: labelTextFieldWidth,
                        child: Text(
                          'Newspaper',
                          style: TextStyle(
                            fontSize: monthTextFieldSize,
                          ),
                        ),
                      ),
                      Container(
//                    margin: EdgeInsets.all(6),
                        width: inputTextFieldWidth,
                        child: TextField(
                          onChanged: (number) {
                            updateMonthTotal(number);
                          },
                          controller: categoryThreeController,
                          keyboardType: TextInputType.number,
                          style: TextStyle(fontSize: monthTextFieldSize),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 5),
                  Row(
                    children: <Widget>[
                      Container(
//                    margin: EdgeInsets.all(6),
                        width: labelTextFieldWidth,
                        child: Text(
                          'Gas',
                          style: TextStyle(
                            fontSize: monthTextFieldSize,
                          ),
                        ),
                      ),
                      Container(
//                    margin: EdgeInsets.all(6),
                        width: inputTextFieldWidth,
                        child: TextField(
                          onChanged: (number) {
                            updateMonthTotal(number);
                          },
                          controller: categoryFourController,
                          keyboardType: TextInputType.number,
                          style: TextStyle(fontSize: monthTextFieldSize),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 50),
                  Row(
                    children: <Widget>[
                      Container(
                        width: labelTextFieldWidth,
                        child: Text(
                          'Total ',
                          style: TextStyle(
                            fontSize: monthTextFieldSize,
                          ),
                        ),
                      ),
                      Container(
                        width: inputTextFieldWidth,
                        child: Text(monthTotal.toString()),
                      ),
                    ],
                  ),
//                  Align(
//                    alignment: Alignment.bottomCenter,
//                    child: ButtonTheme(
//                      minWidth: monthSaveButtonSize,
//                      child: RaisedButton(
//                        color: appBarBackgroundColor,
//                        textColor: appBarTextColor,
//                        disabledColor: Colors.grey,
//                        disabledTextColor: Colors.black,
//                        padding: EdgeInsets.all(8.0),
//                        splashColor: Colors.blueAccent,
//                        onPressed: () {
//                          /*...*/
//                        },
//                        child: Text(
//                          "Save",
//                          style: TextStyle(fontSize: 20.0),
//                        ),
//                      ),
//                    ),
//                  ),
                ],
              ),
            ),
            Positioned(
              bottom: 20,
              left: monthParentContainerLeftMargin,
              child:ButtonTheme(
                minWidth: monthSaveButtonSize,
                child: RaisedButton(
                  color: appBarBackgroundColor,
                  textColor: appBarTextColor,
                  disabledColor: Colors.grey,
                  disabledTextColor: Colors.black,
                  padding: EdgeInsets.all(8.0),
                  splashColor: Colors.blueAccent,
                  onPressed: () {
                    /*...*/
                  },
                  child: Text(
                    "Save",
                    style: TextStyle(fontSize: 20.0),
                  ),
                ),
              ),
            ),
          ],
        ));
  }
}
