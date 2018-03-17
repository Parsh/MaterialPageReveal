import 'package:flutter/material.dart';

import 'pager_indicator.dart';

class PageDragger extends StatefulWidget {
  @override
  _PageDraggerState createState() => new _PageDraggerState();
}

class _PageDraggerState extends State<PageDragger> {

  static const FullTransition_px = 300.0; //Estimated that a 300 pixels tranisition refers to a full transition, e.i, page switch.
  Offset dragStart;
  SlideDirection slideDirection;
  double slidePercent = 0.0;

  onDragStart(DragStartDetails details){
    dragStart = details.globalPosition;
  }

  onDragUpdate(DragUpdateDetails details){
    if (dragStart != null){
      final newPosition = details.globalPosition;
      final dx = dragStart.dx - newPosition.dx;
      if (dx>0.0){
        slideDirection = SlideDirection.rightToLeft;
      } else if (dx<0.0){
        slideDirection = SlideDirection.leftToRight;
      } else {
        slideDirection = SlideDirection.none;
      }

      slidePercent = (dx/FullTransition_px).abs().clamp(0.0, 1.0);
      print("Dragging in $slideDirection at $slidePercent");
    }
  }

  onDragEnd(DragEndDetails details){
    dragStart = null;
  }

  @override
  Widget build(BuildContext context) {
    return new GestureDetector(
      onHorizontalDragStart: onDragStart,
      onHorizontalDragUpdate: onDragUpdate,
      onHorizontalDragEnd: onDragEnd
    );
  }
}