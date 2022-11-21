import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final String uid;

  UserModel({
    required this.uid,
  });

  Map<String, dynamic> toFirestore() => {
        'uid': uid,
      };

  factory UserModel.fromFirestore(DocumentSnapshot doc) {
    Map data = doc.data() as Map<dynamic, String>;
    return UserModel(
      uid: data['uid']!,
    );
  }
}
