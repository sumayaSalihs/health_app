import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:health_care/Helper/CommonWidgets/CommonWidgets.dart';
import 'package:health_care/Helper/Constant.dart';
import 'package:health_care/Helper/Model.dart';
import 'package:health_care/Helper/SharedManager.dart';
import 'package:health_care/Localization/app_translations.dart';
import 'package:health_care/Localization/app_translations_delegate.dart';
import 'package:health_care/Localization/application.dart';
import 'package:health_care/Screens/BookAppointment/BookAppointment.dart';
import 'package:health_care/Screens/CallingScreen/CallingScreen.dart';
import 'package:health_care/Screens/GoogleMapScreen/GoogleMapScreen.dart';
import 'package:health_care/Screens/MessageScreen/MessageScreen.dart';
import 'package:health_care/Screens/PersonalInformations/PersonalInformations.dart';
import 'package:health_care/Screens/ReviewScreen/ReviewScreen.dart';
import 'package:health_care/Screens/WorkingAddress/WorkingAddress.dart';


void main() => runApp(new DoctorProfileScreen());


class DoctorProfileScreen extends StatefulWidget {

  final DoctorInfo doctorInfo;
  DoctorProfileScreen({Key key,this.doctorInfo}):super(key:key);

  @override
  _DoctorProfileScreenState createState() => _DoctorProfileScreenState();
}

class _DoctorProfileScreenState extends State<DoctorProfileScreen> {

  List driverInfoList = [];

  _setProfileImageDetailsView(){
    return new Container(
      padding: EdgeInsets.all(5),
      //height: 400,
      child: new Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CircleAvatar(
                radius: 80,
                backgroundImage: AssetImage(AppImage.doctorProfile),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  setCommonText(widget.doctorInfo.name, Colors.black, 18.0, FontWeight.w600, 1),
                  SizedBox(height: 5,),
                  setCommonText(widget.doctorInfo.role, Colors.grey, 16.0, FontWeight.w500, 1),
                  SizedBox(height: 5,),
                  new Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      new Icon(Icons.star_border,color:AppColor.themeColor,size: 18,),
                      SizedBox(width: 3,),
                      setCommonText(widget.doctorInfo.review, AppColor.themeColor, 16.0, FontWeight.w500, 1),
                      SizedBox(width: 8,),
                      setCommonText("(40 ${AppTranslations.of(context).text(AppTitle.reviews)})",Colors.grey, 15.0, FontWeight.w500, 1),
                    ],
                  )
                ],
              ),

            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox.fromSize(
                size: Size(56, 56), // button width and height
                child: ClipOval(
                  child: Material(
                    color: Colors.white, // button color
                    child: InkWell(
                      splashColor: Colors.lime[400], // splash color
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(builder: (context)=>CallingScreen(
                        )));
                      }, // button pressed
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(Icons.call, color: Colors.green,), // icon
                          Text("Call"), // text
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox.fromSize(
                size: Size(64, 64), // button width and height
                child: ClipOval(
                  child: Material(
                    color: Colors.white, // button color
                    child: InkWell(
                      splashColor: Colors.lime[400], // splash color
                      onTap: () {
                        Navigator.of(context,rootNavigator: false).push(MaterialPageRoute(builder: (context)=>MessageScreen(
                        )));
                      }, // button pressed
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(Icons.message, color: Colors.green,), // icon
                          Text("Message"), // text
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox.fromSize(
                size: Size(68, 68), // button width and height
                child: ClipOval(
                  child: Material(
                    color: Colors.white, // button color
                    child: InkWell(
                      splashColor: Colors.lime[400], // splash color
                      onTap: () {
                        Navigator.of(context,rootNavigator: false).push(MaterialPageRoute(builder: (context)=>ReviewScreen(
                        )));
                      }, // button pressed
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(Icons.star_border, color: Colors.green,), // icon
                          Text("Reviews"), // text
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
      SizedBox(height: 10,),
      InkWell(
        onTap: (){
          Navigator.of(context).push(MaterialPageRoute(builder: (context)=>BookAppointment()));
        },
        child: Container(
          height: 50,
          width: MediaQuery.of(context).size.width,
          child: new Material(
            color: AppColor.themeColor,
            borderRadius: BorderRadius.circular(25),
            elevation: 5.0,
            child: new Center(
              child: new Text(AppTranslations.of(context).text(AppTitle.bookAppointment),
                style: new TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.w500
                ),
              ),
            ),
          ),
        ),
      ),
    ]));
  }

  _setPersonalInformationsView(){
    return new Container(
      height: 260,
      // color: Colors.red,
      padding: new EdgeInsets.all(3),
      child: new ListView.builder(
        physics: NeverScrollableScrollPhysics(),
        itemCount: 2,
        itemBuilder: (context,index){
          return new InkWell(
            onTap: (){
              //GoogleMapScreen
              if(index == 0){
                Navigator.of(context,rootNavigator: false).push(MaterialPageRoute(builder: (context)=>PersonalInformations()));
              }
              else{
                Navigator.of(context).push(MaterialPageRoute(builder: (context)=>WorkingAddress()));
              }
            },
            child: new Container(
              height: 80,
              padding: new EdgeInsets.all(8),
              child: new Material(
                color: Colors.grey[100],
                borderRadius: new BorderRadius.circular(5),
                elevation: 1.0,
                child: new Padding(
                  padding: new EdgeInsets.only(left: 15,right: 15),
                  child: new Row(
                    children: <Widget>[
                      driverInfoList[index]['icons'],
                      SizedBox(width: 5,),
                      new Container(
                        width: 2,
                        height: 17,
                        color: AppColor.themeColor,
                      ),
                      SizedBox(width: 10,),
                      new Expanded(
                        child: new Container(
                          child: setCommonText(driverInfoList[index]["title"], Colors.black54, 16.0, FontWeight.w600,2),
                        ),
                      ),
                      SizedBox(width: 5,),
                      new Icon(Icons.arrow_forward_ios,color:AppColor.themeColor,size: 18,),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  AppTranslationsDelegate _newLocaleDelegate;
  @override
  void initState() {
    super.initState();
    _newLocaleDelegate = AppTranslationsDelegate(newLocale:null);
    application.onLocaleChanged = onLocaleChange;
  }


  @override
  Widget build(BuildContext context) {
    this.driverInfoList = [
      {'title':AppTranslations.of(context).text(AppTitle.personalInfo),'icons':Icon(Icons.person,color:AppColor.themeColor,size: 18,),},
      {'title':AppTranslations.of(context).text(AppTitle.workAddress),'icons':Icon(Icons.location_city,color:AppColor.themeColor,size: 18,)},
    ];

    return MaterialApp(
      debugShowCheckedModeBanner:false,
      home: Scaffold(
        body: new Container(
          color: Colors.white,
          child: new ListView(
            children: <Widget>[
              SizedBox(height: 50,),
              _setProfileImageDetailsView(),
              _setPersonalInformationsView()
            ],
          ),
        ),
        appBar: new AppBar(
          centerTitle: true,
          // title: setHeaderTitle(AppTranslations.of(context).text(AppTitle.appTitle),Colors.white),
          title: setHeaderTitle(AppTranslations.of(context).text(AppTitle.doctorsProfile),Colors.white),
          backgroundColor: AppColor.themeColor,
          elevation: 1.0,
          leading: new IconButton(
            icon: Icon(Icons.arrow_back_ios,color:Colors.white),
            onPressed: (){
              Navigator.of(context).pop();
            },
          ),
          actions: <Widget>[
            new IconButton(
              icon: Icon(Icons.place,color:Colors.white),
              onPressed: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (context)=>GoogleMapScreen(
                  doctorInfo: widget.doctorInfo,
                )));
              },
            )
          ],
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
  void onLocaleChange(Locale locale) {
    setState(() {
      _newLocaleDelegate = AppTranslationsDelegate(newLocale: locale);
    });
  }
}