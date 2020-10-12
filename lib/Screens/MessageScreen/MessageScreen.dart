import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:health_care/Helper/CommonWidgets/CommonWidgets.dart';
import 'package:health_care/Helper/Constant.dart';
import 'package:health_care/Helper/SharedManager.dart';
import 'package:health_care/Localization/app_translations.dart';
import 'package:health_care/Localization/app_translations_delegate.dart';
import 'package:health_care/Localization/application.dart';
import 'package:image_picker/image_picker.dart';
import 'package:audio_recorder/audio_recorder.dart';
import 'dart:io' as io;
import 'package:file/file.dart';
import 'package:file/local.dart';
import 'package:path_provider/path_provider.dart';




void main() => runApp(new MessageScreen());



class MessageScreen extends StatefulWidget {
  @override
  _MessageScreenState createState() => _MessageScreenState();
}

class _MessageScreenState extends State<MessageScreen> {

  File _image;
  Future getImage() async {
    final pickedFile = await ImagePicker.pickImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
       _image = io.File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
    print(_image.path);
    return _image;
  }

  imageFromCamera() async {
    File image = await ImagePicker.pickImage(
        source: ImageSource.camera, imageQuality: 50
    );
    setState(() {
      _image = image;
    });
  }

  Recording _recording = new Recording();
  bool _isRecording = false;
  Random random = new Random();
  TextEditingController _controller = new TextEditingController();
  var fs = const LocalFileSystem();

  _start() async {
    try {
      if (await AudioRecorder.hasPermissions) {
        if (_controller.text != null && _controller.text != "") {
          String path = _controller.text;
          if (!_controller.text.contains('/')) {
            io.Directory appDocDirectory =
            await getApplicationDocumentsDirectory();
            path = appDocDirectory.path + '/' + _controller.text;
          }
          print("Start recording: $path");
          await AudioRecorder.start(
              path: path, audioOutputFormat: AudioOutputFormat.AAC);
        } else {
          await AudioRecorder.start();
        }
        bool isRecording = await AudioRecorder.isRecording;
        setState(() {
          _recording = new Recording(duration: new Duration(), path: "");
          _isRecording = isRecording;
        });
      } else {
        Scaffold.of(context).showSnackBar(
            new SnackBar(content: new Text("You must accept permissions")));
      }
    } catch (e) {
      print(e);
    }
  }

  _stop() async {
    var recording = await AudioRecorder.stop();
    print("Stop recording: ${recording.path}");
    bool isRecording = await AudioRecorder.isRecording;
    File file = fs.file(recording.path);
    print("  File length: ${await file.length()}");
    setState(() {
      _recording = recording;
      _isRecording = isRecording;
    });
    _controller.text = recording.path;
  }


  AppTranslationsDelegate _newLocaleDelegate;
  @override
  void initState() {
    super.initState();
    _newLocaleDelegate = AppTranslationsDelegate(newLocale:null);
      application.onLocaleChanged = onLocaleChange;
  }


  Future<void> displayAudio(BuildContext context) async{
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
              title: Text("Start: Begin\nPause: Stop", style: TextStyle(fontSize: 15),),
              content: SingleChildScrollView(
                child: Container(
                  child: new Center(
                    child: new Padding(
                      padding: new EdgeInsets.all(8.0),
                      child: new Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            new FlatButton(
                              onPressed: _isRecording ? null : _start,
                              child: new Text("Start"),
                              color: Colors.green[400],
                            ),
                            new FlatButton(
                              onPressed: _isRecording ? _stop : null,
                              child: new Text("Stop"),
                              color: Colors.red,
                            ),
                            new FlatButton(
                              onPressed: () {
                                //_stop();
                                Navigator.of(context, rootNavigator: true).pop();
                                },
                              child: new Text("Done"),
                              color: Colors.lime,
                            ),
                            new TextField(
                              controller: _controller,
                              decoration: new InputDecoration(
                                hintText: 'Enter a custom path',
                              ),
                            ),
                            new Text("File path of the record: ${_recording.path}"),
                            new Text("Format: ${_recording.audioOutputFormat}"),
                            new Text("Extension : ${_recording.extension}"),
                            new Text("Audio recording duration : ${_recording.duration.toString()}")
                          ]),
                    ),
                  ),
                )
              ));
        });
  }



  Future<void> displaySelectionDiaglogBox(BuildContext context){
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
              title: Text("Select Phone medium: "),
              content: SingleChildScrollView(
                child: ListBody(
                  children: <Widget>[
                    GestureDetector(
                      child: Text("Gallery"),
                      onTap: () {
                        getImage();
                      },
                    ),
                    Padding(padding: EdgeInsets.all(8.0)),
                    GestureDetector(
                      child: Text("Camera"),
                      onTap: () {
                        imageFromCamera();
                      },
                    )
                  ],
                ),
          ));
      });
  }


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner:false,
      home: new Scaffold(
        appBar: new AppBar(
          centerTitle: true,
          // title: setHeaderTitle(AppTranslations.of(context).text(AppTitle.appTitle),Colors.white),
          title: setHeaderTitle("Alexander Wolfe",Colors.white),
          backgroundColor: AppColor.themeColor,
          elevation: 1.0,
          leading: new IconButton(
            icon: Icon(Icons.arrow_back_ios,color:Colors.white),
            onPressed: (){
              Navigator.of(context).pop();
            },
          ),
        ),
        body: new Container(
          color:Colors.grey[300],
          child:Column(
            children: <Widget>[
              new Expanded(
                child: new ListView.builder(
                  itemCount: 3,
                  itemBuilder: (context,index){
                    return (index % 2 == 0)?_setRightBubble():_setLeftBubble();
                  },
                ),
              ),
              new Container(
                padding: new EdgeInsets.only(left: 5,right: 10,bottom: 5,top: 5),
                height: 40,
                color:Colors.white,
                child: new Row(
                  children: <Widget>[
                    InkWell(
                      child: new Icon(Icons.add,color: Colors.black,size: 22,),
                      onTap: (){},
                    ),
                    SizedBox(width: 5,),
                    new Expanded(
                      child: new Container(
                        decoration: BoxDecoration(
                          border: Border.all(width: 1,color: Colors.grey),
                          borderRadius: BorderRadius.circular(30)
                        ),
                        padding: new EdgeInsets.only(left: 10,right: 15),
                        child: new TextFormField(
                          textDirection: SharedManager.shared.direction,
                          decoration: InputDecoration(
                            hintText: AppTranslations.of(context).text(AppTitle.typeHere),
                            border: InputBorder.none,
                            hintStyle: TextStyle(color: Colors.grey,fontSize: 15)
                          ),
                          style: TextStyle(color: Colors.black,fontSize: 16),
                        ),
                      ),
                    ),
                    SizedBox(width: 10,),
                    InkWell(
                      child: new Icon(Icons.camera_alt,color: Colors.black,size: 22,),
                      onTap: (){
                        displaySelectionDiaglogBox(context);
                      },
                    ),
                    SizedBox(width: 10,),
                    InkWell(
                      child: new Icon(Icons.keyboard_voice,color: Colors.black,size: 22,),
                      onTap: (){
                        displayAudio(context);
                      },
                    ),
                  ],
                ),
              )
            ],
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
  void onLocaleChange(Locale locale) {
      setState(() {
        _newLocaleDelegate = AppTranslationsDelegate(newLocale: locale);
      });
    }
}


_setLeftBubble(){
    return new Container(
      // height: 100,
      padding: new EdgeInsets.only(left: 15,right:100,top: 15,bottom: 15),
      child: new Container(
        child: new Material(
          color: Colors.white,
          borderRadius: new BorderRadius.only(
            topRight: Radius.circular(8),
            bottomLeft: Radius.circular(8),
            bottomRight: Radius.circular(8),
          ),
          child: new Padding(
            padding: new EdgeInsets.all(8),
              child: new Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                new Row(
                  children: <Widget>[
                    new Expanded(
                      child: setCommonText("Hello, How may I help you?", Colors.black54, 16.0, FontWeight.w500,5),
                    )
                  ],
                ),
                new Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                      setCommonText("10.45 AM", Colors.grey[400], 14.0, FontWeight.w500,5),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
}

_setRightBubble(){
      return new Container(
      // height: 110,
      padding: new EdgeInsets.only(right: 15,left:100,top: 15,bottom: 15),
      child: new Container(
        child: new Material(
          color: AppColor.themeColor,
          borderRadius: new BorderRadius.only(
            bottomLeft: Radius.circular(8),
            bottomRight: Radius.circular(8),
            topLeft:  Radius.circular(8),
          ),
          child: new Padding(
            padding: new EdgeInsets.all(8),
              child: new Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                new Row(
                  children: <Widget>[
                    new Expanded(
                      child: setCommonText("Hello doctor, Are you there? I want to discuss something with you.", Colors.black87, 16.0, FontWeight.w500,5),
                    )
                  ],
                ),
                new Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                      setCommonText("10.45 AM", Colors.white, 14.0, FontWeight.w500,5),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
}