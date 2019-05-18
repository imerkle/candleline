import 'dart:convert';

import 'package:example/model/model.dart';
import 'package:flutter/material.dart';
import 'package:candleline/candleline.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'dart:async' show Future;

import 'package:provider/provider.dart';

void main() => runApp(MyApp());

final klinestore = KlineStore();

 
class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    Future<String> future = loadAsset();
    future.then((value) {
      final parseJson = json.decode(value);
      MarketData marketData = MarketData.fromJson(parseJson);
      List<Market> list = List<Market>();
      for (var item in marketData.data) {
        var market = Market(item.open, item.close, item.low, item.high, item.vol);
        list.add(market);
      }
      klinestore.updateDataList(list);
    });

    return MultiProvider(
      providers: [
        Provider<KlineStore>(builder: (_) => klinestore)
      ],    
      child:  MaterialApp(
        //showPerformanceOverlay: true,
        title: 'Candleline Demo',
        theme: ThemeData(
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          primarySwatch: Colors.blue,
        ),
        home: MyHomePage(title: 'Candleline'),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Container(
        color: Colors.black87,
        margin: EdgeInsets.only(top: 10, bottom: 20),
        height: 300,
        child: KlinePage()
      )
    );
  }
}
/*
class KlinePageBloc extends KlineBloc {
  @override
  //重写init方法
  void initData() {
    Future<String> future = loadAsset();
    future.then((value) {
      final parseJson = json.decode(value);
      MarketData marketData = MarketData.fromJson(parseJson);
      List<KlineData> list = List<KlineData>();
      for (var item in marketData.data) {
        list.add(KlineData(
            open: item.open,
            close: item.close,
            high: item.high,
            low: item.low,
            vol: item.vol));
      }
      //数据返回后调用 updateDataList(list);
      this.updateDataList(list);
    });
    super.initData();
  }
}*/
Future<String> loadAsset() async {
  return await rootBundle.loadString('json/market.json');
}
