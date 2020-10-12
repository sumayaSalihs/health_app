import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:health_care/Helper/CommonWidgets/CommonWidgets.dart';
import 'package:health_care/Helper/Constant.dart';
import 'package:health_care/Helper/SharedManager.dart';
import 'package:health_care/Localization/app_translations.dart';
import 'package:health_care/Localization/app_translations_delegate.dart';
import 'package:health_care/Localization/application.dart';
import 'package:health_care/Screens/AddWeightScreen/AddWeightScreen.dart';
import 'package:health_care/Screens/DoctorList/DoctorList.dart';
import 'package:health_care/Screens/GoalSettingsScreen/GoalSettingsScreen.dart';
import 'package:health_care/Screens/OrderList.dart/OrderList.dart';
import 'package:health_care/main.dart';
import 'package:health_care/Screens/LoginPage/LoginPage.dart';


class UserProfile extends StatefulWidget {
  @override
  _UserProfileState createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {

List profileList = [];




final List<String> languagesList = application.supportedLanguages;
final List<String> languageCodesList = application.supportedLanguagesCodes;

  

_setUserProfiel() {
  return new Container(
    height: 180,
    // color: Colors.red,
    child: new Column(
      children: <Widget>[
        new Container(
          height: 90,
          width: 90,
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                  image: AssetImage(AppImage.doctorProfile)
              )
          ),
        ),
        SizedBox(height: 15,),
        setCommonText(
            PersonalInfo.name, Colors.black, 18.0, FontWeight.w500, 1),
        setCommonText(PersonalInfo.email, Colors.grey, 17.0, FontWeight.w400, 1)
      ],

    ),
  );
}
//Navigator.pushReplacement(
//context, MaterialPageRoute(builder: (BuildContext context) => LoginPage()));

logOut(){
  return Container(
    padding: EdgeInsets.only(top: 10, left: 40, right: 40, bottom: 20),
    child: Card(
      //color: Colors.grey[100],
      elevation: 0,
      child: IconButton(icon: Icon(Icons.power_settings_new, color: Colors.red, size: 40,), onPressed: (){
        Navigator.of(context,rootNavigator: false).pushAndRemoveUntil(MaterialPageRoute(builder: (context)=>LoginPage()),ModalRoute.withName('/Login'));
      }),
    ),
  );
}

_setBottomView(){
  return new Container(
    height:profileList.length * 50.0,
    color: Colors.white,
    padding: new EdgeInsets.all(12),
    child: new GridView.count(
      crossAxisCount: 2,
      childAspectRatio: 2,
      physics: NeverScrollableScrollPhysics(),
      children: List<Widget>.generate(profileList.length,(index){
        return new Container(
          height: 70,
          padding: new EdgeInsets.only(top:10,bottom: 10, right: 10),
          child: new InkWell(
            onTap: (){
              if(index == 0){
                Navigator.of(context,rootNavigator: false).push(MaterialPageRoute(builder: (context)=>GoalSettingsScreen()));
              }
              else if (index == 1){
                Navigator.of(context,rootNavigator: false).push(MaterialPageRoute(builder: (context)=>DoctorList()));
              }
              else if(index ==2){
                  Navigator.of(context,rootNavigator: false).push(MaterialPageRoute(builder: (context)=>AddWeightScreen()));
                }
                 else if(index == 3){
                   Navigator.of(context,rootNavigator: false).push(MaterialPageRoute(builder: (context)=>OrderList()));
                 } 
                 else{
                  SharedManager.shared.currentIndex = 0;
                  Navigator.of(context,rootNavigator: false).pushAndRemoveUntil(MaterialPageRoute(builder: (context)=>MyHomePage()),ModalRoute.withName('/MyHomePage'));
                  // Navigator.of(context,rootNavigator: true).pushAndRemoveUntil(MaterialPageRoute(builder: (context)=>LoginPage()),ModalRoute.withName('/login'));
                 }
                },
              child: new Material(
              elevation: 2.0,
              borderRadius: new BorderRadius.circular(5),
              child: new Padding(
                padding: new EdgeInsets.only(left: 15,right: 15),
                  child: new Row(
                  children: <Widget>[
                    profileList[index]['icon'],
                    SizedBox(width: 12,),
                    new Container(height: 30,color: Colors.grey[300],width: 2,),
                    SizedBox(width: 12,),
                    new Expanded(
                      child: setCommonText(profileList[index]['title'], Colors.grey, 16.0, FontWeight.w500,1)
                    ),
                    SizedBox(width: 12,),
                    new Icon(Icons.arrow_forward_ios,size: 18,color:AppColor.themeColor),
                  ],
                ),
              ),
            ),
          ),
        );
      }),
    ),
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

    this.profileList = [
    {"title":AppTranslations.of(context).text(AppTitle.profileGoalSetting),"icon":Icon(Icons.gps_fixed,color: AppColor.themeColor,size: 18,)},
    {"title":AppTranslations.of(context).text(AppTitle.profileDoctorFav),"icon":Icon(Icons.favorite,color: AppColor.themeColor,size: 18,)},
    {"title":AppTranslations.of(context).text(AppTitle.profileWeight),"icon":Icon(Icons.widgets,color: AppColor.themeColor,size: 18,)},
    {"title":AppTranslations.of(context).text(AppTitle.profileOrders),"icon":Icon(Icons.local_shipping,color: AppColor.themeColor,size: 18,)},
    //{"title":AppTranslations.of(context).text(AppTitle.drawerLogout),"icon":Icon(Icons.settings_power,color: AppColor.themeColor,size: 18,)},
];

    return MaterialApp(
      debugShowCheckedModeBanner:false,
      home: Scaffold(
         appBar: new AppBar(
          centerTitle: true,
          // title: setHeaderTitle(AppTranslations.of(context).text(AppTitle.appTitle),Colors.white),
          title: setHeaderTitle(AppTranslations.of(context).text(AppTitle.drawerProfile),Colors.white),
          backgroundColor: AppColor.themeColor,
          elevation: 1.0,
          actions: setCommonCartNotificationView(context),
        ),
        drawer: SharedManager.shared.setDrawer(context,PersonalInfo.name,PersonalInfo.email),
        body: new Container(
          color: Colors.white,
          child: new ListView(
            children: <Widget>[
              SizedBox(height: 20,),
              _setUserProfiel(),
              _setBottomView(),
              logOut(),
            ],
          )
        ),
    ),
    routes: {
        '/UserProfile': (BuildContext context) => UserProfile()
      },
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
  //This is for localization
  void onLocaleChange(Locale locale) {
      setState(() {
        _newLocaleDelegate = AppTranslationsDelegate(newLocale: locale);
      });
    }
}