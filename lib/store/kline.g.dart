// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'kline.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars

mixin _$KlineStore on KlineBase, Store {
  final _$klineListAtom = Atom(name: 'KlineBase.klineList');

  @override
  List<Market> get klineList {
    _$klineListAtom.context.enforceReadPolicy(_$klineListAtom);
    _$klineListAtom.reportObserved();
    return super.klineList;
  }

  @override
  set klineList(List<Market> value) {
    _$klineListAtom.context.conditionallyRunInAction(() {
      super.klineList = value;
      _$klineListAtom.reportChanged();
    }, _$klineListAtom, name: '${_$klineListAtom.name}_set');
  }

  final _$rectWidthAtom = Atom(name: 'KlineBase.rectWidth');

  @override
  double get rectWidth {
    _$rectWidthAtom.context.enforceReadPolicy(_$rectWidthAtom);
    _$rectWidthAtom.reportObserved();
    return super.rectWidth;
  }

  @override
  set rectWidth(double value) {
    _$rectWidthAtom.context.conditionallyRunInAction(() {
      super.rectWidth = value;
      _$rectWidthAtom.reportChanged();
    }, _$rectWidthAtom, name: '${_$rectWidthAtom.name}_set');
  }

  final _$screenWidthAtom = Atom(name: 'KlineBase.screenWidth');

  @override
  double get screenWidth {
    _$screenWidthAtom.context.enforceReadPolicy(_$screenWidthAtom);
    _$screenWidthAtom.reportObserved();
    return super.screenWidth;
  }

  @override
  set screenWidth(double value) {
    _$screenWidthAtom.context.conditionallyRunInAction(() {
      super.screenWidth = value;
      _$screenWidthAtom.reportChanged();
    }, _$screenWidthAtom, name: '${_$screenWidthAtom.name}_set');
  }

  final _$indexFromAtom = Atom(name: 'KlineBase.indexFrom');

  @override
  int get indexFrom {
    _$indexFromAtom.context.enforceReadPolicy(_$indexFromAtom);
    _$indexFromAtom.reportObserved();
    return super.indexFrom;
  }

  @override
  set indexFrom(int value) {
    _$indexFromAtom.context.conditionallyRunInAction(() {
      super.indexFrom = value;
      _$indexFromAtom.reportChanged();
    }, _$indexFromAtom, name: '${_$indexFromAtom.name}_set');
  }

  final _$indexToAtom = Atom(name: 'KlineBase.indexTo');

  @override
  int get indexTo {
    _$indexToAtom.context.enforceReadPolicy(_$indexToAtom);
    _$indexToAtom.reportObserved();
    return super.indexTo;
  }

  @override
  set indexTo(int value) {
    _$indexToAtom.context.conditionallyRunInAction(() {
      super.indexTo = value;
      _$indexToAtom.reportChanged();
    }, _$indexToAtom, name: '${_$indexToAtom.name}_set');
  }

  final _$priceMaxAtom = Atom(name: 'KlineBase.priceMax');

  @override
  double get priceMax {
    _$priceMaxAtom.context.enforceReadPolicy(_$priceMaxAtom);
    _$priceMaxAtom.reportObserved();
    return super.priceMax;
  }

  @override
  set priceMax(double value) {
    _$priceMaxAtom.context.conditionallyRunInAction(() {
      super.priceMax = value;
      _$priceMaxAtom.reportChanged();
    }, _$priceMaxAtom, name: '${_$priceMaxAtom.name}_set');
  }

  final _$priceMinAtom = Atom(name: 'KlineBase.priceMin');

  @override
  double get priceMin {
    _$priceMinAtom.context.enforceReadPolicy(_$priceMinAtom);
    _$priceMinAtom.reportObserved();
    return super.priceMin;
  }

  @override
  set priceMin(double value) {
    _$priceMinAtom.context.conditionallyRunInAction(() {
      super.priceMin = value;
      _$priceMinAtom.reportChanged();
    }, _$priceMinAtom, name: '${_$priceMinAtom.name}_set');
  }

  final _$volumeMaxAtom = Atom(name: 'KlineBase.volumeMax');

  @override
  double get volumeMax {
    _$volumeMaxAtom.context.enforceReadPolicy(_$volumeMaxAtom);
    _$volumeMaxAtom.reportObserved();
    return super.volumeMax;
  }

  @override
  set volumeMax(double value) {
    _$volumeMaxAtom.context.conditionallyRunInAction(() {
      super.volumeMax = value;
      _$volumeMaxAtom.reportChanged();
    }, _$volumeMaxAtom, name: '${_$volumeMaxAtom.name}_set');
  }

  final _$showAxisAtom = Atom(name: 'KlineBase.showAxis');

  @override
  bool get showAxis {
    _$showAxisAtom.context.enforceReadPolicy(_$showAxisAtom);
    _$showAxisAtom.reportObserved();
    return super.showAxis;
  }

  @override
  set showAxis(bool value) {
    _$showAxisAtom.context.conditionallyRunInAction(() {
      super.showAxis = value;
      _$showAxisAtom.reportChanged();
    }, _$showAxisAtom, name: '${_$showAxisAtom.name}_set');
  }

  final _$xAxisAtom = Atom(name: 'KlineBase.xAxis');

  @override
  double get xAxis {
    _$xAxisAtom.context.enforceReadPolicy(_$xAxisAtom);
    _$xAxisAtom.reportObserved();
    return super.xAxis;
  }

  @override
  set xAxis(double value) {
    _$xAxisAtom.context.conditionallyRunInAction(() {
      super.xAxis = value;
      _$xAxisAtom.reportChanged();
    }, _$xAxisAtom, name: '${_$xAxisAtom.name}_set');
  }

  final _$yAxisAtom = Atom(name: 'KlineBase.yAxis');

  @override
  double get yAxis {
    _$yAxisAtom.context.enforceReadPolicy(_$yAxisAtom);
    _$yAxisAtom.reportObserved();
    return super.yAxis;
  }

  @override
  set yAxis(double value) {
    _$yAxisAtom.context.conditionallyRunInAction(() {
      super.yAxis = value;
      _$yAxisAtom.reportChanged();
    }, _$yAxisAtom, name: '${_$yAxisAtom.name}_set');
  }

  final _$KlineBaseActionController = ActionController(name: 'KlineBase');

  @override
  void updateDataList(List<Market> dataList) {
    final _$actionInfo = _$KlineBaseActionController.startAction();
    try {
      return super.updateDataList(dataList);
    } finally {
      _$KlineBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setScreenWidth(double width) {
    final _$actionInfo = _$KlineBaseActionController.startAction();
    try {
      return super.setScreenWidth(width);
    } finally {
      _$KlineBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setRectWidth(double width) {
    final _$actionInfo = _$KlineBaseActionController.startAction();
    try {
      return super.setRectWidth(width);
    } finally {
      _$KlineBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void hideAxis() {
    final _$actionInfo = _$KlineBaseActionController.startAction();
    try {
      return super.hideAxis();
    } finally {
      _$KlineBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setXY(dynamic x, dynamic y) {
    final _$actionInfo = _$KlineBaseActionController.startAction();
    try {
      return super.setXY(x, y);
    } finally {
      _$KlineBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setIndexes(int f, {int t}) {
    final _$actionInfo = _$KlineBaseActionController.startAction();
    try {
      return super.setIndexes(f, t: t);
    } finally {
      _$KlineBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void calculateLimit(List<Market> kl) {
    final _$actionInfo = _$KlineBaseActionController.startAction();
    try {
      return super.calculateLimit(kl);
    } finally {
      _$KlineBaseActionController.endAction(_$actionInfo);
    }
  }
}
