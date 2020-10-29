

import 'package:chat_app/views/home.dart';
import 'package:flutter/cupertino.dart';
import 'package:page_transition/page_transition.dart';

class NavigationViewModel{
  final GlobalKey<NavigatorState> navigationKey = GlobalKey<NavigatorState>();
  void navigateToHomeScreen(){
    navigationKey.currentState.push(PageTransition(
        type: PageTransitionType.fade,
        child: HomeScreen(
        )));
  }
}