import 'dart:io';

import 'package:chat_app/models/login_response.dart';
import 'package:chat_app/models/signup_response.dart';
import 'package:chat_app/models/users.dart';
import 'package:firebase_storage/firebase_storage.dart';

abstract class AuthServices{
  Future<LoginResponse> login({String email, String password});
  Future<SignUpResponse> signup(Users data, File profileImage);
  Future logout();
}