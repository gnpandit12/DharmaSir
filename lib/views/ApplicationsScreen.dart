import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';
import 'package:flutter_app/model/SubscribesSeries.dart';
import 'package:flutter_app/utils/SizeConfig.dart';

List<charts.Series<SubscriberSeries, String>> Series;

class ApplicationScreen extends StatefulWidget {
  @override
  _ApplicationScreenState createState() => _ApplicationScreenState();
}

class _ApplicationScreenState extends State<ApplicationScreen> {

  @override
  void initState() {
    print("initState!");

    final List<SubscriberSeries> data = [
      SubscriberSeries(
        year: "2008",
        subscribers: 10000000,
        barColor: charts.ColorUtil.fromDartColor(Colors.blue),
      ),
      SubscriberSeries(
        year: "2009",
        subscribers: 11000000,
        barColor: charts.ColorUtil.fromDartColor(Colors.blue),
      ),
      SubscriberSeries(
        year: "2010",
        subscribers: 12000000,
        barColor: charts.ColorUtil.fromDartColor(Colors.blue),
      ),
      SubscriberSeries(
        year: "2011",
        subscribers: 10000000,
        barColor: charts.ColorUtil.fromDartColor(Colors.blue),
      ),
      SubscriberSeries(
        year: "2012",
        subscribers: 8500000,
        barColor: charts.ColorUtil.fromDartColor(Colors.blue),
      ),
      SubscriberSeries(
        year: "2013",
        subscribers: 7700000,
        barColor: charts.ColorUtil.fromDartColor(Colors.blue),
      ),
      SubscriberSeries(
        year: "2014",
        subscribers: 7600000,
        barColor: charts.ColorUtil.fromDartColor(Colors.blue),
      ),
      SubscriberSeries(
        year: "2015",
        subscribers: 5500000,
        barColor: charts.ColorUtil.fromDartColor(Colors.red),
      ),
    ];

    Series = method(data);

    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: SizeConfig.blockSizeHorizontal * 100,
          height: SizeConfig.blockSizeVertical * 100,
          child: charts.BarChart(Series, animate: true),
        ),
      )
    );
  }


  List<charts.Series<SubscriberSeries, String>> method(var data){
    List<charts.Series<SubscriberSeries, String>> series = [
      charts.Series(
          id: "Subscribers",
          data: data,
          domainFn: (SubscriberSeries series, _) => series.year,
          measureFn: (SubscriberSeries series, _) => series.subscribers,
          colorFn: (SubscriberSeries series, _) => series.barColor)
    ];
    return series;
  }

}
