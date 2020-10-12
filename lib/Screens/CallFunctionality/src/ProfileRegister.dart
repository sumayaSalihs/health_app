//

import 'package:flutter/material.dart';
import 'package:health_care/Helper/CommonWidgets/CommonWidgets.dart';
import 'package:health_care/Helper/Constant.dart';
import 'package:health_care/Helper/SharedManager.dart';
import 'package:health_care/Localization/app_translations.dart';
import 'package:health_care/Screens/CallFunctionality/src/call_sample/call_sample.dart';


class ProfileRegister extends StatefulWidget {


  @override
  _ProfileRegisterState createState() => _ProfileRegisterState();
}

class _ProfileRegisterState extends State<ProfileRegister> {

  final _emailController = TextEditingController();
  final _spalizationController = TextEditingController();
  final _patientController = TextEditingController();
  final _passwordController = TextEditingController();
  final _networkIpController = TextEditingController();

  bool isDoctor = true;
  bool isPatient = false;
  //  KeyValueStore keyValueStore = KeyValueStore();

setIconWidgets(){
    return new Container(
                height: 150,
                // color:AppColor.amber,
                child: new Align(
                  alignment: Alignment.bottomCenter,
                  child:new Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                       new Container(
                        height: 80,
                        width: 80,
                        decoration: BoxDecoration(
                          color: Colors.black87,
                          borderRadius: BorderRadius.circular(40),
                          image: DecorationImage(
                            image:AssetImage(this.isDoctor?'Assets/DoctorProfile/doctor.png':"Assets/DoctorProfile/patient.png"),
                            fit: BoxFit.cover,
                          )
                        ),
                      ),
                    ],
                  )
                ),
              );
}

setLoginWidgets(){
      return new Container(
                padding: new EdgeInsets.only(left:25,right:25),
                // color:AppColor.red,
                child: new Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(AppTranslations.of(context).text("fillProfile"),
                                style: new TextStyle(
                                  color:Colors.black,
                                  fontSize: 28.0,
                                  fontWeight:FontWeight.w500
                                ),
                                ),
                    ),
                    SizedBox(height:35),
                    new Container(
                      height: 80,
                      // color: Colors.white,
                      child: new Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                           Text(AppTranslations.of(context).text("name"),
                                style: new TextStyle(
                                  color:Colors.black38,
                                  fontSize: 17.0,
                                  fontWeight:FontWeight.w500
                                ),
                                ),
                          SizedBox(height:5),
                          new Container(
                            height: 45,
                            padding: new EdgeInsets.only(left:8,right:8),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: TextFormField(
                              controller: _emailController,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText:AppTranslations.of(context).text("enterName"),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(height:15),
                    new Container(
                      height: 80,
                      // color: Colors.white,
                      child: new Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(AppTranslations.of(context).text("mobile"),
                                style: new TextStyle(
                                  color:Colors.black38,
                                  fontSize: 17.0,
                                  fontWeight:FontWeight.w500
                                ),
                                ),
                          SizedBox(height:5),
                          new Container(
                            height: 45,
                            padding: new EdgeInsets.only(left:8,right:8),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: TextFormField(
                              controller: _passwordController,
                              obscureText: false,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText:AppTranslations.of(context).text("enterMobile"),
                              ),
                              keyboardType: TextInputType.phone,
                            ),
                          ),
                        ],
                      ),
                    ),
                     SizedBox(height:15),
                    new Container(
                      height: 50,
                      // color:Colors.red,
                      child: new Row(
                        children: <Widget>[
                          new Row(
                            children: <Widget>[
                              new Checkbox(
                                value:this.isDoctor,
                                onChanged:(value){
                                  setState(() {
                                   this.isPatient = false;
                                   this.isDoctor = true;
                                  });
                                }
                                ,
                                checkColor: Colors.white,
                                activeColor: Colors.green,
                              ),
                              new Text(AppTranslations.of(context).text("doctor"),
                                style: new TextStyle(
                                  color:Colors.grey,
                                  fontSize: 15.0
                                ),
                              )
                            ],
                          ),
                          SizedBox(width:5),
                          new Row(
                            children: <Widget>[
                              new Checkbox(
                                value:this.isPatient,
                                 onChanged:(value){
                                   setState(() {
                                     this.isPatient = true;
                                   this.isDoctor = false;
                                   });
                                },
                                checkColor: Colors.white,
                                activeColor: Colors.green,
                              ),
                              new Text(AppTranslations.of(context).text("patient"),
                                style: new TextStyle(
                                  color:Colors.grey,
                                  fontSize: 15.0
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height:15),
                    this.isDoctor?
                     new Container(
                      height: 80,
                      // color: Colors.white,
                      child: new Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                           Text(AppTranslations.of(context).text("doctor"),
                                style: new TextStyle(
                                  color:Colors.black38,
                                  fontSize: 17.0,
                                  fontWeight:FontWeight.w500
                                ),
                                ),
                          SizedBox(height:5),
                          new Container(
                            height: 45,
                            padding: new EdgeInsets.only(left:8,right:8),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: TextFormField(
                              controller: _spalizationController,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: AppTranslations.of(context).text("eg_doctor"),
                              ),
                            ),
                          )
                        ],
                      ),
                    ):
                    new Container(
                      height: 80,
                      // color: Colors.white,
                      child: new Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                           Text(AppTranslations.of(context).text("disease"),
                                style: new TextStyle(
                                  color:Colors.black38,
                                  fontSize: 17.0,
                                  fontWeight:FontWeight.w500
                                ),
                                ),
                          SizedBox(height:5),
                          new Container(
                            height: 45,
                            padding: new EdgeInsets.only(left:8,right:8),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: TextFormField(
                              controller: _patientController,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText:AppTranslations.of(context).text("eg_patient"),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(height:10),
                    new Container(
                      height: 80,
                      // color: Colors.white,
                      child: new Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                           Text(AppTranslations.of(context).text("enterIP"),
                                style: new TextStyle(
                                  color:Colors.black38,
                                  fontSize: 17.0,
                                  fontWeight:FontWeight.w500
                                ),
                                ),
                          SizedBox(height:5),
                          new Container(
                            height: 45,
                            padding: new EdgeInsets.only(left:8,right:8),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: TextFormField(
                              controller: _networkIpController,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "E.g.- 192.168.43.67",
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(height:50),
                    new InkWell(
                      onTap: ()async{
                        final status = checkValicationsForField();
                        var spacility = "";
                        this.isDoctor?
                          spacility = _spalizationController.text:
                          spacility = _patientController.text;

                            SharedManager.shared.name =  _emailController.text;
                            SharedManager.shared.mobile =  _passwordController.text;
                            SharedManager.shared.ipAddress = _networkIpController.text;
                            SharedManager.shared.specility =  spacility;
                            SharedManager.shared.isDoctor = this.isDoctor;

                        if(status){
                          FocusScope.of(context).requestFocus(new FocusNode());
                          Navigator.push(context,MaterialPageRoute(builder: (BuildContext context) =>CallSample(
                            ip:SharedManager.shared.ipAddress,
                            ) //67 //123
                        )); 
                      }
                    },
                        child: new Container(
                          height: 50,
                          width: MediaQuery.of(context).size.width,
                          padding: new EdgeInsets.only(left:8,right:8),
                          decoration: BoxDecoration(
                            color: AppColor.themeColor,
                            borderRadius: BorderRadius.circular(25),
                          ),
                          child: Center(
                            child: Text(AppTranslations.of(context).text("signIN"),
                            style: new TextStyle(
                              color:Colors.white,
                              fontSize: 17.0,
                              fontWeight:FontWeight.w500
                            ),
                            ),
                          )
                        ),
                    ),
                    SizedBox(height:35),
                  ],
                ),
              ); 
}
//192.168.43.67
bool checkValicationsForField(){

  if(_emailController.text == ""){
    SharedManager.shared.showAlertDialog(AppTranslations.of(context).text("validationName"), context);
    return false;
  }
  else if(_passwordController.text == ""){
    SharedManager.shared.showAlertDialog(AppTranslations.of(context).text("validationMobile"), context);
    return false;
  }
  else if(_networkIpController.text == ""){
    SharedManager.shared.showAlertDialog(AppTranslations.of(context).text("validationIp"), context);
    return false;
  }
  if(isDoctor){
      if(_spalizationController.text == ""){
        SharedManager.shared.showAlertDialog(AppTranslations.of(context).text("validationSpecility"), context);
      return false;
    }
  }
  else{
     if(_patientController.text == ""){
          SharedManager.shared.showAlertDialog(AppTranslations.of(context).text("validationDeases"), context);
        return false;
    }
  }
  return true;
}

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    this._networkIpController.text = "192.168.43.67";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        backgroundColor: AppColor.themeColor,
        title: setCommonText(AppTranslations.of(context).text("profileRegistration"), Colors.white, 18.0, FontWeight.w500,1),
      ),
      key: SharedManager.shared.scaffoldKey,
      resizeToAvoidBottomInset:false,
      body: new Container(
        color:Colors.grey[200],
        child: new ListView(
          children: <Widget>[
            setIconWidgets(),
            SizedBox(height:40),
            setLoginWidgets(),
          ],
        ),
      ),
    );
  }
}