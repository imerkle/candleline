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
    _$klineListAtom.reportObserved();
    return super.klineList;
  }

  @override
  set klineList(List<Market> value) {
    _$klineListAtom.context
        .checkIfStateModificationsAreAllowed(_$klineListAtom);
    super.klineList = value;
    _$klineListAtom.reportChanged();
  }

  final _$rectWidthAtom = Atom(name: 'KlineBase.rectWidth');

  @override
  double get rectWidth {
    _$rectWidthAtom.reportObserved();
    return super.rectWidth;
  }

  @override
  set rectWidth(double value) {
    _$rectWidthAtom.context
        .checkIfStateModificationsAreAllowed(_$rectWidthAtom);
    super.rectWidth = value;
    _$rectWidthAtom.reportChanged();
  }

  final _$screenWidthAtom = Atom(name: 'KlineBase.screenWidth');

  @override
  double get screenWidth {
    _$screenWidthAtom.reportObserved();
    return super.screenWidth;
  }

  @override
  set screenWidth(double value) {
    _$screenWidthAtom.context
        .checkIfStateModificationsAreAllowed(_$screenWidthAtom);
    super.screenWidth = value;
    _$screenWidthAtom.reportChanged();
  }

  final _$indexFromAtom = Atom(name: 'KlineBase.indexFrom');

  @override
  int get indexFrom {
    _$indexFromAtom.reportObserved();
    return super.indexFrom;
  }

  @override
  set indexFrom(int value) {
    _$indexFromAtom.context
        .checkIfStateModificationsAreAllowed(_$indexFromAtom);
    super.indexFrom = value;
    _$indexFromAtom.reportChanged();
  }

  final _$indexToAtom = Atom(name: 'KlineBase.indexTo');

  @override
  int get indexTo {
    _$indexToAtom.reportObserved();
    return super.indexTo;
  }

  @override
  set indexTo(int value) {
    _$indexToAtom.context.checkIfStateModificationsAreAllowed(_$indexToAtom);
    super.indexTo = value;
    _$indexToAtom.reportChanged();
  }

  final _$priceMaxAtom = Atom(name: 'KlineBase.priceMax');

  @override
  double get priceMax {
    _$priceMaxAtom.reportObserved();
    return super.priceMax;
  }

  @override
  set priceMax(double value) {
    _$priceMaxAtom.context.checkIfStateModificationsAreAllowed(_$priceMaxAtom);
    super.priceMax = value;
    _$priceMaxAtom.reportChanged();
  }

  final _$priceMinAtom = Atom(name: 'KlineBase.priceMin');

  @override
  double get priceMin {
    _$priceMinAtom.reportObserved();
    return super.priceMin;
  }

  @override
  set priceMin(double value) {
    _$priceMinAtom.context.checkIfStateModificationsAreAllowed(_$priceMinAtom);
    super.priceMin = value;
    _$priceMinAtom.reportChanged();
  }

  final _$volumeMaxAtom = Atom(name: 'KlineBase.volumeMax');

  @override
  double get volumeMax {
    _$volumeMaxAtom.reportObserved();
    return super.volumeMax;
  }

  @override
  set volumeMax(double value) {
    _$volumeMaxAtom.context
        .checkIfStateModificationsAreAllowed(_$volumeMaxAtom);
    super.volumeMax = value;
    _$volumeMaxAtom.reportChanged();
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
  List<Market> getSubKlineList(int from, int to) {
    final _$actionInfo = _$KlineBaseActionController.startAction();
    try {
      return super.getSubKlineList(from, to);
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
  void calculateLimit() {
    final _$actionInfo = _$KlineBaseActionController.startAction();
    try {
      return super.calculateLimit();
    } finally {
      _$KlineBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setIndexes(int indexFrom, int indexTo) {
    final _$actionInfo = _$KlineBaseActionController.startAction();
    try {
      return super.setIndexes(indexFrom, indexTo);
    } finally {
      _$KlineBaseActionController.endAction(_$actionInfo);
    }
  }
}