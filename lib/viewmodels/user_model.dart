

import 'dart:io';

import 'package:chat_app/models/index.dart';
import 'package:chat_app/services/auth_services_hit.dart';
import 'package:chat_app/viewmodels/my_base_view_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserViewModel extends MyBaseViewModel{
  Users user;
  File _profileImage;
  File getProfileImage() => _profileImage;
  AuthServicesHit authServicesHit = AuthServicesHit();
  List<Users> users= [];
  void getUsers() async{
    List<Users> allUsers=(await firestore.collection("Users").get()).docs.map((user) => Users.fromJson(user.data())).toList();
    users = allUsers.where((users) =>  user.id != mAuth.currentUser.uid);

  }
  void signOut() async{
    await authServicesHit.logout();
    navigateToSignInScreen();
  }

  void navigateToSignInScreen(){
    navService.navigateToSignInScreen();
  }
  void navigateToProfileScreen(){
    navService.navigateToProfileScreen();
  }
}