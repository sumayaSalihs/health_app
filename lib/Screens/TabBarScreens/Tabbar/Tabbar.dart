import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:health_care/Helper/Constant.dart';
import 'package:health_care/Helper/SharedManager.dart';
import 'package:health_care/Localization/app_translations.dart';
import 'package:health_care/Localization/app_translations_delegate.dart';
import 'package:health_care/Localization/application.dart';
import 'package:health_care/Screens/DrugsBlogs/BlogsScreen.dart';
import 'package:health_care/Screens/TabBarScreens/DashBoard/Dashboard.dart';
import 'package:health_care/Screens/TabBarScreens/DoctorList/DoctorList.dart';
import 'package:health_care/Screens/TabBarScreens/Indicators/TestIndicators.dart';
import 'package:health_care/Screens/TabBarScreens/UserProfile/UserProfile.dart';


void main() => runApp(new TabBarScreen());


class TabBarScreen extends StatefulWidget {
  @override
  _TabBarScreenState createState() => _TabBarScreenState();
}

class _TabBarScreenState extends State<TabBarScreen> {

bool isButtonClick = false;
 


final List<Widget> listScreen = [
  DashboardScreen(),
  DoctorListTabScreen(),
  DrugsBlogsScreen(),
  TestIndicators(),
  UserProfile()
];

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
    return MaterialApp(
      debugShowCheckedModeBanner:false,
      home: new Scaffold(
        body:listScreen[SharedManager.shared.currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: SharedManager.shared.currentIndex,
          selectedItemColor: AppColor.themeColor,
          onTap: onTabTapped,
          items:[
            new BottomNavigationBarItem(
              icon: Icon(Icons.home,),
              activeIcon: Icon(Icons.home,),
              title: Text(AppTranslations.of(context).text(AppTitle.drawerHome)),
            ),
            new BottomNavigationBarItem(
              icon: Icon(Icons.local_hospital),
              title: Text(AppTranslations.of(context).text(AppTitle.drawerDoctors)),
            ),
            new BottomNavigationBarItem(
              icon: Icon(Icons.grain,color: Colors.white.withAlpha(0),),
              title: Text(AppTranslations.of(context).text(AppTitle.drawerBlogs)),
            ),
            new BottomNavigationBarItem(
              icon: Icon(Icons.grain),
              title: Text(AppTranslations.of(context).text(AppTitle.drawerIndicators)),
            ),
            new BottomNavigationBarItem(
              icon: Icon(Icons.person),
              title: Text(AppTranslations.of(context).text(AppTitle.drawerProfile)),
            ),
          ]
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: FloatingActionButton(
          child: new Icon(Icons.speaker_group,color:isButtonClick?Colors.green[400]:Colors.black,),
          onPressed: (){
            setState(() {
              isButtonClick = true;
              SharedManager.shared.currentIndex = 2;
            });
          },
          backgroundColor: Colors.grey[300],
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
          '/TabBar' : (BuildContext context) => TabBarScreen()
        },
        theme: SharedManager.shared.getThemeType()
    );
  }

  void onTabTapped(int index) {
   setState(() {
     if(index != 2){
       isButtonClick = false;
     SharedManager.shared.currentIndex = index;
     }
     else{
       SharedManager.shared.currentIndex = index;
     }
   });
 }

 //This is for localization
  void onLocaleChange(Locale locale) {
      setState(() {
        _newLocaleDelegate = AppTranslationsDelegate(newLocale: locale);
      });
    }

}

