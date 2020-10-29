import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CommonFunctions{
//   extension contextExtensions on BuildContext {
//   void unFocus(){
//     FocusScope.of(this).requestFocus(FocusNode());
//   }
// }
  static bool hasOneUpperCase(String password){
    String pattern = r'^(?=.*?[A-Z]).{1,}$';
    RegExp regExp = new RegExp(pattern);
    return regExp.hasMatch(password);
  }
  static bool hasOneLowerCase(String password){
    String  pattern = r'^(?=.*?[a-z]).{1,}$';
    RegExp regExp = new RegExp(pattern);
    return regExp.hasMatch(password);
  }
  static bool hasOneDigit(String password){
    String  pattern = r'^(?=.*?[0-9]).{1,}$';
    RegExp regExp = new RegExp(pattern);
    return regExp.hasMatch(password);
  }
  static bool hasOneSpecialCharacter(String password){
    String  pattern = r'^(?=.*?[!@#\$&*~]).{1,}$';
    RegExp regExp = new RegExp(pattern);
    return regExp.hasMatch(password);
  }
  static bool isValidPassword(String password){
    String  pattern = r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
    RegExp regExp = new RegExp(pattern);
    return regExp.hasMatch(password);
  }
  static bool isValidEmail(String email){
    if(RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(email)){
      return true;
    }else{
      return false;
    }
  }
}