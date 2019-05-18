import 'package:flutter/material.dart';
import 'package:candleline/view/KlineCandleView.dart';
import 'package:candleline/view/KlineColumnarView.dart';
import 'package:candleline/view/KlineSolideView.dart';
import 'package:candleline/view/KlineSeparateView.dart';
import 'package:candleline/view/KlineCrossView.dart';
class KlineSingleView extends StatelessWidget {
  KlineSingleView({
    Key key,
    @required this.type,
  });
  final int type;

  @override
  Widget build(BuildContext context) {
    if (type == 0) {
      return Container(
        child: Stack(
          alignment: Alignment.center,
          fit: StackFit.expand,
          children: <Widget>[
            KlineSeparateView(type: 0),
            KlineCandleView(),
            KlineSolideView(type: 0),
            KlineSolideView(type: 1),
            KlineSolideView(type: 2),
            KlineCrossView(horizontal: true, vertical: true),
          ],
        ),
      );
    } else {
      return Container(
        color: Colors.black,
        child: Stack(
          alignment: Alignment.center,
          fit: StackFit.expand,
          children: <Widget>[
            KlineSeparateView(type: 1),
            KlineColumnarView(),
            KlineCrossView(horizontal: false, vertical: true),
            //KlineSolideView(),
          ],
        ),
      );
    }
  }
}


