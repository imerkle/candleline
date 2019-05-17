import 'package:flutter/material.dart';
import 'package:candleline/store/kline.dart';
import 'package:candleline/model/KlineModel.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

class KlineCandleView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final store = Provider.of<KlineStore>(context);
    return Observer(
          builder: (_) => CustomPaint(
          size: Size.infinite,
          painter: _CandleViewPainter(
              data: store.currentKline(),
              lineWidth: 1,
              rectWidth: store.rectWidth,
              increaseColor: Colors.red,
              decreaseColor: Colors.green,
              max: store.priceMax,
              min: store.priceMin
          )
      ),
    );
  }
}

class _CandleViewPainter extends CustomPainter {
  _CandleViewPainter({
    Key key,
    @required this.data,
    @required this.max,
    @required this.min,
    this.lineWidth = 1.0,
    this.rectWidth = 7.0,
    this.increaseColor = Colors.red,
    this.decreaseColor = Colors.green
  });

  final List<Market> data;
  final double lineWidth;
  final double rectWidth;
  final Color increaseColor;
  final Color decreaseColor;
  final double min;
  final double max;

  @override
  void paint(Canvas canvas, Size size) {
    if (min == null || max == null ) {
      return;
    }

    double width = size.width;
    double height = size.height - 20;

    final double heightNormalizer = height / (max - min);

    double rectLeft;
    double rectTop;
    double rectRight;
    double rectBottom;

    Paint rectPaint;

    for (int i = 0; i < data.length; i++) {
      rectLeft = (i * rectWidth) + lineWidth / 2;
      rectRight = ((i + 1) * rectWidth) - lineWidth / 2;

      if (data[i].open > data[i].close) {
        rectPaint = new Paint()
          ..color = decreaseColor
          ..strokeWidth = lineWidth;
      } else {
        rectPaint = new Paint()
          ..color = increaseColor
          ..strokeWidth = lineWidth;
      }

      // Draw candlestick if decrease
      rectTop = height - (data[i].open - min) * heightNormalizer + 20;
      rectBottom = height - (data[i].close - min) * heightNormalizer + 20;
      Rect ocRect =
      new Rect.fromLTRB(rectLeft, rectTop, rectRight, rectBottom);
      canvas.drawRect(ocRect, rectPaint);

      // Draw low/high candlestick wicks
      double low = height - (data[i].low - min) * heightNormalizer + 20;
      double high = height - (data[i].high - min) * heightNormalizer + 20;
      canvas.drawLine(
          new Offset(rectLeft + rectWidth / 2 - lineWidth / 2, rectBottom),
          new Offset(rectLeft + rectWidth / 2 - lineWidth / 2, low),
          rectPaint);
      canvas.drawLine(
          new Offset(rectLeft + rectWidth / 2 - lineWidth / 2, rectTop),
          new Offset(rectLeft + rectWidth / 2 - lineWidth / 2, high),
          rectPaint);
    }
  }

  @override
  bool shouldRepaint(_CandleViewPainter old) {
    return data != null;
  }

}