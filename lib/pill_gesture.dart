import 'package:flutter/material.dart';

class PillGesture extends StatelessWidget {
  final GestureDragStartCallback onVerticalDragStart;
  final GestureDragUpdateCallback onVerticalDragUpdate;
  final GestureDragEndCallback onVerticalDragEnd;
  final GestureTapCallback onTap;
  final Color pillColor;
  IconData handleIcon;

  PillGesture(
      {@required this.onVerticalDragStart,
      @required this.onVerticalDragUpdate,
      @required this.onVerticalDragEnd,
      @required this.onTap,
      @required this.pillColor,
      this.handleIcon});

  Widget _defaultHandle() {
    return Container(
      height: 5.0,
      width: 25.0,
      decoration: BoxDecoration(
        color: pillColor ?? Colors.blueGrey[200],
        borderRadius: BorderRadius.circular(50.0),
      ),
    );
  }

  Widget _iconHandle() {
    return Icon(
      this.handleIcon,
      color: pillColor ?? Colors.blueGrey[200],
      size: 24.0,
    );
  }

  @override
  Widget build(BuildContext context) {
    var closeHandle = this.handleIcon != null ? _iconHandle() : _defaultHandle();

    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onVerticalDragStart: onVerticalDragStart,
      onVerticalDragUpdate: onVerticalDragUpdate,
      onVerticalDragEnd: onVerticalDragEnd,
      onTap: onTap,
      child: Container(
        width: double.infinity,
        child: Column(
          children: <Widget>[
            SizedBox(height: 10.0),
            closeHandle,
            SizedBox(height: 20.0),
          ],
        ),
      ),
    );
  }
}
