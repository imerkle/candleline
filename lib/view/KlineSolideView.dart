import 'package:candleline/store/kline.dart';
import 'package:flutter/material.dart';
import 'package:candleline/model/KlineModel.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

class KlineSolideView extends StatelessWidget {
  KlineSolideView({Key key, @required this.type});
  final int type; //0 pricema1,1 pricema2,2 pricema3
  @override
  Widget build(BuildContext context) {
    final store = Provider.of<KlineStore>(context);
    return Observer(
      builder: (_) => CustomPaint(
        size: Size.infinite,
        painter: _SolideViewPainter(
          data: store.currentKline(),
          lineWidth: 1,
          max: store.priceMax,
          min: store.priceMin,
          rectWidth: store.rectWidth,
          lineColor: Colors.yellow,
          type: type
        )
      ),
    );
  }
}

class _SolideViewPainter extends CustomPainter {
  _SolideViewPainter(
      {Key key,
      @required this.data,
      @required this.max,
      @required this.min,
      this.lineWidth = 1.0,
      this.rectWidth = 7.0,
      this.lineColor = Colors.yellow,
      @required this.type});

  final int type;
  final List<Market> data;
  final double lineWidth;
  final double rectWidth;
  Color lineColor;
  final double max;
  final double min;

  @override
  void paint(Canvas canvas, Size size) {
    if (min == null || max == null ) {
      return;
    }
    double width = size.width;
    double height = size.height - 20;

    final double heightNormalizer = height / (max - min);
    double rightGap = width - (((data.length + 0.5) * rectWidth) - lineWidth / 2);
    for (int i = 0; i < data.length; i++) {
      if (i == data.length - 1) {
        break;
      }
      if ((data[i].priceMa1 == null && type == 0) ||
          (data[i].priceMa2 == null && type == 1) ||
          (data[i].priceMa3 == null && type == 2)) {
        continue;
      }
      double startX;
      double startY;
      double endX;
      double endY;
      startX = (((i + 0.5) * rectWidth) - lineWidth / 2) + rightGap;
      endX = (((i + 1 + 0.5) * rectWidth) - lineWidth / 2) + rightGap;

      switch (type) {
        case 0:
          {
            startY = height - (data[i].priceMa1 - min) * heightNormalizer + 20;
            endY = height - (data[i + 1].priceMa1 - min) * heightNormalizer + 20;
            break;
          }
        case 1:
          {
            startY = height - (data[i].priceMa2 - min) * heightNormalizer + 20;
            endY = height - (data[i + 1].priceMa2 - min) * heightNormalizer + 20;
            lineColor = Colors.blue;
            break;
          }
        case 2:
          {
            startY = height - (data[i].priceMa3 - min) * heightNormalizer + 20;
            endY = height - (data[i + 1].priceMa3 - min) * heightNormalizer + 20;
            lineColor = Colors.purple;
            break;
          }
        default:
          {
            break;
          }
      }
      Paint linePaint = new Paint()
        ..color = lineColor
        ..strokeWidth = lineWidth;
      canvas.drawLine(Offset(startX, startY), Offset(endX, endY), linePaint);
    }
  }

  @override
  bool shouldRepaint(_SolideViewPainter old) {
    return data != null;
  }
}
