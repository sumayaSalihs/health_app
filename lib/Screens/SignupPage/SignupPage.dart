import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:health_care/Helper/Constant.dart';
import 'package:health_care/Helper/SharedManager.dart';
import 'package:health_care/Localization/app_translations.dart';
import 'package:health_care/Screens/LoginPage/ComonLoginWidgets.dart';
import 'package:health_care/Screens/TabBarScreens/Tabbar/Tabbar.dart';
import 'package:health_care/Helper/AuthenticationHelper/AuthenticationHelper.dart';

void mian() => runApp(new SignupPage());

class SignupPage extends StatefulWidget {
  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
//  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
//  TextEditingController emailInputController;
//  TextEditingController pwdInputController;
//  TextEditingController usernameInputController;
//  AuthenticationHelper authenticationHelper = new AuthenticationHelper();


  _setSignUPView(){
  return new Container(
    padding: new EdgeInsets.all(20),
    width: MediaQuery.of(context).size.width,
    // color: Colors.red,
    child:  new Column(
      mainAxisAlignment: MainAxisAlignment.start,
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
        setTextFiels(AppTranslations.of(context).text(AppTitle.loginUserName),Icons.person),
        SizedBox(height: 25,),
        setTextFiels(AppTranslations.of(context).text(AppTitle.forgotPassEmail),Icons.email),
        SizedBox(height: 25,),
        setTextFiels(AppTranslations.of(context).text(AppTitle.password),Icons.lock),
        SizedBox(height: 25,),
        setTextFiels(AppTranslations.of(context).text(AppTitle.signUpConfirmPass),Icons.lock),
        SizedBox(height: 45,),
        new InkWell(
          onTap: (){
            Navigator.of(context).push(MaterialPageRoute(builder: (context)=>TabBarScreen()));
          },
          child: new Container(
            height: 45,
            width: MediaQuery.of(context).size.width,
            child: new Material(
              color: AppColor.themeColor,
              borderRadius: BorderRadius.circular(22.5),
              elevation: 5.0,
              child: new Center(
                child: new Text(AppTranslations.of(context).text(AppTitle.loginSignUp),
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
              child: new Text(AppTranslations.of(context).text(AppTitle.loginFbSignIn),
                textDirection: SharedManager.shared.direction,
                style: new TextStyle(
                    color: Colors.white,
                    fontSize: 17,
                    fontWeight: FontWeight.w500
                ),
              ),
            ),
          ),
        ),
        SizedBox(height: 100,),
        new Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            new Text(AppTranslations.of(context).text(AppTitle.signUpNote),
              textDirection: SharedManager.shared.direction,
              style: new TextStyle(
                  color: Colors.grey,
                  fontSize: 16,
                  fontWeight: FontWeight.w500
              ),
            ),
            SizedBox(width: 2,),
            InkWell(
              child: new Text(AppTranslations.of(context).text(AppTitle.loginSignIn),
                textDirection: SharedManager.shared.direction,
                style: new TextStyle(
                    color: AppColor.themeColor,
                    fontSize: 14,
                    fontWeight: FontWeight.w600
                ),
              ),
              onTap: (){
                Navigator.of(context).pop();
              },
            )
          ],
        )
      ],
    ),
  );
}

//  @override
//  void initState() {
//    emailInputController = new TextEditingController();
//    pwdInputController = new TextEditingController();
//    usernameInputController = new TextEditingController();
//    super.initState();
//  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner:false,
      home: new Scaffold(
        appBar: new AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          leading: new IconButton(
            icon: Icon(Icons.arrow_back_ios,color:AppColor.themeColor),
            onPressed: (){
              Navigator.of(context).pop();
            },
          ),
        ),
        body: new Container(
          color: Colors.white,
          child: new ListView(
            children: <Widget>[
              _setSignUPView()
            ],
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