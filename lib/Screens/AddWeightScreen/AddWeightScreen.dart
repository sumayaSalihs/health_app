import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:health_care/Helper/CommonWidgets/CommonWidgets.dart';
import 'package:health_care/Helper/Constant.dart';
import 'package:health_care/Helper/SharedManager.dart';
import 'package:health_care/Localization/app_translations.dart';
import 'package:health_care/Screens/LoginPage/ComonLoginWidgets.dart';


void main() => runApp(new AddWeightScreen());


class AddWeightScreen extends StatefulWidget {
  @override
  _AddWeightScreenState createState() => _AddWeightScreenState();
}

class _AddWeightScreenState extends State<AddWeightScreen> {
  TextEditingController dateInputController;
//  TextEditingController heightInputController;
//  TextEditingController weightInputController;


  _setAddWeightScreen(){
    return new Container(
      // height: 300,
      width: MediaQuery.of(context).size.width,
      // color: Colors.red,
      padding: new EdgeInsets.all(15),
      child: new Column(
        
        children: <Widget>[
          SizedBox(height: 35,),
          setTextFiels("Date",Icons.calendar_today),
          SizedBox(height: 25,),
          setTextFiels("Time",Icons.watch_later),
          SizedBox(height: 25,),
          setTextFiels("Weight",Icons.widgets),
          SizedBox(height: 45,),
          new Container(
                height: 45,
                width: MediaQuery.of(context).size.width,
                child: new Material(
                  color: AppColor.themeColor,
                  borderRadius: BorderRadius.circular(22.5),
                  elevation: 5.0,
                  child: new Center(
                    child: new Text(AppTranslations.of(context).text(AppTitle.addWeight),
                    style: new TextStyle(
                      color: Colors.white,
                      fontSize: 16,
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

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner:false,
      home: new Scaffold(
        body: new Container(
          color: Colors.grey[200],
          child: _setAddWeightScreen(),
        ),
        appBar: new AppBar(
          centerTitle: true,
          // title: setHeaderTitle(AppTranslations.of(context).text(AppTitle.appTitle),Colors.white),
          title: setHeaderTitle(AppTranslations.of(context).text(AppTitle.addWeight),Colors.white),
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