import 'dart:io';

import 'package:chat_app/services/auth_services_hit.dart';
import 'package:chat_app/utils/common_functions.dart';
import 'package:chat_app/viewmodels/my_base_view_model.dart';
import 'package:flutter/cupertino.dart';

class SignUpViewModel extends MyBaseViewModel{
  AuthServicesHit authServicesHit = AuthServicesHit();
  String name;
  String email;
  String password;
  File _profileImage;
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  File getProfileImage() => _profileImage;
  bool isSigningIn = false;
  FocusNode nameFocus = new FocusNode();
  FocusNode emailFocus = new FocusNode();
  FocusNode passwordFocus = new FocusNode();
  bool isNameInFocus = false;
  bool isEmailInFocus = false;
  bool isPasswordInFocus = false;
  String errorMessage;

  void initializeModel() async{
    nameController.clear();
    emailController.clear();
    passwordController.clear();
    isNameInFocus = false;
    isEmailInFocus = false;
    isPasswordInFocus = false;
  }

void _onNameFocus(){
  if(nameFocus.hasFocus){
    isNameInFocus = true;
  }
  else{
    isNameInFocus = false;
  }
  notifyListeners();
}
void _onEmailFocus(){
  if(emailFocus.hasFocus){
    isEmailInFocus = true;
  }
  else{
    isEmailInFocus = false;
  }
  notifyListeners();
}
void _onPasswordFocus(){
  if(passwordFocus.hasFocus){
    isPasswordInFocus = true;
  }
  else{
    isPasswordInFocus = false;
  }
  notifyListeners();
}
void setFocusListener() {
  nameFocus.addListener(_onNameFocus);
  emailFocus.addListener(_onEmailFocus);
  passwordFocus.addListener(_onPasswordFocus);
}
void showErrorMessage(String error) async{
  errorMessage = error;
  notifyListeners();
  await Future.delayed(Duration(seconds: 3));
  errorMessage = null;
  notifyListeners();
}
void validateInfo() async{
  if(nameController.text.isNotEmpty){
    if(emailController.text.length > 0){
      if(passwordController.text.length > 0){
        if(CommonFunctions.isValidEmail(emailController.text.trim())){
          if(CommonFunctions.hasOneUpperCase(passwordController.text.trim())){
            if(CommonFunctions.hasOneLowerCase(
                passwordController.text.trim())){
              if(CommonFunctions.hasOneDigit(passwordController.text.trim())){
                name = nameController.text;
                email = emailController.text;
                password = passwordController.text;
                setBusyForObject("isSigningUp", true);
                var response = await authServicesHit.signup(name: name, email: email, password: password);
                if(response.success){
                  navigateToChatScreen();
                }else{
                  showErrorMessage(response.message);
                }
                setBusyForObject("isSigningUp", false);
              }
              else{
                showErrorMessage("Password should contain at least one digit");
              }
            }
            else{
              showErrorMessage("Password should contain at least one lower case");
            }
          }
          else{
            showErrorMessage("Password should contain at least one upper case");
          }
        }
        else{
          showErrorMessage("Please Enter Valid Email");
        }

      }
      else{
        showErrorMessage("Password is Required");
      }
    }
    else{
      showErrorMessage("email is required");
    }
  }
  else{
    showErrorMessage("name is required");
  }
}
void signIn() async{
    if(emailController.text.length > 0){
      if(passwordController.text.length > 0){
        if(CommonFunctions.isValidEmail(emailController.text.trim())){
          email = emailController.text;
          password = passwordController.text;
          setBusyForObject("isSigningIn", true);
          var response = await authServicesHit.login(email: email, password: password);
          if(response.success){
            navigateToChatScreen();
          }
          else{
            showErrorMessage(response.message);
          }
          setBusyForObject("isSigningIn", false);
        }
        else{
          showErrorMessage("Enter valid Email");
        }
      }
      else{
        showErrorMessage("Please Enter correct Password");
      }
    }
    else{
      showErrorMessage("Please Enter valid Email");
    }
}
void signOut() async{
    await authServicesHit.logout();
    navigateToSignInScreen();
}
void navigateToChatScreen(){
  navService.navigateToChatScreen();
}
void navigateToSignUpScreen(){
    navService.navigateToSignUpScreen();
}
void navigateToSignInScreen(){
    navService.navigateToSignInScreen();
}

}
