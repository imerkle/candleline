import 'package:flutter/material.dart';
import 'package:candleline/store/kline.dart';
import 'package:candleline/view/KlineSingleView.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

class KlinePage extends StatelessWidget {
  KlinePage({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final store = Provider.of<KlineStore>(context);
    Offset lastPoint;
    //int offset;
    double lastScale;
    int count;
    double currentRectWidth;
    bool isScale = false;

    double width = MediaQuery.of(context).size.width;
    store.setScreenWidth(width);
    return GestureDetector(
      onHorizontalDragStart: (details) {
        lastPoint = details.globalPosition;
        count = (MediaQuery.of(context).size.width ~/ store.rectWidth).toInt();
      },
      onHorizontalDragUpdate: (details) {
        double offsetX = details.globalPosition.dx - lastPoint.dx;
        int num = (offsetX ~/ store.rectWidth).toInt();
        if (isScale /*|| num == offset*/) {
          return;
        }
        if (num == 0) {
          return;
        }

        if (store.klineList.length > 1) {
          int indexFrom = store.indexFrom - num;
          if (indexFrom < 0) {
            return;
          }
          if (indexFrom > store.klineList.length - count) {
            return;
          }
          lastPoint = details.globalPosition;
          store.setIndexes(indexFrom, indexFrom + count);
        }
      },
      onScaleStart: (details) {
        currentRectWidth = store.rectWidth;
        isScale = true;
      },
      onScaleUpdate: (details) {
        double scale = details.scale;
        if (scale == 1.0) {
          return;
        }
        lastScale = details.scale;
        double rectWidth = scale * currentRectWidth;
        count = (MediaQuery.of(context).size.width ~/ store.rectWidth).toInt();
        store.setRectWidth(rectWidth);
        store.getSubKlineList(store.indexFrom, store.indexFrom + count);
      },
      onScaleEnd: (details) {
        isScale = false;
      },
      child:  Container(
          child: Column(
            children: <Widget>[
              Expanded(
                child: Container(
                  child: KlineSingleView(type: 0),
                ),
                flex: 20,
              ),
            ],
          ),
        )
      );
  }
}
