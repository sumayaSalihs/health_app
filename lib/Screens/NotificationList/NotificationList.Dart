import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:health_care/Helper/CommonWidgets/CommonWidgets.dart';
import 'package:health_care/Helper/Constant.dart';
import 'package:health_care/Helper/SharedManager.dart';
import 'package:health_care/Localization/app_translations.dart';


void main() => runApp(new NotificationsScreen());

class NotificationsScreen extends StatefulWidget {
  @override
  _NotificationsScreenState createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner:false,
      home: new Scaffold(
        body: new Container(
          color: Colors.grey[100],
          child: new ListView.builder(
            itemCount: 7,
            itemBuilder: (context,index){
              return 
              (index == 2)?_setCommonWidgetsForNotificationMessage("Dr.Alexander john sent you a message.", "13 mins ago","Icon(Icons.link)",context):
              _setCommonWidgetsForNotification("It's time to take medical", "3 mins ago",Icon(Icons.link),context);
            },
          ),
        ),
        appBar: new AppBar(
          centerTitle: true,
          // title: setHeaderTitle(AppTranslations.of(context).text(AppTitle.appTitle),Colors.white),
          title: setHeaderTitle(AppTranslations.of(context).text(AppTitle.notification),Colors.white),
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


_setCommonWidgetsForNotification(String title,String time, Icon icon,BuildContext context){
    return new Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.lime
        )
      ),
      height: 100,
      //padding: new EdgeInsets.all(10),
      width: MediaQuery.of(context).size.width,
      child: new Material(
        color: Colors.white,
        //borderRadius: new BorderRadius.circular(5),
        elevation: 2.0,
        child: new Padding(
          padding: new EdgeInsets.only(left: 15,right: 15),
            child: new Row(
            children: <Widget>[
              new Icon(Icons.insert_link),
              SizedBox(width: 8,),
              new Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  setCommonText(title, Colors.black, 18.0, FontWeight.w500, 1),
                  SizedBox(height: 5,),
                  setCommonText(time, Colors.grey, 16.0, FontWeight.w500, 1),
                ],
              )
            ],
          ),
        ),
      ),
    );
}

_setCommonWidgetsForNotificationMessage(String title,String time,String imgUrl,BuildContext context){
    return new Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.lime
        )
      ),
      height: 170,
      //padding: new EdgeInsets.all(10),
      width: MediaQuery.of(context).size.width,
      child: new Material(
        color: Colors.white,
        //borderRadius: new BorderRadius.circular(5),
        elevation: 3.0,
        child: new Padding(
          padding: new EdgeInsets.only(left: 15,right: 15),
            child: new Row(
            children: <Widget>[
              new  Container(
                    height: 50,
                    width: 50,
                    // color: Colors.red,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: AssetImage(AppImage.doctorList),
                        fit: BoxFit.cover,
                      )
                    ),
                  ),
              SizedBox(width: 8,),
              new Expanded(
                  child: new Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    setCommonText(title, Colors.black, 20.0, FontWeight.w500, 2),
                    SizedBox(height: 5,),
                    setCommonText(time, Colors.grey, 16.0, FontWeight.w500, 1),
                    SizedBox(height: 8,),
                    new Container(
                      width: 120,
                      height: 35,
                      child: new Material(
                        elevation: 2.0,
                        borderRadius: new BorderRadius.circular(17.5),
                        color: AppColor.themeColor,
                        child: new Center(
                          child: setCommonText("REPLY", Colors.white, 17.0, FontWeight.w500,1),
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
}