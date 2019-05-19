import 'package:candleline/view/KlineCandleView.dart' show heightGap;
import 'package:flutter/material.dart';
import 'package:candleline/store/kline.dart';
import 'package:candleline/model/KlineModel.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:path_drawing/path_drawing.dart';

class KlineCrossView extends StatelessWidget {
  KlineCrossView({Key key, @required this.horizontal, @required this.vertical});
  final bool horizontal;
  final bool vertical;

  @override
  Widget build(BuildContext context) {
    final store = Provider.of<KlineStore>(context);
    
    return Observer(
          builder: (_) => CustomPaint(
          size: Size.infinite,
          painter: _CrossViewPainter(
              data: store.currentKline(),
              showAxis: store.showAxis,
              xAxis: store.xAxis,
              yAxis: store.yAxis,
              lineWidth: 1,
              rectWidth: store.rectWidth,
              max: store.priceMax,
              min: store.priceMin,
              horizontal: horizontal,
              vertical: vertical,              
              lineColor: new Color.fromRGBO(255, 255, 255, .60),
          )
      ),
    );
  }
}

class _CrossViewPainter extends CustomPainter {
  _CrossViewPainter({
    Key key,
    @required this.data,
    @required this.max,
    @required this.min,
    @required this.showAxis,
    @required this.xAxis,
    @required this.yAxis,
    this.lineColor = Colors.grey,
    this.lineWidth = 1.0,
    this.rectWidth = 7.0,
    this.horizontal = true,
    this.vertical = true,
  });

  final List<Market> data;
  final bool showAxis;
  final double xAxis;
  final double yAxis;
  final double lineWidth;
  final double rectWidth;
  final double min;
  final double max;
  final Color lineColor;
  final bool horizontal;
  final bool vertical;

  @override
  void paint(Canvas canvas, Size size) {
    if (!showAxis || min == null || max == null ) {
      return;
    }

    double width = size.width;
    double height = size.height;

    
    Paint linePaint = Paint()
      ..color = lineColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = lineWidth;

    CircularIntervalList dashArray = CircularIntervalList<double>(<double>[5.0, 2.5]);
    //vertical line
    if(vertical){
      //canvas.drawLine(Offset(xAxis, 0), Offset(xAxis, height), linePaint);
      final Path p = Path()
        ..moveTo(xAxis, 0)
        ..lineTo(xAxis, height);
      canvas.drawPath(dashPath(p, dashArray: dashArray), linePaint);
    }
    
    //horizontal line
    if(horizontal){
      double yAxisClamped = clampedDouble(yAxis, heightGap, height - heightGap);
      final Path p = Path()
        ..moveTo(0, yAxisClamped)
        ..lineTo(width, yAxisClamped);
        canvas.drawPath(dashPath(p, dashArray: dashArray), linePaint);
        
      double price = max - ((max-min)*yAxisClamped/(height - heightGap));

      TextPainter textPainter = new TextPainter(
          text: new TextSpan(
              text: price.toStringAsFixed(2),
              style: new TextStyle(
                color: Colors.white,
                fontSize: 9.0,
                fontWeight: FontWeight.normal,
                background: Paint()..color = Colors.grey
              )
          ),
          textDirection: TextDirection.ltr);
      textPainter.layout();
      Offset offset = Offset(width/2 > xAxis ? 0 : width-textPainter.width, yAxisClamped-textPainter.height/2);
      textPainter.paint(canvas, offset);
    }
  }
  @override
  bool shouldRepaint(_CrossViewPainter old) {
    return data != null;
  }

}
double clampedDouble(double n, double min, double max){
    double clampedN = n;
    if(n < min){
      clampedN = min;
    }else if(n > max){
      clampedN = max;
    }
    return clampedN;
}