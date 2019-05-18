import 'package:flutter/material.dart';
import 'package:candleline/store/kline.dart';
import 'package:candleline/model/KlineModel.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

class KlineColumnarView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final store = Provider.of<KlineStore>(context);
    return Observer(
      builder: (_) => CustomPaint(
        size: Size.infinite,
        painter: _ColumnarViewPainter(
          data: store.currentKline(),
          lineWidth: 1,
          max: store.volumeMax,
          rectWidth: store.rectWidth,
          increaseColor: Colors.red,
          decreaseColor: Colors.green
        )
      ),
    );
  }
}

class _ColumnarViewPainter extends CustomPainter {
  _ColumnarViewPainter({
    Key key,
    @required this.data,
    @required this.max,
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
  final double max;

  @override
  void paint(Canvas canvas, Size size) {
    if (max == null ) {
      return;
    }
    double width = size.width;
    double height = size.height - 20;

    final double heightNormalizer = height / (max);

    double rectLeft;
    double rectTop;
    double rectRight;
    double rectBottom;

    Paint rectPaint;
    
    double rightGap = width - ( (data.length * rectWidth) - lineWidth / 2);
    for (int i = 0; i < data.length; i++) {
      rectLeft = ((i * rectWidth) + lineWidth / 2) + rightGap;
      rectRight = (((i + 1) * rectWidth) - lineWidth / 2) + rightGap;

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
      rectTop = height - (data[i].vol) * heightNormalizer + 20;
      rectBottom = height + 20;
      Rect ocRect =
      new Rect.fromLTRB(rectLeft, rectTop, rectRight, rectBottom);
      canvas.drawRect(ocRect, rectPaint);

    }
  }

  @override
  bool shouldRepaint(_ColumnarViewPainter old) {
    return data != null;
  }

}