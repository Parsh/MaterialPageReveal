import 'package:flutter/material.dart';

import 'page.dart';

class PagerIndicator extends StatelessWidget {

  final PagerIndicatorViewModel pagerIndicatorViewModel;

  PagerIndicator({
    this.pagerIndicatorViewModel
  });

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
           new PageBubble(),
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


class PageBubble extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Padding(
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
            );
  }
}


enum SlideDirection{
  leftToRight,
  rightToLeft
}

class PagerIndicatorViewModel{
  final List<PageViewModel> pages;
  final int activeIndex;
  final SlideDirection slideDirection;
  final double slidePercent;


  PagerIndicatorViewModel({
    this.pages,
    this.activeIndex,
    this.slideDirection,
    this.slidePercent
  });
}

class PagerBubbleViewModel{
  final Color color;
  final String iconAssetPath;
  final bool isHollow;
  final double activePercent;

  PagerBubbleViewModel({
    this.color,
    this.iconAssetPath,
    this.isHollow,
    this.activePercent
  });

}
