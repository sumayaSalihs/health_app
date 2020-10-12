import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:health_care/Helper/DatabaseHelper/DatabaseHelper.dart';
import 'package:health_care/Helper/Locator.dart';

class DoctorListCRUDE extends ChangeNotifier{
  final DatabaseHelper databaseHelper = locator<DatabaseHelper>();
  List<Doctor> doctors;

  Future<List<Doctor>> fetchDoctors() async {
    var result = await databaseHelper.getCollection();
    doctors = result.docs
        .map((doc) => Doctor.fromMap(doc.data(), doc.id))
        .toList();
    return doctors;
  }

  Stream<QuerySnapshot> fetchDoctorsAsStream() {
    return databaseHelper.streamCollection();
  }

  Future<Doctor> getDoctorById(String id) async {
    var doc = await databaseHelper.getDocumentById(id);
    return  Doctor.fromMap(doc.data(), doc.id) ;
  }


  Future removeDoctor(String id) async{
    await databaseHelper.deleteDocument(id);
  }
  Future updateDoctor(Doctor data,String id) async{
    await databaseHelper.updateDocument(data.toJSON(), id) ;
  }

  Future addDoctor(Doctor data) async{
    await databaseHelper.addDocument(data.toJSON()) ;
  }

}



class Doctor{
  String id;
  String fullName;
  String speciality;
  String distance;

  Doctor({
    this.id,
    this.fullName,
    this.speciality,
    this.distance
  });

  Doctor.fromMap(Map snapshot, String id):
        this.id = id ?? '',
        this.fullName = snapshot['fullname'] ?? '',
        this.speciality = snapshot['speciality'] ?? '',
        this.distance = snapshot['distance'] ?? '';

  toJSON(){
    return {
      'fullName': fullName,
      'speciality': speciality,
      'distance': distance
    };
  }

}