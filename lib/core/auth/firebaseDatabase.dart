import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseDatabase{
  Future addUser(String userId, Map<String, dynamic> userInfoMap){

    return FirebaseFirestore. instance.collection("User").doc(userId).set(userInfoMap);
  }
}