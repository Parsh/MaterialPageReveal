import 'package:flutter/material.dart';

class PagerIndicator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Column(
      children: <Widget>[
        new Expanded(
          child: new Container(),
        ),
        new Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Padding(
              padding: const EdgeInsets.all(10.0),
              child: new Container(
                width: 20.0,
                height: 20.0,
                decoration: new BoxDecoration(
                    color: new Color(0x88FFFFFF), shape: BoxShape.circle),
              ),
            ),
            new Padding(
              padding: const EdgeInsets.all(10.0),
              child: new Container(
                  width: 45.0,
                  height: 45.0,
                  decoration: new BoxDecoration(
                      color: new Color(0x88FFFFFF), shape: BoxShape.circle),
                  child: new Image.asset(
                    'assets/wallet.png',
                    color: Colors.blue,
                  )),
            ),
            new Padding(
              padding: const EdgeInsets.all(10.0),
              child: new Container(
                width: 20.0,
                height: 20.0,
                decoration: new BoxDecoration(
                    shape: BoxShape.circle,
                    border: new Border.all(
                        color: new Color(0x88FFFFFF), width: 3.0)),
              ),
            )
          ],
        )
      ],
    );
  }
}
