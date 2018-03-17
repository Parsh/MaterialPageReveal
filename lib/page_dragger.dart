import 'dart:async';

import 'package:flutter/material.dart';

import 'pager_indicator.dart';

class PageDragger extends StatefulWidget {

  final bool canDragLeftToRight;
  final bool canDragRightToLeft;

  final StreamController<SlideUpdate> slideUpdateStream;
  PageDragger({
    this.slideUpdateStream,
    this.canDragLeftToRight,
    this.canDragRightToLeft
  });

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
      if (dx>0.0 && widget.canDragRightToLeft){
        slideDirection = SlideDirection.rightToLeft;
      } else if (dx<0.0 && widget.canDragLeftToRight){
        slideDirection = SlideDirection.leftToRight;
      } else {
        slideDirection = SlideDirection.none;
      }

      if (slideDirection != SlideDirection.none){
        slidePercent = (dx/FullTransition_px).abs().clamp(0.0, 1.0);
      } else{
        slidePercent = 0.0;
      }
      
      widget.slideUpdateStream.add(new SlideUpdate(direction: slideDirection, slidePercent: slidePercent, updateType: UpdateType.dragging));
    }
  }

  onDragEnd(DragEndDetails details){
    widget.slideUpdateStream.add(new SlideUpdate(direction: SlideDirection.none, slidePercent: 0.0, updateType: UpdateType.doneDragging));
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

enum UpdateType{
  dragging,
  doneDragging
}

class SlideUpdate{

  final SlideDirection direction;
  final double slidePercent;
  final UpdateType updateType;

  SlideUpdate({
    this.direction,
    this.slidePercent,
    this.updateType
  });


}