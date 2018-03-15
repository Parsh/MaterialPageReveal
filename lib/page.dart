import 'package:flutter/material.dart';

class Page extends StatelessWidget {

  final PageViewModel viewModel;

  Page({
    this.viewModel
  });

  @override
  Widget build(BuildContext context) {
    return new Container(
            width: double.INFINITY,
            color: viewModel.color,
            child: new Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[

                new Padding(
                  padding: new EdgeInsets.only(bottom:25.0),
                  child: new Image.asset(
                      viewModel.heroAssetPath,
                      width: 200.0,
                      height: 200.0,
                  ),
                ),  

                new Padding(
                  padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
                  child: new Text(
                    viewModel.title,
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
                    viewModel.body,
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

class PageViewModel{
  final Color color;
  final String heroAssetPath;
  final String title;
  final String body;
  final String iconAssetIcons;

  PageViewModel({            // {} makes the parameters optional but helps with supplying name parameters
    this.color: Colors.pink, //after colon values are default values which are used when the parameter isn't passed
    this.heroAssetPath,
    this.title: "Title",
    this.body: "Body",
    this.iconAssetIcons
  });
}