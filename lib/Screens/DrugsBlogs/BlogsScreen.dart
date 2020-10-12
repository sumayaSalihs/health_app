import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:health_care/Helper/CommonWidgets/CommonWidgets.dart';
import 'package:health_care/Helper/Constant.dart';
import 'package:health_care/Helper/SharedManager.dart';
import 'package:health_care/Localization/app_translations.dart';
import 'package:health_care/Localization/app_translations_delegate.dart';
import 'package:health_care/Localization/application.dart';
import 'package:health_care/Screens/DrugsBlogs/DrugsBlog.dart';
import 'package:health_care/Screens/DrugsBlogs/FitnessBolg.dart';
import 'package:health_care/Screens/DrugsBlogs/FoodBlog.dart';
import 'package:health_care/Screens/DrugsBlogs/LifeStyle.dart';

void main() => runApp(new DrugsBlogsScreen());


class DrugsBlogsScreen extends StatefulWidget {
  @override
  _DrugsBlogsScreenState createState() => _DrugsBlogsScreenState();
}

class _DrugsBlogsScreenState extends State<DrugsBlogsScreen> {

  AppTranslationsDelegate _newLocaleDelegate;
  @override
  void initState() {
    super.initState();
    _newLocaleDelegate = AppTranslationsDelegate(newLocale:null);
      application.onLocaleChanged = onLocaleChange;
  }
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner:false,
        home: DefaultTabController(
        length: 4,
        initialIndex: 0,
        child: Scaffold(
          appBar: new AppBar(
          centerTitle: true,
          title: setHeaderTitle(AppTranslations.of(context).text(AppTitle.drawerBlogs),Colors.white),
          backgroundColor: AppColor.themeColor,
          elevation: 1.0,
              bottom: TabBar(
                indicatorColor: Colors.red,
                tabs: <Widget>[
                  Tab(
                    text:AppTranslations.of(context).text(AppTitle.blogFood),
                  ),
                  Tab(
                    text: AppTranslations.of(context).text(AppTitle.blogFitness),
                  ),
                  Tab(
                    text: AppTranslations.of(context).text(AppTitle.blogLifestyle),
                  ),
                  Tab(
                    text: AppTranslations.of(context).text(AppTitle.blogDruge),
                  ),
                ],
              ),
              actions: setCommonCartNotificationView(context),
            ),
            body: TabBarView(
              children: <Widget>[
                          FoodBlog(), FitnessBolg(),LifeStyle(), DrugsBlog()
                ],
            ),
            drawer: SharedManager.shared.setDrawer(context,PersonalInfo.name,PersonalInfo.email),
            ),
      ),
      routes: {
        '/DrugsBlogsScreen': (BuildContext context) => DrugsBlogsScreen()
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