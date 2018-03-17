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
  SlideDirection slideDirection = SlideDirection.none;
  double slidePercent = 0.0;

 StreamController<SlideUpdate> slideUpdateStream;

  _HomePageState(){
    this.slideUpdateStream = new StreamController<SlideUpdate>();
    slideUpdateStream.stream.listen((SlideUpdate event){
        setState((){
          slideDirection = event.direction;
          slidePercent = event.slidePercent;
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
              viewModel: pages[1],
              percentVisible: slidePercent,
            ),
          ),
        new PagerIndicator(
          pagerIndicatorViewModel: new PagerIndicatorViewModel(
             pages: pages,
             activeIndex: acitveIndex,
             slideDirection: slideDirection,
             slidePercent: slidePercent
          )
        ),
        new PageDragger(
         slideUpdateStream: this.slideUpdateStream,
        )
        ],
      ),
    );
  }
}
