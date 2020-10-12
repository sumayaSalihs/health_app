//import 'package:firebase_auth/firebase_auth.dart';
//import 'package:cloud_firestore/cloud_firestore.dart';
//
//class AuthenticationHelper{
//  final FirebaseAuth firebaseAuth = FirebaseAuth.instanceFor();
//
//  Future signUPWithEmailAndPassword(String email, String password, String username) async{
//    await firebaseAuth.createUserWithEmailAndPassword(email: email, password: password).
//    then((currentUser) => FirebaseFirestore.instance
//        .collection("users")
//        .doc(currentUser.user.uid)
//        .set({
//      "uid": currentUser.user.uid,
//      "username": username,
//      "email": email,
//    }));
//  }
//
//  Future signInWithEmailAndPassword(String email, String password) async{
//    await firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
//  }
//}