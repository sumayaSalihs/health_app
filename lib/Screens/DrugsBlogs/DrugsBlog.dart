import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:health_care/Helper/Constant.dart';
import 'package:health_care/Helper/SharedManager.dart';
import 'package:health_care/Localization/app_translations.dart';
import 'package:health_care/Localization/app_translations_delegate.dart';
import 'package:health_care/Localization/application.dart';
import 'package:health_care/Screens/BlogDetails/BlogDetails.dart';

import 'CommonBLogs.dart';


void main()=>runApp(new DrugsBlog());

class DrugsBlog extends StatefulWidget {
  @override
  _DrugsBlogState createState() => _DrugsBlogState();
}

class _DrugsBlogState extends State<DrugsBlog> {

   AppTranslationsDelegate _newLocaleDelegate;
  @override
  void initState() {
    super.initState();
    _newLocaleDelegate = AppTranslationsDelegate(newLocale:null);
      application.onLocaleChanged = onLocaleChange;
  }
  
  @override
 Widget build(BuildContext context) {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
    final width = MediaQuery.of(context).size.width;
    var dummytext = "Lorem Ipsum is simply dummy text of the printing and typesetting industry.";
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: new Scaffold(
        body: Container(
          color: Colors.grey[200],
          child: new GridView.count(
            crossAxisCount: 1,
            children: List<Widget>.generate(5,(index){
              return new Hero(
                tag: index,
                child: new InkWell(
                  onTap: (){
                    Navigator.of(context,rootNavigator: false).push(MaterialPageRoute(builder: (context)=>BlogDetails(
                      title: AppTranslations.of(context).text(AppTitle.blogDruge),
                    )));
                  },
                  child: setCommonBlog(AppImage.blogFoodImage, "Can it usefull?", dummytext, width, width, AppImage.doctorProfile),
                ),
              ); 
            }),
          )
        ),
      ),
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