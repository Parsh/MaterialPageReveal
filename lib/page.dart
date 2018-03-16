import 'package:flutter/material.dart';

final List<PageViewModel> pages = [
  new PageViewModel(
      color: new Color(0xFF678FB4),
      heroAssetPath: "assets/hotels.png",
      title: "Hotels",
      body: "All hotels and hostels are sorted by hopitality rating",
      iconAssetIcons: "assets/key.png"),
  new PageViewModel(
      color: new Color(0xFF65B0B4),
      heroAssetPath: "assets/banks.png",
      title: "Banks",
      body: "We carefully verify all banks before adding them into the app",
      iconAssetIcons: "assets/wallet.png"),
  new PageViewModel(
    color: new Color(0xFF9B90BC),
    heroAssetPath: "assets/stores.png",
    title: "Stores",
    body: "All local stores are categorized for your convenience",
  ),
];

class Page extends StatelessWidget {
  final PageViewModel viewModel;
  final double percentVisible;

  Page({this.viewModel, this.percentVisible: 1.0});

  @override
  Widget build(BuildContext context) {
    return new Container(
      width: double.INFINITY,
      color: viewModel.color,
      child: new Opacity(
        opacity: percentVisible,
        child: new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new Transform(
                transform: new Matrix4.translationValues(
                    0.0, 50.0 * (1.0 - percentVisible), 0.0),
                child: new Padding(
                  padding: new EdgeInsets.only(bottom: 25.0),
                  child: new Image.asset(
                    viewModel.heroAssetPath,
                    width: 200.0,
                    height: 200.0,
                  ),
                ),
              ),
              new Transform(
                transform: new Matrix4.translationValues(
                    0.0, 30.0 * (1.0 - percentVisible), 0.0),
                child: new Padding(
                  padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
                  child: new Text(viewModel.title,
                      style: new TextStyle(
                          fontSize: 34.0,
                          color: Colors.white,
                          fontFamily: "FlamanteRoma")),
                ),
              ),
              new Transform(
                transform: new Matrix4.translationValues(
                    0.0, 30.0 * (1.0 - percentVisible), 0.0),
                child: new Padding(
                  padding: const EdgeInsets.only(bottom: 75.0),
                  child: new Text(
                    viewModel.body,
                    textAlign: TextAlign.center,
                    style: new TextStyle(
                        fontFamily: "FlamanteRoma",
                        fontSize: 18.0,
                        color: Colors.white),
                  ),
                ),
              )
            ]),
      ),
    );
  }
}

class PageViewModel {
  final Color color;
  final String heroAssetPath;
  final String title;
  final String body;
  final String iconAssetIcons;

  PageViewModel(
      { // {} makes the parameters optional but helps with supplying name parameters
      this.color: Colors.pink, //after colon values are default values which are used when the parameter isn't passed
      this.heroAssetPath,
      this.title: "Title",
      this.body: "Body",
      this.iconAssetIcons});
}
