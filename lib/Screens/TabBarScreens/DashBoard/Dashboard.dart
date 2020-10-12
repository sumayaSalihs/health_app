import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:health_care/Helper/CommonWidgets/CommonWidgets.dart';
import 'package:health_care/Helper/Constant.dart';
import 'package:health_care/Helper/SharedManager.dart';
import 'package:health_care/Localization/app_translations.dart';
import 'package:health_care/Localization/app_translations_delegate.dart';
import 'package:health_care/Localization/application.dart';
import 'package:health_care/Screens/AppointMentList/AppointmentList.dart';
import 'package:health_care/Screens/DrugListScreen/DrugListScreen.dart';
import 'package:health_care/Screens/FindDoctorScreen/FindDoctorScreen.dart';
import 'package:health_care/Screens/FindHospitalScreen/FindHospitalScreen.dart';
import 'package:health_care/Screens/ImportantNoteScreen/ImportantNoteScreen.dart';
import 'package:health_care/Screens/LoginPage/ComonLoginWidgets.dart';


void main() => runApp(new DashboardScreen());


class DashboardScreen extends StatefulWidget {
  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {

  List listData = [
        {"title":"dashbFindDoctor","icon":Icon(Icons.person,color:Colors.black,size: 50,),"availability":"doctorAvaliability","isSelect":true},
        {"title":"dashbFindHospital","icon":Icon(Icons.business,color:Colors.black,size: 50,),"availability":"hospitalAvaliability","isSelect":false},
        {"title":"dashbAppointment","icon":Icon(Icons.queue,color:Colors.black,size: 50,),"availability":"appointmentAvaliability","isSelect":false},
        {"title":"dashbPriceServices","icon":Icon(Icons.insert_invitation,color:Colors.black,size: 50,),"availability":"priceServicesAvaliability","isSelect":false},
        {"title":"webRTC","icon":Icon(Icons.call,color:Colors.black,size: 50,),"availability":"withWebRTC","isSelect":false},
        {"title":"comingSoon","icon":Icon(Icons.settings,color:Colors.black,size: 50,),"availability":"newFunctionality","isSelect":false},
  ];

_setMainInformationView(){
  return new Container(
    // height: 185,
    padding: new EdgeInsets.all(20),
    // color: Colors.red,
    child: new Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        new Row(
          children: <Widget>[
            setCommonText(AppTranslations.of(context).text(AppTitle.dashbHello),Colors.black,25.0,FontWeight.w500,1),
            setCommonText(CreateAccountString.fullName+" ,",Colors.black,25.0,FontWeight.w500,1),
          ],
        ),
        SizedBox(height: 5,),
        setCommonText(AppTranslations.of(context).text(AppTitle.dashbTitleNote),Colors.grey,25.0,FontWeight.w500,2),
        SizedBox(height: 5,),
      ],
    ),
  );
}

_setGridViewListing(){
  return new Container(
    height: 520,
    // color: Colors.yellow,
    padding: new EdgeInsets.all(20),
    child: new GridView.count(
      physics: NeverScrollableScrollPhysics(),
        crossAxisCount: 2,
        childAspectRatio: (3/2.5),
        children: new List<Widget>.generate(listData.length, (index) {
          return new GridTile(
            child: new InkWell(
                onTap: (){
                  setState(() {
                    for(var i = 0; i < listData.length; i++){
                       listData[i]['isSelect'] = false;
                    }
                    listData[index]['isSelect'] = true;
                  });
                  // FindDoctorScreen
                  switch (index) {
                    case 0:
                      Navigator.of(context).push(MaterialPageRoute(builder: (context)=>FindDoctorScreen()));
                      break;
                      case 1:
                      Navigator.of(context).push(MaterialPageRoute(builder: (context)=>FindHospitalScreen()));
                      break;
                      case 2:
                      Navigator.of(context).push(MaterialPageRoute(builder: (context)=>AppointMentList()));
                      break;
                      case 3:
                      Navigator.of(context).push(MaterialPageRoute(builder: (context)=>DrugListScreen()));
                      break;
                      case 4:
                      Navigator.of(context).push(MaterialPageRoute(builder: (context)=>ImportantNoteScreen()));
                      break;
                    default:
                  }
                },
                child: new Card(
                //padding: new EdgeInsets.all(5),
                elevation: 5,
                child: new Material(
                 color: (listData[index]['isSelect'])?Colors.green[400]:Colors.white,
                  elevation: 5,
                  borderRadius: BorderRadius.circular(5),
                    child: new Container(
                    padding: new EdgeInsets.all(12),
                    child: new Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                         listData[index]['icon'],
                         new Column(
                           mainAxisAlignment: MainAxisAlignment.start,
                           crossAxisAlignment: CrossAxisAlignment.center,
                           children: <Widget>[
                             setCommonText(AppTranslations.of(context).text(listData[index]['title']), (listData[index]['isSelect'])?Colors.white:Colors.green[400],16.0, FontWeight.w700,2),
                             SizedBox(height: 3,),
                             setCommonText(AppTranslations.of(context).text(listData[index]['availability']), (listData[index]['isSelect'])?Colors.white:Colors.green[400],12.0, FontWeight.w500,2),
                           ],
                         )
                      ],
                    ),
                  ),
                )
              ),
            ),
          );
        }),
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
    return MaterialApp(
      debugShowCheckedModeBanner:false,
      home: new Scaffold(
        appBar: new AppBar(
          centerTitle: true,
          title: setHeaderTitle(AppTranslations.of(context).text(AppTitle.appTitle),Colors.white),
          backgroundColor: AppColor.themeColor,
          elevation: 1.0,
          actions: setCommonCartNotificationView(context),
        ),
        drawer: SharedManager.shared.setDrawer(context, "Jems Enderson", "jems_enderson003@gmail.com"),
        body: new Container(
          color: Colors.white,
          child: new ListView(
            children: <Widget>[
              _setMainInformationView(),
              _setGridViewListing()
            ],
          ),
        ),
      ),
      routes: {
        '/Dashboard': (BuildContext context) => DashboardScreen()
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