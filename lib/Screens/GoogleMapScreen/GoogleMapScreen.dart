import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:health_care/Helper/CommonWidgets/CommonWidgets.dart';
import 'package:health_care/Helper/Constant.dart';
import 'package:health_care/Helper/Model.dart';
import 'package:health_care/Helper/SharedManager.dart';
import 'package:health_care/Localization/app_translations.dart';


void main () => runApp(new GoogleMapScreen());


class GoogleMapScreen extends StatefulWidget {

  final DoctorInfo doctorInfo;

    GoogleMapScreen({Key key,this.doctorInfo}):super(key:key);

  @override
  _GoogleMapScreenState createState() => _GoogleMapScreenState();
}

class _GoogleMapScreenState extends State<GoogleMapScreen> {

List doctorList = [
  {"Name":"Jems Anderson","address":"B Satyam Corporate,Near Shivranjni ahmedabad","role":"Endocrinologist","review":"4.0","latitude":23.024338,"longitude":72.5280573,"img":AppImage.doctorProfile},
  {"Name":"Tony Stark","address":"ABC, Shindhubhavar Road, Ahmedabad 380060","role":"Neurologist","review":"4.3","latitude":23.0239873,"longitude":72.525906,"img":AppImage.doctorProfile},
  {"Name":"Thor","address":"ABC, Shindhubhavar Road, Ahmedabad 380060","role":"Rheumatologist","review":"4.7","latitude":23.024683,"longitude":72.527290,"img":AppImage.doctorProfile},
  {"Name":"Paul Walker","address":"ABC, Shindhubhavar Road, Ahmedabad 380060","role":"Psychiatrist","review":"4.9","latitude":23.037964,"longitude":72.526907,"img":AppImage.doctorProfile},
];



  Completer<GoogleMapController> _controller = Completer();

  Set<Marker> markers = Set();



  

  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(23.024338, 72.5280573),
    zoom: 14.4746,
  );


  _addmarker(int index){
    // MediaQueryData mediaQueryData = MediaQuery.of(context);
    // ImageConfiguration imageConfig = ImageConfiguration(devicePixelRatio: mediaQueryData.devicePixelRatio,size: Size(20, 20));
   // var imgIcon = await BitmapDescriptor.fromAssetImage(imageConfig,this.doctorList[index]['img']);

        var marker  = listDoctor[index];
            Marker mapMarker = Marker(
              markerId: MarkerId(marker.name,
              ),
              position: LatLng(marker.latitude, marker.longitude,),
              draggable: false,
              infoWindow: InfoWindow(
                title: marker.name,
                snippet:marker.address,
              ),
              // icon:imgIcon
            );
            this.markers.add(mapMarker);
  }


  @override
  void initState() {
    super.initState();
    _addmarker(0);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner:false,
      home: new Scaffold(
        body: new Stack(
          children: <Widget>[
            new Container(
                color: Colors.white,
                child: GoogleMap(
                mapType: MapType.normal,
                compassEnabled: true,
                myLocationButtonEnabled: false,
                initialCameraPosition: _kGooglePlex,
                onMapCreated: (GoogleMapController controller) {
                  _controller.complete(controller);
                },
                markers: this.markers,
                ),
            ),

            Align(
              alignment: Alignment.bottomCenter,
              child: new Container(
                height: 220,
                width: MediaQuery.of(context).size.width,
                padding: new EdgeInsets.only(top: 20,bottom: 20),
                child: new ListView.builder(
                  itemCount: listDoctor.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context,index){
                    return new InkWell(
                      onTap: (){
                        setState(() {
                          this.markers = Set();
                          _addmarker(index);
                        });
                      },
                        child: new Container(
                        height: 180,
                        width: 180,
                        padding: new EdgeInsets.all(8),
                        child: new Material(
                          elevation: 3.0,
                          borderRadius: BorderRadius.circular(8),
                          color: Colors.white,
                          child: new Padding(
                            padding: new EdgeInsets.all(8),
                              child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                new Padding(
                                  padding: new EdgeInsets.all(1),
                                  child:  new  Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                      new Container(
                                        height: 10,
                                        width: 10,
                                        child: new Material(
                                          color: Colors.red,
                                          borderRadius: BorderRadius.circular(5),
                                        ),
                                      ),
                                      new Row(
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: <Widget>[
                                          new Icon(Icons.star_border,color:AppColor.themeColor,size:18),
                                          setCommonText(listDoctor[index].review, Colors.black, 15.0, FontWeight.w500, 2),
                                        ],
                                      ),
                                  ],
                                ),
                                ),
                                new Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    new Container(
                                      height: 60,
                                      width: 60,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        image: DecorationImage(
                                          image:AssetImage(listDoctor[index].image),
                                          fit: BoxFit.cover
                                        )
                                      ),
                                    ),
                                    SizedBox(height: 5,),
                                    setCommonText(listDoctor[index].name, Colors.black, 16.0, FontWeight.w500, 2),
                                    SizedBox(height: 3),
                                    setCommonText(listDoctor[index].role, Colors.grey, 14.0, FontWeight.w500, 2)
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            )
          ],
        ),
        appBar: new AppBar(
          centerTitle: true,
          // title: setHeaderTitle(AppTranslations.of(context).text(AppTitle.appTitle),Colors.white),
          title: setHeaderTitle(AppTranslations.of(context).text(AppTitle.maps),Colors.white),
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