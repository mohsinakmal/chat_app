import 'package:chat_app/models/login_response.dart';
import 'package:chat_app/models/signup_response.dart';

abstract class AuthServices{
  Future<LoginResponse> login({String email, String password});
  Future<SignUpResponse> signup({String name, String email, String password});
  Future logout();
}