

import 'package:chat_app/utils/size_config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyLoader extends StatelessWidget {
  final Color color;
  const MyLoader({Key key, this.color}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SizedBox(height: SizeConfig.imageSizeMultiplier * 7,width: SizeConfig.imageSizeMultiplier * 7 , child: CircularProgressIndicator(
      valueColor: AlwaysStoppedAnimation(color==null?Colors.blue:color),
    ),);

  }
}
