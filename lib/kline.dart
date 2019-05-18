import 'package:flutter/material.dart';
import 'package:candleline/store/kline.dart';
import 'package:candleline/view/KlineSingleView.dart';
import 'package:provider/provider.dart';

class KlinePage extends StatelessWidget {
  KlinePage({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final store = Provider.of<KlineStore>(context);
    Offset lastPoint;
    int count;
    double currentRectWidth;
    bool isScale = false;
    bool isLongPress = false;
    bool isTapCancel = false;

    double width = MediaQuery.of(context).size.width;
    store.setScreenWidth(width);
    return GestureDetector(
      onTapCancel: (){
        isTapCancel = true;
      },
      onLongPressStart: (details){
        store.setXY(details.globalPosition.dx, details.globalPosition.dy);
        isLongPress = true;
      },
      onLongPressMoveUpdate: (details){
        RenderBox getBox = context.findRenderObject();
        var local = getBox.globalToLocal(details.globalPosition);
        store.setXY(local.dx, local.dy);
      },
      onLongPressEnd: (_){
        isLongPress = false;
      },
      onHorizontalDragEnd: (details) {
        isTapCancel = false;
      },
      onHorizontalDragStart: (details) {
        store.hideAxis();
        lastPoint = details.globalPosition;
        count = (width ~/ store.rectWidth).toInt();
      },
      onHorizontalDragUpdate: (details) {
        double offsetX = details.globalPosition.dx - lastPoint.dx;
        int n = (offsetX ~/ store.rectWidth).toInt();
        if (isLongPress || isScale || isTapCancel) {
          return;
        }
        if (n == 0) {
          return;
        }

        if (store.klineList.length > 0) {
          int indexFrom = store.indexFrom - n;
          if (indexFrom < 0) {
            return;
          }
          if (indexFrom > store.klineList.length - count) {
            return;
          }
          lastPoint = details.globalPosition;
          store.setIndexes(indexFrom, t: indexFrom + count);
        }
      },
      onScaleStart: (details) {
        if(isLongPress){
          return;
        }
        currentRectWidth = store.rectWidth;
        isScale = true;
      },
      onScaleUpdate: (details) {
        if(isLongPress){
          return;
        }
        double scale = details.scale;
        if (scale == 1.0) {
          return;
        }
        double rectWidth = scale * currentRectWidth;
        count = (width ~/ store.rectWidth).toInt();
        store.setRectWidth(rectWidth);
        store.setIndexes(store.indexTo - count);
      },
      onScaleEnd: (details) {
        isScale = false;
        isTapCancel = false;
      },
      child:  Container(
        child: Column(
          children: <Widget>[
            Expanded(
              child: Container(
                color: Colors.black,
                child: KlineSingleView(type: 0),
              ),
              flex: 20,
            ),
            Expanded(
              child: Container(
                color: Colors.black,
                child: KlineSingleView(type: 1),
              ),
              flex: 4,
            ),
          ],
        ),
      )
    );
  }
}
