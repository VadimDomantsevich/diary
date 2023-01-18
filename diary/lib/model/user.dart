import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:diary/core/constants/user_fields.dart';

class UserModel {
  final String uid;

  UserModel({
    required this.uid,
  });

  Map<String, dynamic> toFirestore() => {
        UserFields.uid: uid,
      };

  factory UserModel.fromFirestore(DocumentSnapshot doc) {
    Map data = doc.data() as Map<dynamic, String>;
    return UserModel(
      uid: data[UserFields.uid]!,
    );
  }
}
