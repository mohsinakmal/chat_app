import 'package:chat_app/services/auth_services_hit.dart';
import 'package:chat_app/utils/common_functions.dart';
import 'package:chat_app/viewmodels/my_base_view_model.dart';
import 'package:flutter/cupertino.dart';

class SignUpViewModel extends MyBaseViewModel{
  AuthServicesHit authServicesHit = AuthServicesHit();
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  FocusNode nameFocus = new FocusNode();
  FocusNode emailFocus = new FocusNode();
  FocusNode passwordFocus = new FocusNode();
  bool isNameInFocus = false;
  bool isEmailInFocus = false;
  bool isPasswordInFocus = false;

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
void validateInfo() async{
  if(nameController.text.isNotEmpty){
    if(emailController.text.length > 0){
      if(passwordController.text.length > 0){
        if(CommonFunctions.isValidEmail(emailController.text.trim())){
          if(CommonFunctions.hasOneUpperCase(passwordController.text.trim())){
            if(CommonFunctions.hasOneLowerCase(
                passwordController.text.trim())){
              if(CommonFunctions.hasOneDigit(passwordController.text.trim())){
                setBusyForObject("is SigningUp", true);
                var response = await authServicesHit.signup();
                if(response.success){
                  navigateToHomeScreen();
                }else{
                }
              }
            }
          }
        }

      }
    }

  }
}
void navigateToHomeScreen(){
  navService.navigateToHomeScreen();
}

}
