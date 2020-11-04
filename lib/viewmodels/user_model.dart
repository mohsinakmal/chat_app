

import 'dart:io';

import 'package:chat_app/models/index.dart';
import 'package:chat_app/viewmodels/my_base_view_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserViewModel extends MyBaseViewModel{
  File _profileImage;
  File getProfileImage() => _profileImage;
  List<Users> users= [];
  void getUsers() async{
    List<Users> allUsers=(await firestore.collection("Users").get()).docs.map((user) => Users.fromJson(user.data())).toList();
    users = allUsers.where((user) => mAuth.currentUser.uid!= user.id);
  }
}