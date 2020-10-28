import 'package:chat_app/utils/screen_util.dart';
import 'package:chat_app/utils/size_config.dart';
import 'package:chat_app/views/sign_up.dart';
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
      debugShowCheckedModeBanner: false,
      home: MyApp(),
    ),
  ));
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
            return SignUp();
          },
        );
      }
    );
  }
}





