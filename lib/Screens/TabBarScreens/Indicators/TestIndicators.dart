import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:health_care/Helper/CommonWidgets/CommonWidgets.dart';
import 'package:health_care/Helper/Constant.dart';
import 'package:health_care/Helper/SharedManager.dart';
import 'package:health_care/Localization/app_translations.dart';
import 'package:health_care/Localization/app_translations_delegate.dart';
import 'package:health_care/Localization/application.dart';
import 'package:health_care/Screens/IndicatorList/IndicatorList.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

void main()=>runApp(new TestIndicators());


class TestIndicators extends StatefulWidget {
  @override
  _TestIndicatorsState createState() => _TestIndicatorsState();
}

class _TestIndicatorsState extends State<TestIndicators> {

  _setChardIndicatorView(){
    return new Container(
      height: 200,
      child:SfCartesianChart(
            primaryXAxis: CategoryAxis(),
            // Enable legend
            legend: Legend(isVisible: false),
            // Enable tooltip
            tooltipBehavior: TooltipBehavior(enable: false),
            series: <LineSeries<SalesData, String>>[
              LineSeries<SalesData, String>(
                dataSource:  <SalesData>[
                  SalesData('Mon', 35),
                  SalesData('Tue', 28),
                  SalesData('Wed', 34),
                  SalesData('Thu', 32),
                  SalesData('Fri', 40),
                  SalesData('Sat', 30),
                  SalesData('Sun', 22),
                ],
                xValueMapper: (SalesData sales, _) => sales.year,
                yValueMapper: (SalesData sales, _) => sales.sales,
                // Enable data label
                dataLabelSettings: DataLabelSettings(isVisible: true)
              )
            ]
          ),
    );
  }

_setTestIndicatorView(){
  return new GridView.count(
    crossAxisCount: 1,
    children: List<Widget>.generate(5,(index){
      return new Container(
        color: Colors.lime,
        padding: EdgeInsets.only(bottom: 2),
        height: 350,
        //padding: new EdgeInsets.all(0),
        child: new Material(
          elevation: 0.5,
          color: Colors.white,
          //borderRadius: new BorderRadius.circular(0),
          child: new Column(
            children: <Widget>[
              new Expanded(
                child: new Container(
                  child: Padding(
                    padding: new EdgeInsets.all(8),
                    child: new Row(
                      children: <Widget>[
                        new Icon(Icons.pin_drop,color: AppColor.themeColor,size: 20,),
                        SizedBox(width: 3,),
                        setCommonText("Desinfectant", AppColor.themeColor, 16.0, FontWeight.w600,1)
                      ],
                    ),
                  ),
                ),
              ),
              new Expanded(
                flex: 5,
                child: new Container(
                  child: _setChardIndicatorView(),
                ),
              ),
              Divider(color: Colors.grey,),
              new Expanded(
                child: new Container(
                  child: new Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      new InkWell(
                        onTap: (){
                          Navigator.of(context,rootNavigator: false).push(MaterialPageRoute(builder: (context)=>IndicatorList()));
                        },
                         child: new Row(
                          children: <Widget>[
                            new Icon(Icons.add_box,color:AppColor.themeColor,size: 20,),
                            SizedBox(width: 3,),
                            setCommonText(AppTranslations.of(context).text(AppTitle.indicatorDetails), AppColor.themeColor, 16.0, FontWeight.w500, 1),
                          ],
                        ),
                      ),
                      new Container(
                        color: AppColor.themeColor,
                        height: 20,
                        width: 2,
                      ),
                      new Row(
                        children: <Widget>[
                          new Icon(Icons.blur_circular,color:AppColor.themeColor,size: 20,),
                          SizedBox(width: 3,),
                          setCommonText(AppTranslations.of(context).text(AppTitle.indicatorGoal), AppColor.themeColor, 16.0, FontWeight.w500, 1),
                        ],
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      );
    }),
  );
}

AppTranslationsDelegate _newLocaleDelegate;
@override
  void initState() {
    super.initState();
    SharedManager.shared.isOnboarding = true;
    _newLocaleDelegate = AppTranslationsDelegate(newLocale:null);
      application.onLocaleChanged = onLocaleChange;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner:false,
      home: Scaffold(
        body: _setTestIndicatorView(),
         appBar: new AppBar(
          centerTitle: true,
          // title: setHeaderTitle(AppTranslations.of(context).text(AppTitle.appTitle),Colors.white),
          title: setHeaderTitle(AppTranslations.of(context).text(AppTitle.drawerIndicators),Colors.white),
          backgroundColor: AppColor.themeColor,
          elevation: 1.0,
          actions: setCommonCartNotificationView(context),
        ),
        drawer: SharedManager.shared.setDrawer(context, PersonalInfo.name,PersonalInfo.email),
    ),
    routes: {
        '/TestIndicator': (BuildContext context) => TestIndicators()
      },
      localizationsDelegates: [
          _newLocaleDelegate,
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
  void onLocaleChange(Locale locale) {
      setState(() {
        _newLocaleDelegate = AppTranslationsDelegate(newLocale: locale);
      });
    }
}

class SalesData {
  SalesData(this.year, this.sales);
  final String year;
  final double sales;
}