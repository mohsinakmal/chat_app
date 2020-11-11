

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
  String receiver;

  void setChat() async{
    String groupID;
    if (mAuth.currentUser.uid.hashCode <= receiver.hashCode) {
      groupID = '${mAuth.currentUser.uid}-$receiver';
    } else {
      groupID = '$receiver-${mAuth.currentUser.uid}';
    }
    String docID = await firestore
        .collection("chat")
        .doc(mAuth.currentUser.uid+receiver)
        .collection(mAuth.currentUser.uid+receiver)
        .doc()
        .id;
    Message message = new Message();
    message.message = messageController.text;
    message.user = mAuth.currentUser.uid;
    message.docID = docID;
    message.createdAt = Timestamp.fromDate(DateTime.now());
    //users.add();
    await firestore
        .collection("chat")
        .doc(groupID)
        .collection(groupID)
        .doc(docID)
        .set(message.toJson()).catchError(
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


  Stream<QuerySnapshot> getChat(){
    String groupID;
    if (mAuth.currentUser.uid.hashCode <= receiver.hashCode) {
      groupID = '${mAuth.currentUser.uid}-$receiver';
    } else {
      groupID = '$receiver-${mAuth.currentUser.uid}';
    }
    return firestore
        .collection("chat")
        .doc(groupID)
        .collection(groupID)
        .orderBy('createdAt',descending: true)
        .snapshots();
  }

}