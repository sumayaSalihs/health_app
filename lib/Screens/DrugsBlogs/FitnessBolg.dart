
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:health_care/Helper/Constant.dart';
import 'package:health_care/Helper/SharedManager.dart';
import 'package:health_care/Localization/app_translations.dart';
import 'package:health_care/Screens/BlogDetails/BlogDetails.dart';

import 'CommonBLogs.dart';


void main() => runApp(new FitnessBolg());


class FitnessBolg extends StatefulWidget {
  @override
  _FitnessBolgState createState() => _FitnessBolgState();
}

class _FitnessBolgState extends State<FitnessBolg> {
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
                      title: AppTranslations.of(context).text(AppTitle.blogFitness),
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