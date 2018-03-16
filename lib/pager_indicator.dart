import 'dart:ui' as ui;

import 'package:flutter/material.dart';

import 'page.dart';

class PagerIndicator extends StatelessWidget {
  final PagerIndicatorViewModel pagerIndicatorViewModel;

  PagerIndicator({this.pagerIndicatorViewModel});

  @override
  Widget build(BuildContext context) {

    List<PageBubble> bubbles = [];
    for(var i = 0; i < pagerIndicatorViewModel.pages.length; ++i){
      final page = pagerIndicatorViewModel.pages[i];
    
      bubbles.add(
        new PageBubble(
          pageBubbleViewModel: new PageBubbleViewModel(
                    color: page.color,
                    iconAssetPath: page.iconAssetIcons,
                    isHollow: i > pagerIndicatorViewModel.activeIndex,
                    activePercent: i == pagerIndicatorViewModel.activeIndex? 1.0: 0.0)
        )
      );
    }

    return new Column(
      children: <Widget>[
        new Expanded(
          child: new Container(),
        ),
        new Row(
          mainAxisAlignment: MainAxisAlignment.center,
           children: bubbles
        )
      ],
    );
  }
}

class PageBubble extends StatelessWidget {
  final PageBubbleViewModel pageBubbleViewModel;

  PageBubble({this.pageBubbleViewModel});

  @override
  Widget build(BuildContext context) {
    return new Padding(
      padding: const EdgeInsets.all(10.0),
      child: new Container(
          width: ui.lerpDouble(20.0, 45.0, pageBubbleViewModel.activePercent),
          height: ui.lerpDouble(20.0, 45.0, pageBubbleViewModel.activePercent),
          decoration: new BoxDecoration(
              color: pageBubbleViewModel.isHollow? Colors.transparent: new Color(0x88FFFFFF), //Showing a fill when not hollow
              shape: BoxShape.circle,
              border: new Border.all(
                color: pageBubbleViewModel.isHollow? new Color(0x88FFFFFF): Colors.transparent, //Showing border when is hollow
                width: 3.0
              )            
              ),
          child: new Opacity(
            opacity: pageBubbleViewModel.activePercent,
            child: new Image.asset(
              pageBubbleViewModel.iconAssetPath,
              color: pageBubbleViewModel.color,
            ),
          )
        ), 
      );
  }
}

enum SlideDirection { leftToRight, rightToLeft, none }

class PagerIndicatorViewModel {
  final List<PageViewModel> pages;
  final int activeIndex;
  final SlideDirection slideDirection;
  final double slidePercent;

  PagerIndicatorViewModel(
      {this.pages, this.activeIndex, this.slideDirection, this.slidePercent});
}

class PageBubbleViewModel {
  final Color color;
  final String iconAssetPath;
  final bool isHollow;
  final double activePercent;

  PageBubbleViewModel(
      {this.color, this.iconAssetPath, this.isHollow, this.activePercent});
}
