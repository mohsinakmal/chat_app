

import 'package:chat_app/app/locator.dart';
import 'package:chat_app/utils/image_utils.dart';
import 'package:chat_app/utils/size_config.dart';
import 'package:chat_app/viewmodels/sign_up_in_model.dart';
import 'package:chat_app/viewmodels/user_model.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<UserViewModel>.reactive(
        builder: (context, data, child){
          return Scaffold(
            appBar: AppBar(
              title: Text("Home"),
              centerTitle: true,
            ),
            body: Container(
              margin: EdgeInsets.symmetric(vertical: SizeConfig.heightMultiplier * 3, horizontal: SizeConfig.widthMultiplier * 2),
              child: ListView.separated(
                itemCount: 2,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    child: Row(
                      children: [
                        ClipOval(
                            child:Image.asset(ImageUtils.profile,fit: BoxFit.contain, width: SizeConfig.imageSizeMultiplier * 14.8, height: SizeConfig.imageSizeMultiplier * 14.8,)
                        ),
                        SizedBox(width: SizeConfig.widthMultiplier * 3,),

                      ],
                    ),
                  );
                },
                separatorBuilder: (BuildContext context, int index){
                  return SizedBox(height: SizeConfig.heightMultiplier * 3,);
                },
              ),
            ),
          );
        },
      viewModelBuilder: () => locator<UserViewModel>(),
      disposeViewModel: false,
    );

  }
}
