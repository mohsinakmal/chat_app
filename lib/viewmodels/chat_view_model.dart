

import 'package:chat_app/models/users.dart';
import 'package:chat_app/services/auth_services_hit.dart';
import 'package:chat_app/viewmodels/my_base_view_model.dart';
import 'package:flutter/cupertino.dart';

class ChatViewModel extends MyBaseViewModel{

  AuthServicesHit authServicesHit = AuthServicesHit();
  String message;
  Users user;
  final messageController = TextEditingController();
  FocusNode messageFocus = new FocusNode();
  bool isMessageInFocus = false;

  void setChat() async{
    user.message = messageController.text;
    String docID = firestore.collection("Chat").doc().id;
    await firestore.collection("Chat").doc(docID).set(
      {
        'message' : user.message,
        'docID' : docID,
        'user' : mAuth.currentUser.uid,
      }
    ).catchError((error){ print(error);});
  }

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