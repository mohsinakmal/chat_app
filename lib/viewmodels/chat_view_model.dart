

import 'package:chat_app/models/chat.dart';
import 'package:chat_app/models/message.dart';
import 'package:chat_app/models/users.dart';
import 'package:chat_app/services/auth_services_hit.dart';
import 'package:chat_app/viewmodels/my_base_view_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

class ChatViewModel extends MyBaseViewModel{

  AuthServicesHit authServicesHit = AuthServicesHit();
  String message;
  Users user = new Users();
  final messageController = TextEditingController();
  FocusNode messageFocus = new FocusNode();
  bool isMessageInFocus = false;
  //List<Message> chats = new List<Message>();
  String docID = '';
  List<Map<String,String>> chatss = new List<Map<String,String>>();

  void setChat() async{
    //user.message = messageController.text;
    if (docID.isEmpty){
      docID = firestore.collection("Chat").doc().id;
    }
    // Message message = new Message();
    // message.user = mAuth.currentUser.uid;
    // message.message = messageController.text;

    Map<String,String> messages = new Map<String,String>();
    messages['message'] = messageController.text;
    messages['user'] = mAuth.currentUser.uid;
    //List<String> message = new List<String>();
    //String user  = mAuth.currentUser.uid;
    //String messages = messageController.text;
    // message.add(user.);
    // message.add(messages);
    //chaat.docID = docID;
    chatss.add(messages);
    //chats.add(message);
    List<String> users = new List<String>();
    users.add(mAuth.currentUser.uid);
    Chat chat = new Chat();
    chat.chat = chatss;
    chat.docID = docID;
    chat.user = [mAuth.currentUser.uid,""];
    //users.add();
    await firestore.collection("Chat").doc(docID).set(chat.toJson()).catchError(
            (error){
      print(error);
            }
      );
    messageController.clear();
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