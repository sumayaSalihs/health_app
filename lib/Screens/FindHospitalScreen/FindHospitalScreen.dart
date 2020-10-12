import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:health_care/Helper/CommonWidgets/CommonWidgets.dart';
import 'package:health_care/Helper/Constant.dart';
import 'package:health_care/Helper/SharedManager.dart';
import 'package:health_care/Localization/app_translations.dart';
import 'package:health_care/Screens/HospitalLists/HospitalLists.dart';


void main() => runApp(new FindHospitalScreen());


class FindHospitalScreen extends StatefulWidget {
  @override
  _FindHospitalScreenState createState() => _FindHospitalScreenState();
}

class _FindHospitalScreenState extends State<FindHospitalScreen> {
  @override
  Widget build(BuildContext context) {
    return  new MaterialApp(
      debugShowCheckedModeBanner:false,
      home: new Scaffold(
        body: new Container(
          padding: new EdgeInsets.all(20),
          color:Colors.white,
          child: new ListView(
            children: <Widget>[
              setCommonText(AppTranslations.of(context).text(AppTitle.dashbTitleNote),Colors.black54,22.0, FontWeight.w700,2),
              SizedBox(height: 35,),
              setCommonTextFieldForFillTheDetails(AppTranslations.of(context).text(AppTitle.findDoctor),Icons.person),
              SizedBox(height: 20,),
              setCommonTextFieldForFillTheDetails(AppTranslations.of(context).text(AppTitle.findDoctorDate),Icons.calendar_today),
              SizedBox(height: 20,),
              setCommonTextFieldForFillTheDetails(AppTranslations.of(context).text(AppTitle.findDoctorTime),Icons.watch_later),
              SizedBox(height: 40,),
              new InkWell(
                onTap: (){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context)=>HospitalLists()));
                },
                  child: new Container(
                  height: 50,
                  width: MediaQuery.of(context).size.width,
                  child: new Material(
                    color: AppColor.themeColor,
                    borderRadius: BorderRadius.circular(25),
                    elevation: 5.0,
                    child: new Center(
                      child: new Text(AppTranslations.of(context).text(AppTitle.findDoctorBtnFind),
                      style: new TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w500
                      ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        appBar: new AppBar(
          centerTitle: true,
          // title: setHeaderTitle(AppTranslations.of(context).text(AppTitle.appTitle),Colors.white),
          title: setHeaderTitle(AppTranslations.of(context).text(AppTitle.dashbFindHospital),Colors.white),
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