

import 'package:chat_app/models/chat.dart';
import 'package:chat_app/models/users.dart';
import 'package:chat_app/services/auth_services_hit.dart';
import 'package:chat_app/viewmodels/my_base_view_model.dart';
import 'package:flutter/cupertino.dart';

class ChatViewModel extends MyBaseViewModel{

  AuthServicesHit authServicesHit = AuthServicesHit();
  String message;
  Users user = new Users();
  final messageController = TextEditingController();
  FocusNode messageFocus = new FocusNode();
  bool isMessageInFocus = false;
  List<Chat> chats = [];


  void setChat() async{
    //user.message = messageController.text;
    String docID = firestore.collection("Chat").doc().id;
    Chat chaat = new Chat();
    chaat.user = mAuth.currentUser.uid;
    chaat.message = messageController.text;
    //chaat.docID = docID;
    chats.add(chaat);
    List<String> users = new List<String>();
    users.add(mAuth.currentUser.uid);
    users.add();
    await firestore.collection("Chat").doc(docID).set({
      'chats' : chats,
      'docID' : docID,
    }).catchError((error){ print(error);});
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