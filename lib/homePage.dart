import 'package:flutter/material.dart';

import './page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => new _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Stack(
        children: <Widget>[
          new Page(
            viewModel: new PageViewModel(
              color: Colors.blue,
              heroAssetPath: "assets/hotels.png",
              title: "Hotels",
              body: "This is the body"
              ),
          )
        ],
      ),
    );
  }
}