import 'package:flutter/material.dart';
import 'package:health_care/Helper/Constant.dart';
import 'package:health_care/Localization/app_translations.dart';
import 'package:health_care/Screens/OnBoarding/OnBoardingComonView.dart';


void main() => runApp(new OnBoardingMedicine());

class OnBoardingMedicine extends StatefulWidget {
  @override
  _OnBoardingMedicineState createState() => _OnBoardingMedicineState();
}

class _OnBoardingMedicineState extends State<OnBoardingMedicine> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(AppImage.onBoardImg2, scale: 4,),
            SizedBox(height: 40,),
            Text(AppTranslations.of(context).text(AppTitle.onBoardTitle2), textAlign: TextAlign.center, style: TextStyle(
                fontWeight: FontWeight.w800,
                fontSize: 30, fontFamily: 'Roboto'
            ),),
            SizedBox(height: 20,),
            Text(AppTranslations.of(context).text(AppString.onBoard2Descript), textAlign: TextAlign.center,style: TextStyle(
                fontWeight: FontWeight.w500, fontSize: 20, fontFamily: 'Roboto')),
          ],
        ),
      )
    );
  }
}
