import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:health_care/Helper/CommonWidgets/CommonWidgets.dart';
import 'package:health_care/Helper/Constant.dart';
import 'package:health_care/Helper/SharedManager.dart';
import 'package:health_care/Localization/app_translations.dart';
import 'package:health_care/Screens/TabBarScreens/Tabbar/Tabbar.dart';


void main()=> runApp(new PaymentSuccess());



class PaymentSuccess extends StatefulWidget {
  @override
  _PaymentSuccessState createState() => _PaymentSuccessState();
}

class _PaymentSuccessState extends State<PaymentSuccess> {

_setSuccessView(){
  return new Container(
    height: MediaQuery.of(context).size.height,
    width: MediaQuery.of(context).size.width,
    color: AppColor.themeColor,
    child: new Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new Container(
                height: 120,
                width: 120,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(AppImage.paymentSuccess),
                    fit: BoxFit.cover
                  )
                ),
              ),
              SizedBox(height: 30,),
              setCommonText(AppTranslations.of(context).text(AppTitle.thankYou), Colors.white, 20.0, FontWeight.w400, 1),
              SizedBox(height: 8,),
              setCommonText(AppTranslations.of(context).text(AppTitle.successMsg), Colors.white, 16.0, FontWeight.w400, 1),
              SizedBox(height: 1,),
              setCommonText(AppTranslations.of(context).text(AppTitle.haveAGreatDay), Colors.white, 16.0, FontWeight.w400, 1),
              SizedBox(height: 20,),
              new Container(
                height: 50,
                width: MediaQuery.of(context).size.width - 200,
                child: new InkWell(
                  onTap: (){
                    SharedManager.shared.currentIndex = 0;
                        Navigator.of(context).
                        pushAndRemoveUntil(MaterialPageRoute(builder: (context)=>TabBarScreen())
                        ,ModalRoute.withName('/TabBar'));
                  },
                  child: new Material(
                    color: Colors.white,
                    borderRadius: new BorderRadius.circular(25),
                    child: new Center(
                      child: setCommonText(AppTranslations.of(context).text(AppTitle.checkOrder), Colors.black87, 16.0, FontWeight.w500, 1),
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
          color: AppColor.themeColor,
          child: _setSuccessView(),
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