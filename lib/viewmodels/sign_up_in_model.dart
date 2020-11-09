import 'dart:io';

import 'package:chat_app/models/users.dart';
import 'package:chat_app/services/auth_services_hit.dart';
import 'package:chat_app/utils/common_functions.dart';
import 'package:chat_app/viewmodels/my_base_view_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';

class SignUpViewModel extends MyBaseViewModel{
  AuthServicesHit authServicesHit = AuthServicesHit();
  File _profileImage;
  Users user;
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  //String userId;
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
    _profileImage = null;
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
                user = new Users();
                user.name = nameController.text;
                user.email = emailController.text;
                user.password = passwordController.text;
                user.profileImage = "";
                setBusyForObject("isSigningUp", true);
                var response = await authServicesHit.signup(user,_profileImage);
                if(response.success){
                  navigateToHomeScreen();
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
          user = new Users();
          user.email = emailController.text;
          user.password = passwordController.text;
          setBusyForObject("isSigningIn", true);
          var response = await authServicesHit.login(email: user.email, password: user.password);
          if(response.success){
            navigateToHomeScreen();
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
  Future<PickedFile> _getImageFromGallery()async{
    return await ImagePicker().getImage(source: ImageSource.gallery);
  }
  Future<PickedFile> _getImageFromCamera()async{
    return await ImagePicker().getImage(source: ImageSource.camera);
  }
  void selectProfileImageFromGallery() async{
    var response = await _getImageFromGallery();
    if(response!=null){
      _profileImage = File(response.path);
      notifyListeners();
    }
  }
  void selectProfileImageFromCamera() async{
    var response = await _getImageFromCamera();
    if(response!=null){
      _profileImage = File(response.path);
      notifyListeners();
    }
  }
  void signOut() async{
    await authServicesHit.logout();
    navigateToSignInScreen();
}
void navigateToChatScreen(){
  navService.navigateToChatScreen(Users());
}
void navigateToSignUpScreen(){
    navService.navigateToSignUpScreen();
}
void navigateToSignInScreen(){
    navService.navigateToSignInScreen();
}
void navigateToHomeScreen(){
    navService.navigateToHomeScreen();
}

}
