

import 'package:chat_app/services/auth_services_hit.dart';
import 'package:chat_app/viewmodels/my_base_view_model.dart';
import 'package:flutter/cupertino.dart';

class ChatViewModel extends MyBaseViewModel{

  AuthServicesHit authServicesHit = AuthServicesHit();
  String message;
  final messageController = TextEditingController();
  FocusNode messageFocus = new FocusNode();
  bool isMessageInFocus = false;

  void _onMessageFocus(){
    if(messageFocus.hasFocus){
      isMessageInFocus = true;
    }
    else{
      isMessageInFocus = false;
    }
  }

  void setFocusListener(){
    messageFocus.addListener(_onMessageFocus);
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