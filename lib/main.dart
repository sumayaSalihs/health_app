
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:health_care/Helper/Constant.dart';
import 'package:health_care/Helper/SharedManager.dart';
import 'package:health_care/Localization/application.dart';
import 'package:health_care/Screens/LoginPage/LoginPage.dart';
import 'Localization/app_translations_delegate.dart';
import 'Screens/OnBoarding/OnBoardingAppointment.dart';
import 'Screens/OnBoarding/OnBoardingDoctors.dart';
import 'Screens/OnBoarding/OnBoardingMedicine.dart';
import 'Screens/OnBoarding/OnBoardingCompanyLogo.dart';

void main() {
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

/// An indicator showing the currently selected page of a PageController
class DotsIndicator extends AnimatedWidget {
  DotsIndicator({
    this.controller,
    this.itemCount,
    this.onPageSelected,
    this.color: Colors.white,
  }) : super(listenable: controller);

  /// The PageController that this DotsIndicator is representing.
  final PageController controller;

  /// The number of items managed by the PageController
  final int itemCount;

  /// Called when a dot is tapped
  final ValueChanged<int> onPageSelected;

  /// The color of the dots.
  ///
  /// Defaults to `Colors.white`.
  final Color color;

  // The base size of the dots
  static const double _kDotSize = 8.0;

  // The increase in the size of the selected dot
  static const double _kMaxZoom = 2.0;

  // The distance between the center of each dot
  static const double _kDotSpacing = 25.0;

  Widget _buildDot(int index) {
    double selectedness = Curves.easeOut.transform(
      max(
        0.0,
        1.0 - ((controller.page ?? controller.initialPage) - index).abs(),
      ),
    );
    double zoom = 1.0 + (_kMaxZoom - 1.0) * selectedness;
    return new Container(
      width: _kDotSpacing,
      child: new Center(
        child: new Material(
          color: color,
          type: MaterialType.circle,
          child: new Container(
            width: _kDotSize * zoom,
            height: _kDotSize * zoom,
            child: new InkWell(
              onTap: () => onPageSelected(index),
            ),
          ),
        ),
      ),
    );
  }

  Widget build(BuildContext context) {
    return new Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: new List<Widget>.generate(itemCount, _buildDot),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State createState() => new MyHomePageState();
}

class MyHomePageState extends State<MyHomePage> {

  final _controller = new PageController();

  static const _kDuration = const Duration(milliseconds: 300);

  static const _kCurve = Curves.ease;

  final _kArrowColor = Colors.black;

  final List<Widget> _pages = <Widget>[
    OnboardingCompanyLogo(),
    OnBoardingDoctor(),
    OnBoardingMedicine(),
    OnBoardingAppointment(),
  ];

  AppTranslationsDelegate _newLocaleDelegate;
  @override
  void initState() {
    super.initState();
    _newLocaleDelegate = AppTranslationsDelegate(newLocale:null);
    application.onLocaleChanged = onLocaleChange;
  }


  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        debugShowCheckedModeBanner:false,
        home: new Scaffold(
          body: new IconTheme(
            data: new IconThemeData(color: _kArrowColor),
            child:SharedManager.shared.isOnboarding?LoginPage():Container(
              color: Colors.white,
              child: new Stack(
                children: <Widget>[
                  new PageView.builder(
                    physics: new AlwaysScrollableScrollPhysics(),
                    controller: _controller,
                    itemCount: _pages.length,
                    itemBuilder: (BuildContext context, int index) {
                      return _pages[index % _pages.length];
                    },
                  ),
                  new Positioned(
                    bottom: 0.0,
                    left: 0.0,
                    right: 0.0,
                    child: new Container(
                      color: AppColor.themeColor.withOpacity(0.0),
                      padding: const EdgeInsets.all(20.0),
                      child: new Center(
                        child: new DotsIndicator(
                          controller: _controller,
                          itemCount: _pages.length,
                          color: AppColor.themeColor,
                          onPageSelected: (int page) {
                            _controller.animateToPage(
                              page,
                              duration: _kDuration,
                              curve: _kCurve,
                            );
                          },
                        ),
                      ),
                    ),
                  ),
//                   Padding(
//                     padding: const EdgeInsets.only(top: 30,),
//                     child: Align(
//                       alignment: Alignment.topRight,
//                       child: FlatButton(
//                       onPressed: (){
//                         Navigator.of(context).push(MaterialPageRoute(builder: (context)=> LoginPage()));
//                       },
//                       child: new Text("Skip",
//                       style: new TextStyle(
//                         color: AppColor.themeColor,
//                         fontWeight: FontWeight.w500,
//                         fontSize: 17
//                       ),
//                       ),
//                     ),
//                     ),
//                   )
                ],
              ),
            ),
          ),
        ),
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
        routes: {
          '/MyHomePage': (BuildContext context) => MyHomePage(),
        },
        theme: SharedManager.shared.getThemeType()
    );
  }

//This is for localization
  void onLocaleChange(Locale locale) {
    setState(() {
      _newLocaleDelegate = AppTranslationsDelegate(newLocale: locale);
    });
  }

}