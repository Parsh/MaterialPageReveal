import 'package:flutter/material.dart';

class Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Container(
            width: double.INFINITY,
            color: Colors.blue,
            child: new Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[

                new Padding(
                  padding: new EdgeInsets.only(bottom:25.0),
                  child: new Image.asset(
                    'assets/hotels.png',
                      width: 200.0,
                      height: 200.0,
                  ),
                ),  

                new Padding(
                  padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
                  child: new Text(
                    "Hotels",
                    style: new TextStyle(
                      fontSize: 34.0,
                      color: Colors.white,
                      fontFamily: "FlamanteRoma"
                    )
                  ),
                ),

                new Padding(
                  padding: const EdgeInsets.only(bottom: 75.0),
                  child: new Text(
                    "This is the body text",
                    textAlign: TextAlign.center,
                    style: new TextStyle(
                      fontFamily: "FlamanteRoma",
                      fontSize: 18.0,
                      color: Colors.white
                    ),
                  ),
                )
              ]
            ),
          );
  }
}