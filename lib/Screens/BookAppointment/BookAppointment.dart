import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:health_care/Helper/CommonWidgets/CommonWidgets.dart';
import 'package:health_care/Helper/Constant.dart';
import 'package:health_care/Helper/SharedManager.dart';
import 'package:health_care/Localization/app_translations.dart';
import 'package:table_calendar/table_calendar.dart';


void main ()=> runApp(new BookAppointment());


class BookAppointment extends StatefulWidget {
  @override
  _BookAppointmentState createState() => _BookAppointmentState();
}

class _BookAppointmentState extends State<BookAppointment> with TickerProviderStateMixin{

  final Map<DateTime, List> _holidays = {
  DateTime(2019, 1, 1): ['New Year\'s Day'],
  DateTime(2019, 1, 6): ['Epiphany'],
  DateTime(2019, 2, 14): ['Valentine\'s Day'],
  DateTime(2019, 4, 21): ['Easter Sunday'],
  DateTime(2019, 4, 22): ['Easter Monday'],
};



 Map<DateTime, List> _events;
  List selectedEvents;
  AnimationController _animationController;
  CalendarController _calendarController;

  @override
  void initState() {
    super.initState();
    final _selectedDay = DateTime.now();

    _events = {
    };

    selectedEvents = _events[_selectedDay] ?? [];
    _calendarController = CalendarController();

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );

    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    _calendarController.dispose();
    super.dispose();
  }

  void _onDaySelected(DateTime day, List events) {
    print('CALLBACK: _onDaySelected');
    setState(() {
      selectedEvents = events;
    });
  }

  void _onVisibleDaysChanged(DateTime first, DateTime last, CalendarFormat format) {
    print('CALLBACK: _onVisibleDaysChanged');
  }


_setProfileImageView(){
  return Container(
    padding: EdgeInsets.all(10),
    child: Column(
      children: <Widget>[
        SizedBox.fromSize(
          size: Size(100, 100), // button width and height
          child: ClipOval(
            child: Material(
              color: Colors.white, // button color
              child: InkWell(
                splashColor: Colors.lime[400], // splash color
                onTap: () {
                }, // button pressed
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Image.asset(AppImage.doctorProfile), // icon
                    //Text("Message"), // text
                  ],
                ),
              ),
            ),
          ),
        ),
        setCommonText(PersonalInfo.name,Colors.black, 17.0, FontWeight.w600,1)
      ],
    ),
  );
}

_setCalendarView(){
  return new Container(
    padding: new EdgeInsets.all(20),
    child: new Material(
      color: AppColor.themeColor,
      borderRadius: new BorderRadius.circular(8),
      elevation: 3.0,
      child: TableCalendar(
              calendarController: _calendarController,
              events: _events,
              holidays: _holidays,
              startingDayOfWeek: StartingDayOfWeek.monday,
              daysOfWeekStyle: DaysOfWeekStyle(
                weekdayStyle: TextStyle(color: Colors.white),
                weekendStyle: TextStyle(color: Colors.white)
              ),
              calendarStyle: CalendarStyle(
                weekdayStyle: TextStyle(color: Colors.white,),
                weekendStyle: TextStyle(color: Colors.white,fontWeight: FontWeight.w600),
                selectedColor: Colors.deepOrange[400],
                todayColor: Colors.orange[400],
                markersColor: Colors.black,
                outsideDaysVisible: false,
              ),
              onDaySelected: _onDaySelected,
              onVisibleDaysChanged: _onVisibleDaysChanged,
      ),
    ),
  );
}

_setTimingView(){
  return new Container(
    height:100,
    padding: new EdgeInsets.all(15),
    child: new ListView.builder(
      itemCount: 3,
      scrollDirection: Axis.horizontal,
      itemBuilder: (context,index){
        return new Container(
          height: 70,
          width: MediaQuery.of(context).size.width/3,
          padding: new EdgeInsets.all(8),
          child: new Container(
            decoration: BoxDecoration(
              border: Border.all(width: 1,color:AppColor.themeColor),
              borderRadius: BorderRadius.circular(8)
            ),
            child: new Center(
              child: setCommonText("10.00 AM", AppColor.themeColor, 16.0, FontWeight.w500,1),
            ),
          ),
        );
      },
    ),
  );
}

_setBookNowView(){
  return new Container(
    height: 110,
    child: new Padding(
                  padding: new EdgeInsets.all(30),
                  child: new InkWell(
                    onTap: (){
                      // Navigator.of(context).push(MaterialPageRoute(builder: (context)=>BookAppointment()));
                    },
                    child: new Container(
                    height: 50,
                    width: MediaQuery.of(context).size.width,
                    child: new Material(
                      color: AppColor.themeColor,
                      borderRadius: BorderRadius.circular(25),
                      elevation: 5.0,
                      child: new Center(
                        child: new Text(AppTranslations.of(context).text(AppTitle.bookNow),
                        style: new TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w500
                        ),
                        ),
                      ),
                    ),
              ),
  ))
  );
}

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner:false,
      home: new Scaffold(
        body: new Container(
          child: new ListView(
            children: <Widget>[
              _setProfileImageView(),
              _setCalendarView(),
              _setTimingView(),
              _setBookNowView(),
            ],
          ),
        ),
        appBar: new AppBar(
          centerTitle: true,
          // title: setHeaderTitle(AppTranslations.of(context).text(AppTitle.appTitle),Colors.white),
          title: setHeaderTitle(AppTranslations.of(context).text(AppTitle.bookAppointment),Colors.white),
          backgroundColor: AppColor.themeColor,
          elevation: 1.0,
          leading: new IconButton(
            icon: Icon(Icons.arrow_back_ios,color:Colors.white),
            onPressed: (){
              Navigator.of(context).pop();
            },
          ),
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