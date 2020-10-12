import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:health_care/Helper/CommonWidgets/CommonWidgets.dart';
import 'package:health_care/Helper/Constant.dart';
import 'package:health_care/Helper/Model.dart';
import 'package:health_care/Helper/SharedManager.dart';
import 'package:health_care/Localization/app_translations.dart';
import 'package:health_care/Localization/app_translations_delegate.dart';
import 'package:health_care/Localization/application.dart';
import 'package:health_care/Screens/DoctorProfileScreen/DoctorProfileScreen.dart';


void main() => runApp(new DoctorListTabScreen());

class DoctorListTabScreen extends StatefulWidget {
  @override
  _DoctorListTabScreenState createState() => _DoctorListTabScreenState();
}

class _DoctorListTabScreenState extends State<DoctorListTabScreen> {


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
      home: Scaffold(
        body: new Container(
          color: Colors.grey[100],
          child: new GridView.count(
            crossAxisCount: 1,
            childAspectRatio: 3.8,
            children: new List<Widget>.generate(listDoctor.length, (index) {
                return new InkWell(
                onTap: (){
                  Navigator.of(context,rootNavigator: false).push(MaterialPageRoute(builder: (context)=>DoctorProfileScreen(
                    doctorInfo: listDoctor[index],
                  )));
                },
                child: setWidgetsForList(listDoctor[index].image,listDoctor[index].name,listDoctor[index].role,listDoctor[index].distance,listDoctor[index].review, false),
              );
            }),
          )
        ),
        appBar: new AppBar(
          centerTitle: true,
          // title: setHeaderTitle(AppTranslations.of(context).text(AppTitle.appTitle),Colors.white),
          title: setHeaderTitle(AppTranslations.of(context).text(AppTitle.drawerDoctors ),Colors.white),
          backgroundColor: AppColor.themeColor,
          elevation: 1.0,
          actions: setCommonCartNotificationView(context),
        ),
        drawer: SharedManager.shared.setDrawer(context,PersonalInfo.name,PersonalInfo.email),
      ),
      routes: {
        '/DoctorList': (BuildContext context) => DoctorListTabScreen()
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

