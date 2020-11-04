import 'package:chat_app/utils/screen_util.dart';
import 'package:chat_app/utils/size_config.dart';
import 'package:chat_app/viewmodels/navigation_viewmodel.dart';
import 'package:chat_app/views/chat_screen.dart';
import 'package:chat_app/views/home.dart';
import 'package:chat_app/views/sign_in.dart';
import 'package:chat_app/views/sign_up.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';

import 'app/locator.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  configure();
  runApp(Phoenix(
    child: MaterialApp(
      navigatorKey: locator<NavigationViewModel>().navigationKey,
      debugShowCheckedModeBanner: false,
      home: MyApp(),
    ),
  ));
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    FirebaseAuth mAuth = FirebaseAuth.instance;
    ScreenUtil.instance = ScreenUtil.getInstance()..init(context);
    ScreenUtil.instance = ScreenUtil(
        width: MediaQuery.of(context).size.width.round(),
        height: MediaQuery.of(context).size.height.round(),
        allowFontScaling: true);
    return LayoutBuilder(
      builder: (context, constraints){
        return OrientationBuilder(
          builder: (context, orientation){
            SizeConfig().init(constraints, orientation);
            return mAuth.currentUser !=null ? HomeScreen():SignIn();
          },
        );
      }
    );
  }
}





