import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:health_care/Helper/Constant.dart';
import 'package:health_care/Helper/SharedManager.dart';
import 'package:health_care/Localization/app_translations.dart';
import 'package:health_care/Screens/BlogDetails/BlogDetails.dart';
import 'package:health_care/Screens/DrugsBlogs/CommonBLogs.dart';


void main()=> runApp(new FoodBlog());


class FoodBlog extends StatefulWidget {
  @override
  _FoodBlogState createState() => _FoodBlogState();
}

class _FoodBlogState extends State<FoodBlog> {
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
                      title: AppTranslations.of(context).text(AppTitle.blogFood),
                    )));
                  },
                  child: setCommonBlog(AppImage.blogFoodImage, "Food and Health?", dummytext, width, width, AppImage.doctorProfile),
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