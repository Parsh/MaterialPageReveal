import 'package:flutter/material.dart';

import './page.dart';
import './page_reveal.dart';
import './pager_indicator.dart';

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
            viewModel: pages[0],
            percentVisible: 1.0,
          ),
          new PageReveal(
            revealPercent: 1.0,
            child: new Page(
              viewModel: pages[1],
              percentVisible: 1.0,
            ),
          ),
        new PagerIndicator(
          pagerIndicatorViewModel: new PagerIndicatorViewModel(
             pages: pages,
             activeIndex: 1,
             slideDirection: SlideDirection.leftToRight,
             slidePercent: 1.0
          )
        )
        ],
      ),
    );
  }
}
