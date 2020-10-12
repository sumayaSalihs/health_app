import 'package:flutter/material.dart';



class OnboardingCompanyLogo extends StatefulWidget {
  @override
  _OnboardingCompanyLogoState createState() => _OnboardingCompanyLogoState();
}

class _OnboardingCompanyLogoState extends State<OnboardingCompanyLogo> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
            ClipRRect(
                borderRadius: BorderRadius.circular(20.0),
                child: Image.asset('Assets/Login/Logo.png', scale: 10,)
            ),
            SizedBox(height: 40,),
            Text('Welcome to Family Care!', textAlign: TextAlign.center, style: TextStyle(
                fontWeight: FontWeight.w800,
                fontSize: 30, fontFamily: 'Roboto',
                color: Colors.lightGreen[400]
            ),),
            ],
          ),
        )
    );
  }
}

