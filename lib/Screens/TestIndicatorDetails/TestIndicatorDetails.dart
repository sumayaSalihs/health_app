import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:health_care/Helper/CommonWidgets/CommonWidgets.dart';
import 'package:health_care/Helper/Constant.dart';
import 'package:health_care/Helper/SharedManager.dart';
import 'package:health_care/Localization/app_translations.dart';
import 'package:syncfusion_flutter_charts/charts.dart';


void main() => runApp(new TestIndicatorDetails());

class SalesData {
  SalesData(this.year, this.sales);
  final String year;
  final double sales;
}

class TestIndicatorDetails extends StatefulWidget {
  @override
  _TestIndicatorDetailsState createState() => _TestIndicatorDetailsState();
}

class _TestIndicatorDetailsState extends State<TestIndicatorDetails> {


_setDetailsView(){
  return new Container(
    height: 120,
    color:Colors.grey[100],
    padding: new EdgeInsets.all(20),
    child: new Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        new Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            setCommonText("85", AppColor.themeColor, 25.0, FontWeight.w600, 1),
            SizedBox(width: 3,),
            setCommonText("bpm", Colors.grey, 18.0, FontWeight.w600, 1),
          ],
        ),
        SizedBox(height: 10,),
        new Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Icon(Icons.watch_later,color:Colors.grey),
            SizedBox(width: 3,),
            setCommonText("July 17, 2019", Colors.grey, 17.0, FontWeight.w400, 1),
          ],
        )
      ],
    ),
  );
}
  _setChardIndicatorView(){
    return new Container(
      height: 200,
      child:new Stack(
                children: <Widget>[
                  SfCartesianChart(
                  primaryXAxis: CategoryAxis(),
                  // Enable legend
                  legend: Legend(isVisible: false),
                  // Enable tooltip
                  tooltipBehavior: TooltipBehavior(enable: false),
                  series: <LineSeries<SalesData, String>>[
                    LineSeries<SalesData, String>(
                      dataSource:  <SalesData>[
                        SalesData('Mon', 59),
                        SalesData('Tue', 78),
                        SalesData('Wed', 54),
                        SalesData('Thu', 62),
                        SalesData('Fri', 89),
                        SalesData('Sat', 50),
                        SalesData('Sun', 62),
                      ],
                      xValueMapper: (SalesData sales, _) => sales.year,
                      yValueMapper: (SalesData sales, _) => sales.sales,
                      // Enable data label
                      dataLabelSettings: DataLabelSettings(isVisible: true)
                    )
                  ]
                ),
             ],
      ),
    );
  }
  
  _setMainIndicatiorDescriptionView(){
    return new Container(
      height: MediaQuery.of(context).size.width,
      width: MediaQuery.of(context).size.width,
      padding: new EdgeInsets.all(15),
      child: new Material(
        color: Colors.white,
        elevation: 2.0,
        borderRadius: new BorderRadius.circular(5),
        child: new Padding(
          padding: new EdgeInsets.all(15),
          child: new Container(
            child: new Column(
              children: <Widget>[
                new Expanded(
                  child: new Container(
                    child: new Row(
                      children: <Widget>[
                        new Expanded(
                          child: _setCommonViewForDescription(AppTranslations.of(context).text(AppTitle.indicatorGoal), "July 18, 2020","110"),
                        ),
                        new Container(
                          width: 2,
                          color: Colors.grey[300],
                        ),
                        SizedBox(width: 8,),
                        new Expanded(
                          child: _setCommonViewForDescription(AppTranslations.of(context).text(AppTitle.progress), "July 18, 2020","75"),
                        ),
                      ],
                    ),
                  ),
                ),
                new Container(
                  height: 2,
                  width: MediaQuery.of(context).size.width,
                  color: Colors.grey[300],
                ),
                new Expanded(
                  child: new Container(
                    child:new Row(
                      children: <Widget>[
                        new Expanded(
                          child: _setCommonViewForDescription(AppTranslations.of(context).text(AppTitle.min), "July 18, 2020","20"),
                        ),
                        new Container(
                          width: 2,
                          color: Colors.grey[300],
                        ),
                        SizedBox(width: 8,),
                        new Expanded(
                          child: _setCommonViewForDescription(AppTranslations.of(context).text(AppTitle.max), "July 18, 2020","95"),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _setCommonViewForDescription(String title,String date,String bpm){
    return new Container(
      child: new Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          setCommonText(title, AppColor.themeColor, 20.0, FontWeight.w700, 1),
          SizedBox(height:3),
          setCommonText(date, Colors.grey, 16.0, FontWeight.w500, 1),
          SizedBox(height:10),
          new Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            setCommonText(bpm, Colors.black, 22.0, FontWeight.w600, 1),
            SizedBox(width: 3,),
            setCommonText("bpm", Colors.grey, 17.0, FontWeight.w600, 1),
          ],
        )
        ],
      ),
    );
  }



  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner:false,
      home: new Scaffold(
        body: new Container(
          color: Colors.grey[100],
          child: ListView(
            children: <Widget>[
              _setDetailsView(),
              _setChardIndicatorView(),
              _setMainIndicatiorDescriptionView()
            ],
          ),
        ),
        appBar: new AppBar(
          centerTitle: true,
          // title: setHeaderTitle(AppTranslations.of(context).text(AppTitle.appTitle),Colors.white),
          title: setHeaderTitle("Transfusion ${AppTranslations.of(context).text(AppTitle.indicatorDetails)}",Colors.white),
          backgroundColor: AppColor.themeColor,
          elevation: 1.0,
          leading: new IconButton(
            icon: Icon(Icons.arrow_back_ios,color:Colors.white),
            onPressed: (){
              Navigator.of(context).pop();
            },
          ),
        ),
      ),
      theme: SharedManager.shared.getThemeType(),
      localizationsDelegates: [
          //provides localised strings
          GlobalMaterialLocalizations.delegate,
          //provides RTL support
          GlobalWidgetsLocalizations.delegate,
        ],
        supportedLocales: [
          SharedManager.shared.language
        ],
    );
  }
}