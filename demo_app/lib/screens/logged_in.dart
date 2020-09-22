import 'package:flutter/material.dart';
import 'package:demo_app/functions/database_helper.dart';

final dbHelper = DatabaseHelper.instance;
var dat;
var length = 0;

class LoggedIn extends StatefulWidget {
  @override
  _LoggedInState createState() => _LoggedInState();
}

class _LoggedInState extends State<LoggedIn> {
  int itemCount = 0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  getDb() async {
    dat = await dbHelper.queryAllRows();
    length = dat.length;
    print(length);
  }

  @override
  Widget build(BuildContext context) {
    getDb();
    return Padding(
      padding: const EdgeInsets.all(6.0),
      child: Container(
        //backgroundColor: Colors.lightBlueAccent,
        child: ListView.builder(
            padding: const EdgeInsets.all(20),
            itemCount: length,
            itemBuilder: (BuildContext context, int index) {
              return Card(
                color: Colors.lightBlue,
                child: Text(
                  dat[index]['email'],
                  style: TextStyle(fontSize: 24.0),
                  textAlign: TextAlign.center,
                ),
              );
            }),
      ),
    );
  }
}
