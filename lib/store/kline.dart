import 'package:candleline/model/KlineModel.dart';
import 'package:candleline/manager/KlineDataCalculateManager.dart';
import 'dart:math';
import 'package:mobx/mobx.dart';

// Include generated file
part 'kline.g.dart';

// This is the class used by rest of your codebase
class KlineStore = KlineBase with _$KlineStore;

// The store-class
abstract class KlineBase implements Store {
  @observable
  List<Market> klineList = List();
    
  @observable
  double rectWidth = 7.0;
  @observable
  double screenWidth = 375;

  @observable
  int indexFrom  = 0;

  @observable
  int indexTo  = 0;

  @observable
  double priceMax;
  @observable
  double priceMin;
  @observable
  double volumeMax;

  @observable
  bool showAxis = false;
  @observable
  double xAxis = 0;
  @observable
  double yAxis = 0;

  @action
  void updateDataList(List<Market> dataList) {
      if(dataList.length > 0){
        klineList = KlineDataCalculateManager.calculateKlineData(ChartType.MA, dataList);
        this.calculateLimit(klineList);
      }
  }

  @action
  void setScreenWidth(double width) {
    screenWidth = width;
    double count = screenWidth / rectWidth;
    int num = count.toInt();
    this.setIndexes(0, t: num);
  }

 
  @action
  void setRectWidth(double width) {
    if (width > 25.0 || width < 2.0) {
      return;
    }
    rectWidth = width;
  }  
  
  @action
  void hideAxis(){
    this.showAxis = false;
  }
  @action
  void setXY(x, y){
    this.xAxis = x;
    this.yAxis = y;
    this.showAxis = true;
  }

  @action
  void setIndexes(int f, {int t}){
    int kl = klineList.length;
    if(f > 0 && f < kl){
      indexFrom = f ?? indexFrom;
    }
    if(t!= null && t > 0 && t <= kl){
      indexTo = t ?? indexTo;
    }
    if(kl > 0){
      this.calculateLimit(getSubKlineList(indexFrom, indexTo));
    }
  }
  
  @action
  void calculateLimit(List<Market> kl) {
    double _priceMax = -double.infinity;
    double _priceMin = double.infinity;
    double _volumeMax = -double.infinity;
    for (var i in kl) {
      _volumeMax = max(i.vol, _volumeMax);

      _priceMax = max(_priceMax, i.high);
      _priceMin = min(_priceMin, i.low);

      if (i.priceMa1 != null) {
        _priceMax = max(_priceMax, i.priceMa1);
        _priceMin = min(_priceMin, i.priceMa1);
      }
      if (i.priceMa2 != null) {
        _priceMax = max(_priceMax, i.priceMa2);
        _priceMin = min(_priceMin, i.priceMa2);
      }
      if (i.priceMa3 != null) {
        _priceMax = max(_priceMax, i.priceMa3);
        _priceMin = min(_priceMin, i.priceMa3);
      }

    }
    priceMax = _priceMax;
    priceMin = _priceMin;
    volumeMax = _volumeMax;
  }
  @computed
  List<Market> getSubKlineList(int from, int to) {
    return this.klineList.sublist(from, to);
  }  
  @computed
  List<Market> currentKline(){
    //print('$indexFrom, $indexTo');
    int kl = klineList.length;
    return  kl > 0 ? getSubKlineList(this.indexFrom, this.indexTo) : [Market(0, 0, 0, 0, 0)];
  }
}
