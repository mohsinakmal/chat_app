


import 'package:chat_app/utils/size_config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyBack extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(top: SizeConfig.heightMultiplier * 5.5),
        height: SizeConfig.imageSizeMultiplier*8.5,
        width: SizeConfig.imageSizeMultiplier*8.5,
        decoration: BoxDecoration(
            boxShadow: [BoxShadow(
                color: Color(0xFFDFDFE8),
                blurRadius: 3*SizeConfig.imageSizeMultiplier,
                offset: Offset(1,1)
            )]
        ),
        child: RaisedButton(
          padding: EdgeInsets.zero,
          elevation: 0,
          color: Colors.white,
          child: Center(
            child: Icon(
              Icons.arrow_back_ios,
              color: Color(0xFF7D7E8A),
              size: 4.3*SizeConfig.imageSizeMultiplier,
            ),
          ),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(SizeConfig.imageSizeMultiplier * 2.2)),
          onPressed: () {
            Navigator.pop(context);
          },
        ));
  }
}
