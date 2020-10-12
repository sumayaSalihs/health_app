import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:health_care/Helper/Constant.dart';
import 'package:health_care/Helper/SharedManager.dart';
import 'package:health_care/Localization/app_translations.dart';
import 'package:health_care/Localization/app_translations_delegate.dart';
import 'package:health_care/Localization/application.dart';
import 'package:health_care/Screens/ForgotPassword/ForgotPassword.dart';
import 'package:health_care/Screens/LoginPage/ComonLoginWidgets.dart';
import 'package:health_care/Screens/SignupPage/SignupPage.dart';
import 'package:health_care/Screens/TabBarScreens/Tabbar/Tabbar.dart';
//import 'package:health_care/Helper/AuthenticationHelper/AuthenticationHelper.dart';


void main() => runApp(new LoginPage());

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController emailInputController;
  TextEditingController pwdInputController;
  //AuthenticationHelper authenticationHelper = new AuthenticationHelper();

bool value = false;

_setLoginView(){
  return new Container(
    padding: new EdgeInsets.all(20),
    // height: MediaQuery.of(context).size.height,
    width: MediaQuery.of(context).size.width,
    // color: Colors.red,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        new Container(
          height: 80,
          width: 80,
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                  image: AssetImage(AppImage.appLogo)
              )
          ),
        ),
        SizedBox(height: 50,),
        setTextFiels(AppTranslations.of(context).text("loginUserName"),Icons.person),
        SizedBox(height: 25,),
        setTextFiels(AppTranslations.of(context).text("password"),Icons.lock),
        SizedBox(height: 25,),
        new Row(
          children: <Widget>[
            new Checkbox(
              value: this.value,
              onChanged: (value){
                setState(() {
                  this.value = value;
                });
              },
            ),
            new Text(AppTranslations.of(context).text("rememberMe"),
              textDirection: SharedManager.shared.direction,
              style: new TextStyle(
                  color: Colors.grey,
                  fontSize: 16,
                  fontWeight: FontWeight.w500
              ),
            ),
          ],
        ),
        SizedBox(height: 25,),
        new InkWell(
          onTap: (){
            // Navigator.of(context).push(MaterialPageRoute(builder: (context)=>TabBarScreen()));
            Navigator.of(context).
            pushAndRemoveUntil(
                MaterialPageRoute(builder: (context)=>TabBarScreen()),
                ModalRoute.withName('/TabBar')
            );
          },
          child: new Container(
            height: 45,
            width: MediaQuery.of(context).size.width,
            child: new Material(
              color: AppColor.themeColor,
              borderRadius: BorderRadius.circular(22.5),
              elevation: 5.0,
              child: new Center(
                child: new Text(AppTranslations.of(context).text("loginSignIn"),
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
        SizedBox(height: 25,),
        new Container(
          height: 45,
          width: MediaQuery.of(context).size.width,
          child: new Material(
            color: AppColor.themeColor,
            borderRadius: BorderRadius.circular(22.5),
            elevation: 5.0,
            child: new Center(
              child: new Text(AppTranslations.of(context).text("loginFbSignIn"),
                textDirection: SharedManager.shared.direction,
                style: new TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w500
                ),
              ),
            ),
          ),
        ),
        SizedBox(height: 20,),
        new Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            InkWell(
              child: new Text(AppTranslations.of(context).text("loginForgetPass"),
                style: new TextStyle(
                    color: Colors.grey,
                    fontSize: 18,
                    fontWeight: FontWeight.w600
                ),
              ),
              onTap: (){
                Navigator.of(context).push(MaterialPageRoute(builder:(context)=>ForgotPassword()));
              },
            )
          ],
        ),
        SizedBox(height: 100,),
        new Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            new Text(AppTranslations.of(context).text("loginDontHaveAccount"),
              textDirection: SharedManager.shared.direction,
              style: new TextStyle(
                  color: Colors.grey,
                  fontSize: 16,
                  fontWeight: FontWeight.w500
              ),
            ),
            SizedBox(width: 2,),
            InkWell(
              child: new Text(AppTranslations.of(context).text("loginSignUp"),
                textDirection: SharedManager.shared.direction,
                style: new TextStyle(
                    color: AppColor.themeColor,
                    fontSize: 14,
                    fontWeight: FontWeight.w600
                ),
              ),
              onTap: (){
                Navigator.of(context).push(MaterialPageRoute(builder:(context)=>SignupPage()));
              },
            )
          ],
        )
      ],
    ),
  );
}

AppTranslationsDelegate _newLocaleDelegate;
  @override
  void initState() {
//    emailInputController = new TextEditingController();
//    pwdInputController = new TextEditingController();
    super.initState();
    _newLocaleDelegate = AppTranslationsDelegate(newLocale:null);
      application.onLocaleChanged = onLocaleChange;
  }
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner:false,
      home: new Scaffold(
        body: new Container(
          child:new ListView(
            children: <Widget>[
              _setLoginView(),
            ],
          )
        ),
      ),
        routes: {
        '/login': (BuildContext context) => LoginPage()
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

  void onLocaleChange(Locale locale) {
      setState(() {
        _newLocaleDelegate = AppTranslationsDelegate(newLocale: locale);
      });
    }

}