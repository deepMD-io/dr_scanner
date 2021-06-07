import 'package:drscanner/TestProcess.dart';
import 'package:flutter/material.dart';


class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
              body: new Stack(
      children: <Widget>[
        new Container(
          decoration: new BoxDecoration(
            image: new DecorationImage(
                image: new AssetImage("assets/images/home_background.jpg"),
                fit: BoxFit.cover),
          ),
          child: Scaffold(
            backgroundColor: Colors.transparent,
          ),
        ),
      ],
    ),

      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.push(
            context, MaterialPageRoute(builder: (context) => TestProcess()));
        },
        icon: Icon(Icons.arrow_right),
        backgroundColor: Colors.cyan[500],
        label: Text("Skip"),
      ),
    );
  }
}
