import 'package:flutter/material.dart';
import 'package:health_care/Helper/Constant.dart';
import 'package:health_care/Localization/app_translations.dart';



void main() => runApp(new OnBoardingDoctor());

class OnBoardingDoctor extends StatefulWidget {
  @override
  _OnBoardingDoctorState createState() => _OnBoardingDoctorState();
}

class _OnBoardingDoctorState extends State<OnBoardingDoctor> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset(AppImage.onBoardImg1, scale: 4,),
              SizedBox(height: 40,),
              Text(AppTranslations.of(context).text(AppTitle.onBoardTitle1), textAlign: TextAlign.center, style: TextStyle(
                  fontWeight: FontWeight.w800,
                  fontSize: 30, fontFamily: 'Roboto'
              ),),
              SizedBox(height: 20,),
              Text(AppTranslations.of(context).text(AppString.onBoard1Descript), textAlign: TextAlign.center,style: TextStyle(
                  fontWeight: FontWeight.w500, fontSize: 20, fontFamily: 'Roboto')),
            ],
          ),
        )
    );
  }
}
