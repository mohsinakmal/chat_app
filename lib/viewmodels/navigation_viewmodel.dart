

import 'package:chat_app/models/index.dart';
import 'package:chat_app/views/chat_screen.dart';
import 'package:chat_app/views/users.dart';
import 'package:chat_app/views/profile.dart';
import 'package:chat_app/views/sign_in.dart';
import 'package:chat_app/views/sign_up.dart';
import 'package:flutter/cupertino.dart';
import 'package:page_transition/page_transition.dart';

class NavigationViewModel{
  final GlobalKey<NavigatorState> navigationKey = GlobalKey<NavigatorState>();
  void navigateToChatScreen(String id){
    navigationKey.currentState.push(PageTransition(
        type: PageTransitionType.fade,
        child: ChatScreen(id: id,
        )));
  }
  void navigateToSignUpScreen(){
    navigationKey.currentState.push(PageTransition(
        type: PageTransitionType.fade,
      child: SignUp()));
  }
  void navigateToSignInScreen(){
    navigationKey.currentState.push(PageTransition(
        type: PageTransitionType.fade,
        child: SignIn()));
  }
  void navigateToProfileScreen(){
    navigationKey.currentState.push(PageTransition(
        type: PageTransitionType.fade,
        child: Profile()));
  }
  void navigateToHomeScreen(){
    navigationKey.currentState.push(PageTransition(
        type: PageTransitionType.fade,
        child: HomeScreen()));
  }
}