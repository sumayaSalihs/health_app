import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:health_care/Helper/CommonWidgets/CommonWidgets.dart';
import 'package:health_care/Helper/Constant.dart';
import 'package:health_care/Helper/SharedManager.dart';
import 'package:health_care/Localization/app_translations.dart';
import 'package:health_care/Localization/app_translations_delegate.dart';
import 'package:health_care/Localization/application.dart';



void main() => runApp(new AppointmentDetails());


class AppointmentDetails extends StatefulWidget {
  @override
  _AppointmentDetailsState createState() => _AppointmentDetailsState();
}

class _AppointmentDetailsState extends State<AppointmentDetails> {

_setDoctorDetails(){
  return new Container(
    padding: new EdgeInsets.all(15),
    // height: 320,
    color: Colors.grey[100],
    child: new Column(
      children: <Widget>[
        new Container(
          height: 100,
          width: MediaQuery.of(context).size.width,
          // color: Colors.white,
          child: new Material(
            borderRadius: new BorderRadius.circular(8),
            elevation: 2.0,
            child: new Padding(
               padding: new EdgeInsets.only(left: 15,right: 15),
                child: new Row(
                children: <Widget>[
                  new Container(
                    height: 60,
                    width: 60,
                    // color: Colors.red,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: AssetImage(AppImage.doctorList),
                        fit: BoxFit.cover
                      )
                    ),
                  ),
                  SizedBox(width:5),
                  Expanded(
                    child: new Container(
                      // color: Colors.red,
                      child: new Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          setCommonText("JohnSmith", Colors.black, 18.0, FontWeight.w600, 2),
                          SizedBox(height: 3,),
                          setCommonText("Cardiologist", Colors.grey, 15.0, FontWeight.w500, 2),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
        SizedBox(height: 30,),
        new Container(
          height: 60,
          width: MediaQuery.of(context).size.width,
          child: new Material(
            color: Colors.white,
            borderRadius: new BorderRadius.circular(8),
            elevation: 2.0,
            child: new Padding(
              padding: new EdgeInsets.only(left: 15,right: 15),
              child: _setDetailCommonView("Jan 10, 1994",Icons.calendar_today)
            ),
          ),
        ),
        SizedBox(height: 30,),
        new Container(
          height: 60,
          width: MediaQuery.of(context).size.width,
          child: new Material(
            color: Colors.white,
            borderRadius: new BorderRadius.circular(8),
            elevation: 2.0,
            child: new Padding(
              padding: new EdgeInsets.only(left: 15,right: 15),
              child: _setDetailCommonView("10 AM - 12 PM",Icons.watch_later)
            ),
          ),
        ),
        SizedBox(height: 35,),
        new Container(
          height: 300,
          child: new Material(
            color: Colors.white,
            borderRadius: new BorderRadius.circular(8),
              child: new Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                new Expanded(
                  flex: 1,
                  child: new Align(
                    alignment: Alignment.centerLeft,
                      child: new Container(
                      padding: new EdgeInsets.only(left: 15,right: 15),
                      child: setCommonText(AppTranslations.of(context).text(AppTitle.orderService), Colors.black, 20.0, FontWeight.w700,1),
                    ),
                  ),
                ),
                Divider(color: Colors.grey,),
                new Expanded(
                  flex: 2,
                  child: new Container(
                    // color: Colors.green,
                    padding: new EdgeInsets.only(left: 15,right: 15),
                    child: _setOrderServiceView(AppTranslations.of(context).text(AppTitle.overallExamition), "29 mins", "138"),
                  ),
                ),
                Divider(color: Colors.grey,),
                new Expanded(
                  flex: 2,
                  child: new Container(
                    // color: Colors.green,
                    padding: new EdgeInsets.only(left: 15,right: 15),
                    child: _setOrderServiceView(AppTranslations.of(context).text(AppTitle.bloodTest), "12 mins", "38"),
                  ),
                ),
                Divider(color: Colors.grey,),
                new Expanded(
                  flex: 1,
                  child: new Container(
                     padding: new EdgeInsets.only(left: 15,right: 15),
                    child: new Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        setCommonText(AppTranslations.of(context).text(AppTitle.total), Colors.black, 20.0, FontWeight.w700,1),
                        setCommonText("\$380", Colors.black, 20.0, FontWeight.w700,1),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
        SizedBox(height: 30,),
        new Container(
                height: 60,
                width: MediaQuery.of(context).size.width,
                child: new Material(
                  color: AppColor.themeColor,
                  borderRadius: BorderRadius.circular(30),
                  elevation: 5.0,
                  child: new Center(
                    child: new Text(AppTranslations.of(context).text(AppTitle.cancelAppointment),
                    style: new TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w500
                    ),
                    ),
                  ),
                ),
              )
      ],
    ),
  );
}

_setOrderServiceView(String title,String subTitle,String price){
  return new Row(
    mainAxisAlignment:MainAxisAlignment.spaceBetween,
    crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  new Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      setCommonText(title, Colors.grey, 17.0, FontWeight.w700,1),
                      SizedBox(height: 3,),
                      setCommonText(subTitle, Colors.blue, 17.0, FontWeight.w600,1),
                    ],
                  ),
                  setCommonText("\$$price", Colors.black, 17.0, FontWeight.w700,1),
                ],
              );
}

_setDetailCommonView(String title,dynamic icon){
        return new Row(
                children: <Widget>[
                  new Icon(icon,size: 20,),
                  SizedBox(width: 10,),
                  new Container(
                    height: 20,
                    width: 2,
                    color: Colors.grey[400],
                  ),
                  SizedBox(width: 10,),
                  setCommonText(title, Colors.black, 17.0, FontWeight.w500, 1)
                ],
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
      home: new Scaffold(
        body: new Container(
          color: Colors.grey[100],
          child: new ListView(
            children: <Widget>[
              SizedBox(height: 15,),
              _setDoctorDetails(),
            ],
          ),
        ),
        appBar: new AppBar(
          centerTitle: true,
          // title: setHeaderTitle(AppTranslations.of(context).text(AppTitle.appTitle),Colors.white),
          title: setHeaderTitle(AppTranslations.of(context).text(AppTitle.appointmentDetails),Colors.white),
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