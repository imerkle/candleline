import 'package:candleline/store/kline.dart';
import 'package:flutter/material.dart';
import 'package:candleline/model/KlineModel.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

class KlineSeparateView extends StatelessWidget {
  KlineSeparateView({Key key, @required this.type});
  final int type;

  @override
  Widget build(BuildContext context) {
    final store = Provider.of<KlineStore>(context);
    return Observer(
      builder: (_) => CustomPaint(
        size: Size.infinite,
        painter: _SeparateViewPainter(
          type: type,
          data: store.currentKline(),
          lineWidth: 0.5,
          rectWidth: store.rectWidth,
          max: store.priceMax,
          min: store.priceMin,
          maxVolume: store.volumeMax,
          lineColor: new Color.fromRGBO(255, 255, 255, 0.15),
        )
      ),
    );
  }
}

class _SeparateViewPainter extends CustomPainter {
  _SeparateViewPainter({
    Key key,
    @required this.data,
    @required this.max,
    @required this.min,
    @required this.maxVolume,
    @required this.rectWidth,
    this.lineWidth = 1.0,
    this.lineColor = Colors.grey,
    this.type
  });

  final List<Market> data;
  final double lineWidth;
  final Color lineColor;
  final double max;
  final double min;
  final double maxVolume;
  final double rectWidth;
  final int type;

  @override
  void paint(Canvas canvas, Size size) {
    if (max == null || min == null) {
      return;
    }
    
    if (type == 0) {
      drawPriceLine(canvas, size);
    } else {
      drawVolumeLine(canvas, size);
    }

  }

  drawText(Canvas canvas, Offset offset, String text) {
    TextPainter textPainter = new TextPainter(
        text: new TextSpan(
            text: text,
            style: new TextStyle(
                color: lineColor, fontSize: 10.0, fontWeight: FontWeight.normal)),
        textDirection: TextDirection.ltr);
    textPainter.layout();
    textPainter.paint(canvas, offset);
  }

  drawPriceLine(Canvas canvas, Size size) {
    double height = size.height - 20;

    Paint linePaint = Paint()
      ..color = lineColor
      ..strokeWidth = lineWidth;


    int count = (data.length ~/ 4).toInt() + 1;

    //Vertical Line
    for (var i = 1; i < 4; i++) {
          canvas.drawLine(Offset((i * count + 0.5) * rectWidth ,0), Offset((i * count + 0.5) * rectWidth,height + 20), linePaint);
    }

  }

  drawVolumeLine(Canvas canvas, Size size) {
    double height = size.height - 20;
    double width = size.width;

    Paint linePaint = Paint()
      ..color = lineColor
      ..strokeWidth = lineWidth;

    int count = (data.length ~/ 4).toInt() + 1;

    //绘制横线
    canvas.drawLine(Offset(0, 20), Offset(width, 20), linePaint);

    //绘制竖线
    for (var i = 1; i < 4; i++) {
          canvas.drawLine(Offset((i * count + 0.5) * rectWidth ,20), Offset((i * count + 0.5) * rectWidth,height + 20), linePaint);
    }
    
    double origin = width - max.toStringAsPrecision(7).length * 6;
    drawText(canvas, Offset(origin, 20), maxVolume.toStringAsPrecision(7));
  }

  @override
  bool shouldRepaint(_SeparateViewPainter old) {
    return data != null;
  }
}
