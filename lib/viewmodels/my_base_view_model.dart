

import 'package:chat_app/app/locator.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:stacked/stacked.dart';


import 'navigation_viewmodel.dart';

class MyBaseViewModel extends BaseViewModel{
  FirebaseAuth mAuth = FirebaseAuth.instance;
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  Reference storageRef = FirebaseStorage.instance.ref();
  var navService =locator<NavigationViewModel>();
}