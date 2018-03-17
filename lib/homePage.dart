import 'dart:async';

import 'package:flutter/material.dart';

import './page.dart';
import './page_reveal.dart';
import './pager_indicator.dart';
import 'page_dragger.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => new _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int acitveIndex = 0;
  int nextPageIndex = 0;
  SlideDirection slideDirection = SlideDirection.none;
  double slidePercent = 0.0;

  StreamController<SlideUpdate> slideUpdateStream;

  _HomePageState() {
    this.slideUpdateStream = new StreamController<SlideUpdate>();
    slideUpdateStream.stream.listen((SlideUpdate event) {
      setState(() {
        if (event.updateType == UpdateType.dragging) {
          slideDirection = event.direction;
          slidePercent = event.slidePercent;

          if (slideDirection == SlideDirection.leftToRight) {
            nextPageIndex = acitveIndex - 1;
          } else if (slideDirection == SlideDirection.rightToLeft) {
            nextPageIndex = acitveIndex + 1;
          } else {
            nextPageIndex = acitveIndex;
          }
        } else if (event.updateType == UpdateType.doneDragging) {
          if (slidePercent > 0.5) {
            acitveIndex = slideDirection == SlideDirection.leftToRight
                ? acitveIndex - 1
                : acitveIndex + 1;
          }

          slideDirection = SlideDirection.none;
          slidePercent = 0.0;
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Stack(
        children: <Widget>[
          new Page(
            viewModel: pages[acitveIndex],
            percentVisible: 1.0,
          ),
          new PageReveal(
            revealPercent: slidePercent,
            child: new Page(
              viewModel: pages[nextPageIndex],
              percentVisible: slidePercent,
            ),
          ),
          new PagerIndicator(
              pagerIndicatorViewModel: new PagerIndicatorViewModel(
                  pages: pages,
                  activeIndex: acitveIndex,
                  slideDirection: slideDirection,
                  slidePercent: slidePercent)),
          new PageDragger(
            canDragLeftToRight: acitveIndex > 0,
            canDragRightToLeft: acitveIndex < pages.length - 1,
            slideUpdateStream: this.slideUpdateStream,
          )
        ],
      ),
    );
  }
}
