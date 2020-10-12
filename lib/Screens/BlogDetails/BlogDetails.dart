import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:health_care/Helper/CommonWidgets/CommonWidgets.dart';
import 'package:health_care/Helper/Constant.dart';
import 'package:health_care/Helper/SharedManager.dart';
import 'package:health_care/Localization/app_translations_delegate.dart';
import 'package:health_care/Localization/application.dart';


void main() => runApp(new BlogDetails());



class BlogDetails extends StatefulWidget {

  final  title;

  BlogDetails({Key key,this.title}):super(key:key);

  @override
  _BlogDetailsState createState() => _BlogDetailsState();
}

class _BlogDetailsState extends State<BlogDetails> {


final longString = 'Lorem ipsum dolor sit amet, consectetur adipiscing ' +
    'elit, sed do eiusmod tempor incididunt ut labore et dolore magna ' +
    'aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco ' +
    'laboris nisi ut aliquip ex ea commodo consequat.' +
    'It is a long established fact that a reader will be distracted'+
    ' by the readable content of a page when looking at its layout';

_setImageBarView(){
  return new Container(
    height: MediaQuery.of(context).size.width - 100,
    color: Colors.white,
    child: new Stack(
      children: <Widget>[
        new Padding(
          padding: EdgeInsets.only(bottom: 25),
          child: new Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(AppImage.blogFoodImage),
                fit: BoxFit.cover
              )
            ),
          ),
        ),
        Positioned(
          top: 30,
          left: 10,
          child: new Container(
            height: 30,
            width: 30,
            child: new Align(
              alignment: Alignment.center,
              child: IconButton(
                icon: Icon(Icons.arrow_back_ios,color:Colors.white),
                onPressed: (){
                  Navigator.pop(context);
                },
              ),
            ),
          ),
        ),
        Positioned(
          bottom: 5,
          left: 40,
          child: new Container(
            height: 45,
            width: 120,
            child: new Material(
              elevation: 2.0,
              borderRadius: new BorderRadius.circular(22.5),
              color: AppColor.themeColor,
              child: new Center(
                child: setCommonText(widget.title, Colors.white, 18.0, FontWeight.w500, 1),
              ),
            ),
          ),
        )
      ],
    ),
  );
}

var isLiked = false;
_setBlogReactionView(){
  return new Padding(
      padding: const EdgeInsets.all(12),
      child: Row(
        children: <Widget>[
          Row(
            children: <Widget>[
              isLiked? Icon(Icons.favorite, color: Colors.red): Icon(Icons.favorite_border, color: Colors.black),
              SizedBox(width: 4,),
              Text("5012", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12, color: Colors.grey),)
            ],
          ),
          SizedBox(width: 10,),
          Row(
            children: <Widget>[
              Icon(Icons.message, color: Colors.black),
              SizedBox(width: 4,),
              Text("5012", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12, color: Colors.grey),)
            ],
          ),
        ],
      ),
  );
}

_setBlogDescriptionView(){
  return new Container(
    padding: new EdgeInsets.all(15),
    child: new Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        setCommonText("Can it help your blurred vision food", Colors.black87, 22.0, FontWeight.w600, 2),
        SizedBox(height: 8,),
        new Row(
          children: <Widget>[
            CircleAvatar(
              backgroundImage: AssetImage(AppImage.doctorProfile),
            ),
            SizedBox(width: 5,),
            setCommonText("10 July, 2019 by", Colors.grey, 15.0, FontWeight.w400, 1),
            SizedBox(width: 5,),
            setCommonText("Tony Stark", AppColor.themeColor, 15.0, FontWeight.w400, 1),
          ],
        ),
        SizedBox(height: 15,),
        setCommonText(longString, Colors.black45, 16.0, FontWeight.w400, 100),
      ],
    ),
  );
}

 AppTranslationsDelegate _newLocaleDelegate;

 @override
  void initState() {
    super.initState();
    setState(() {
      SharedManager.shared.isOnboarding = true;
    _newLocaleDelegate = AppTranslationsDelegate(newLocale:null);
      application.onLocaleChanged = onLocaleChange;
    });
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
    return MaterialApp(
      debugShowCheckedModeBanner:false,
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
      home: Scaffold(
        primary: false,
        body: new Container(
          color: Colors.white,
          child: ListView(
            children: <Widget>[
              _setImageBarView(),
              _setBlogDescriptionView(),
              _setBlogReactionView()
            ],
          ),
        ),
        appBar: EmptyAppBar(),
      ),
      theme: SharedManager.shared.getThemeType(),
      
    );
  }
  //This is for localization
  void onLocaleChange(Locale locale) {
      setState(() {
        _newLocaleDelegate = AppTranslationsDelegate(newLocale: locale);
      });
    }
}


class  EmptyAppBar  extends StatelessWidget implements PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
  @override
  Size get preferredSize => Size(0.0,0.0);
}