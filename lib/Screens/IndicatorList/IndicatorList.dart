import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart' as foundation;
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:health_care/Helper/CommonWidgets/CommonWidgets.dart';
import 'package:health_care/Helper/Constant.dart';
import 'package:health_care/Helper/SharedManager.dart';
import 'package:health_care/Localization/app_translations.dart';
import 'package:health_care/Localization/app_translations_delegate.dart';
import 'package:health_care/Localization/application.dart';
import 'package:health_care/Screens/TestIndicatorDetails/TestIndicatorDetails.dart';


void main()=> runApp(new IndicatorList());

bool get isIos =>
    foundation.defaultTargetPlatform == foundation.TargetPlatform.iOS;

class IndicatorList extends StatefulWidget {
  @override
  _IndicatorListState createState() => _IndicatorListState();
}

class _IndicatorListState extends State<IndicatorList> {
   
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
        home: DefaultTabController(
        length: 2,
        initialIndex: 0,
        child: Scaffold(
          appBar: new AppBar(
          centerTitle: true,
          // title: setHeaderTitle(AppTranslations.of(context).text(AppTitle.appTitle),Colors.white),
          title: setHeaderTitle(AppTranslations.of(context).text(AppTitle.indicatortest),Colors.white),
          backgroundColor: AppColor.themeColor,
          elevation: 1.0,
          leading: new IconButton(
                icon: Icon(Icons.arrow_back_ios,color:Colors.white),
                onPressed: (){
                  Navigator.of(context).pop();
                },
              ),
              bottom: TabBar(
                indicatorColor: Colors.red,
                tabs: <Widget>[
                  Tab(
                    text: AppTranslations.of(context).text(AppTitle.basic),
                  ),
                  Tab(
                    text: AppTranslations.of(context).text(AppTitle.premium),
                  )
                ],
              ),
            ),
            body: TabBarView(
              children: <Widget>[IosFirstPage(), IosSecondPage()],
            )),
      ),
      );
    }
     void onLocaleChange(Locale locale) {
      setState(() {
        _newLocaleDelegate = AppTranslationsDelegate(newLocale: locale);
      });
    }
    }


List<BasicIndicator> listBasicPlan = [
    BasicIndicator("Apple Health", Icon(Icons.favorite,color:Colors.red)),
    BasicIndicator("Cerner", Icon(Icons.filter_center_focus,color:Colors.pink)),
    BasicIndicator("iHealth", Icon(Icons.local_hospital,color:Colors.teal)),
    BasicIndicator("Fitbit", Icon(Icons.local_hotel,color:Colors.teal)),
    BasicIndicator("MiBand", Icon(Icons.watch_later,color:Colors.black)),
    BasicIndicator("Withings", Icon(Icons.cloud,color:AppColor.themeColor)),
];

List<PremiumIndicator> listPremium = [
    PremiumIndicator("Blood Pressure Test:",
    "A reading below 120/80 is ideal. If the reading is normal, get tested the next year.",Icon(Icons.tonality,color: Colors.red,)),
    PremiumIndicator("Lipid Profile:",
    "Considered an accurate indicator of your heart health, this blood test measures the total cholesterol, triglycerides, HDL and LDL levels.",Icon(Icons.today,color: Colors.orange,)),
    PremiumIndicator("ECG Test:", 
    "Recommended after age 35, an electrocardiogram (ECG) test is, checks for the risk of heart disease. If the report is normal, it can be repeated annually.",Icon(Icons.transform,color: Colors.pink,)),
    PremiumIndicator("Liver Function Test:",
     "This is done annually to screen for liver conditions, such as alcohol-induced liver damage, fatty liver, Hepatitis C and B.",Icon(Icons.tune,color: Colors.teal,)),
    PremiumIndicator("Kidney Function Test:",
     "A high reading of serum creatinine may indicate impaired kidney function. Even though a reading of 0.3-1.2 is considered normal, the size of an individual also needs to be taken into account.",Icon(Icons.turned_in_not,color: Colors.green)),
    PremiumIndicator("Thyroid Function Tests:",
     "These blood tests are important in detecting underactive (hypothyroidism) or overactive thyroid (hyperthyroidism). In case of normal findings, once-a-year testing is recommended.",Icon(Icons.vibration,color: Colors.grey,)),
    PremiumIndicator("Test For Vitamin D Deficiency:",
     "An extremely common condition, Vitamin D deficiency increases the risk of bone loss and osteoporosis in later years, among other things. A reading < 30 in the blood test indicates a deficiency.",Icon(Icons.voicemail,color: AppColor.themeColor))
];



class IosFirstPage extends StatelessWidget {
  const IosFirstPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      child: new Padding(
        padding: new EdgeInsets.only(top: 15),
        child: _setBasicIndicatorList(listBasicPlan),
      ),
    );
  }
}

class IosSecondPage extends StatelessWidget {
  const IosSecondPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height:MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: new Padding(
        padding: new EdgeInsets.only(top: 15),
        child: _setPremiumIndicatorList(listPremium),
      ),
    );
  }
}



_setBasicIndicatorList(List<BasicIndicator> data){
  return new ListView.builder(
    itemCount: data.length,
    itemBuilder: (context,index){
      return new InkWell(
        onTap: (){
          Navigator.of(context).push(MaterialPageRoute(builder: (context)=>TestIndicatorDetails()));
        },
          child: new Container(
          height: 80,
          padding: new EdgeInsets.only(top: 10, bottom: 10),
          child: new Material(
            color: Colors.white,
            elevation: 2.0,
            //borderRadius: BorderRadius.circular(0),
            child: new Padding(
              padding: EdgeInsets.all(9),
              child: new Row(
                children: <Widget>[
                  data[index].icon,
                  SizedBox(width: 12,),
                  new Container(
                    height: 20,
                    width: 2,
                    color: AppColor.themeColor,
                  ),
                  SizedBox(width: 12,),
                  new Expanded(
                    child: setCommonText(data[index].title,Colors.black, 16.0, FontWeight.w500, 1),
                  ),
                  SizedBox(width: 12,),
                  (index % 2 == 0)?new Icon(Icons.check_circle,color:AppColor.themeColor):new Icon(Icons.check_circle_outline,color:AppColor.themeColor)
                ],
              )
            ),
          ),
        ),
      );
    },
  );
}

_setPremiumIndicatorList(List<PremiumIndicator>data){
  return new ListView.builder(
    itemCount: data.length,
    itemBuilder: (context,index){
      return new InkWell(
        onTap: (){
          Navigator.of(context).push(MaterialPageRoute(builder: (context)=>TestIndicatorDetails()));
        },
          child: new Container(
          // height:100,
          padding: new EdgeInsets.only(top:10, bottom: 10),
          child: new Material(
            color: Colors.white,
            elevation: 2.0,
            //borderRadius: BorderRadius.circular(8),
            child: new Padding(
              padding: EdgeInsets.all(8),
              child: new Row(
                children: <Widget>[
                  data[index].icon,
                  SizedBox(width: 12,),
                  new Container(
                    height: 40,
                    width: 1,
                    color: AppColor.themeColor,
                  ),
                  SizedBox(width: 12,),
                  new Expanded(
                    child: new Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        setCommonText(data[index].title,Colors.black, 17.0, FontWeight.w500, 1),
                        SizedBox(height: 3,),
                        setCommonText(data[index].subTitle,Colors.grey, 16.0, FontWeight.w400, 3),
                      ],
                    )
                  ),
                  SizedBox(width: 12,),
                  new Icon(Icons.check_circle,color:AppColor.themeColor),
                ],
              )
            ),
          ),
        ),
      );
    },
  );
}


class BasicIndicator{
      String title;
      Icon icon;
      BasicIndicator(this.title,this.icon);
}

class PremiumIndicator{
    String title;
    String subTitle;
    Icon icon;

    PremiumIndicator(this.title,this.subTitle,this.icon);
}