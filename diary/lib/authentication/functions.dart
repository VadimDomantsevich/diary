import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:diary/core/constants/collections.dart';
import 'package:diary/model/user.dart';
import 'package:firebase_auth/firebase_auth.dart';

void addNewUserToFirestore() {
  UserModel createdUser =
      UserModel(uid: FirebaseAuth.instance.currentUser!.uid);
  FirebaseFirestore.instance
      .collection(Collections.usersCollection)
      .doc(FirebaseAuth.instance.currentUser!.uid)
      .set(createdUser.toJson());
}
