import 'dart:async';
import 'dart:core';
import 'package:cloud_firestore/cloud_firestore.dart';


class DatabaseHelper{
  final databaseReference = FirebaseFirestore.instance;
  final String collectionPath;
  CollectionReference collectionReference;

  DatabaseHelper(this.collectionPath){
    collectionReference = databaseReference.collection(collectionPath);
  }

  //get the specified data collection
  Future<QuerySnapshot> getCollection(){
    return collectionReference.get();
  }

  //Get the collection asynchrounously
  Stream<QuerySnapshot> streamCollection(){
    return collectionReference.snapshots();
  }

  //Get a document from a collection by id
  Future<DocumentSnapshot> getDocumentById(String id){
     return collectionReference.doc(id).get();
  }

  //Deletes a document from a collection by id
  Future<void> deleteDocument(String id){
    return collectionReference.doc().delete();
  }

  //Add a document to a collectiom
  Future<DocumentReference> addDocument(Map data){
    return collectionReference.add(data);
  }

  //Updates a document in a collection
  Future<void> updateDocument(Map data, String id){
    return collectionReference.doc(id).update(data);
  }
}

