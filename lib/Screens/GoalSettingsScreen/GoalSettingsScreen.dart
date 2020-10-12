import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:health_care/Helper/CommonWidgets/CommonWidgets.dart';
import 'package:health_care/Helper/Constant.dart';
import 'package:health_care/Helper/SharedManager.dart';
import 'package:health_care/Localization/app_translations.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';


void main()=>runApp(new GoalSettingsScreen());


class GoalSettingsScreen extends StatefulWidget {
  @override
  _GoalSettingsScreenState createState() => _GoalSettingsScreenState();
}

class _GoalSettingsScreenState extends State<GoalSettingsScreen> {

_setGoalSettingList(){
  return new ListView.builder(
    itemCount: 7,
    // physics: NeverScrollableScrollPhysics(),
    itemBuilder: (context,index){
      return new Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.lime
          )
        ),
        height: 140,
        padding: new EdgeInsets.only(top: 0,bottom: 0),
        child: new Material(
          color: Colors.white,
          elevation: 5.0,
          borderRadius: new BorderRadius.circular(0),
          child: new Column(
            children: <Widget>[
              new Expanded(
                child: new Container(
                  child: new Padding(
                    padding: new EdgeInsets.only(left: 10,right: 10),
                    child: new Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        new Icon(Icons.opacity,color:AppColor.themeColor),
                        SizedBox(width: 10),
                        new Expanded(
                          child: setCommonText("Transfusion", Colors.grey, 18.0, FontWeight.w500, 1),
                        ),
                        SizedBox(width: 10),
                        new Icon(Icons.more_vert,color:AppColor.themeColor),
                      ],
                    ),
                  ),
                ),
              ),
              new Expanded(
                child: new Container(
                  child: new Row(
                    children: <Widget>[
                      new Expanded(
                        child: new Container(
                          child: new Padding(
                            padding:new EdgeInsets.only(left: 10,right: 10),
                              child: new Column(
                              children: <Widget>[
                                new Row(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: <Widget>[
                                    setCommonText("89", Colors.black, 25.0, FontWeight.w600, 1),
                                    SizedBox(width: 3,),
                                    setCommonText("bpm", Colors.grey, 18.0, FontWeight.w600, 1),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      new Expanded(
                        child: new Container(
                          child: new Padding(
                            padding: new EdgeInsets.only(right: 15),
                            child: new Center(
                              child: new LinearPercentIndicator(
                              animation: true,
                              lineHeight: 16.0,
                              animationDuration: 2500,
                              percent: 0.5,
                              center: setCommonText("50%", Colors.white, 10.0, FontWeight.w500, 1),
                              linearStrokeCap: LinearStrokeCap.roundAll,
                              progressColor: AppColor.themeColor,
                            ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}


_setTotalGoalView(){
  return new Container(
                height: 100,
                width: MediaQuery.of(context).size.width,
                padding: new EdgeInsets.only(left: 30,right: 30),
                child: new Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    setCommonText("${AppTranslations.of(context).text(AppTitle.total)} ${AppTranslations.of(context).text(AppTitle.indicatorGoal)}", Colors.grey, 25.0, FontWeight.w700, 1),
                    setCommonText("50.0 %", AppColor.themeColor, 40.0, FontWeight.w700, 1),
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
          color: Colors.white,
          child: new Column(
            children: <Widget>[
             _setTotalGoalView(),
              new Expanded(
                child: new Container(
                  color: Colors.grey[200],
                  //padding: new EdgeInsets.all(0),
                  child: _setGoalSettingList(),
                ),
              )
            ],
          ),
        ),
        appBar:new AppBar(
          centerTitle: true,
          // title: setHeaderTitle(AppTranslations.of(context).text(AppTitle.appTitle),Colors.white),
          title: setHeaderTitle(AppTranslations.of(context).text(AppTitle.profileGoalSetting),Colors.white),
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