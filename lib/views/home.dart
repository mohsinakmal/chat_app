

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
          data.getUsers();
          return Scaffold(
            appBar: AppBar(
              actions: [
                PopupMenuButton<String>(
                  onSelected: (value){
                    switch(value){
                      case "Profile":
                        data.navigateToProfileScreen();
                        break;

                      case "Logout":
                        data.signOut();
                        break;
                    }
                  },
                  itemBuilder: (context) => [
                    PopupMenuItem(
                        value: "Profile",
                        child: Text("Profile")),
                    PopupMenuItem(
                        value: "Logout",
                        child: Text("Logout")),
                  ],
                )
              ],
              title: Text("ChatApp"),
              centerTitle: true,
            ),
            body: Container(
              margin: EdgeInsets.symmetric(vertical: SizeConfig.heightMultiplier * 3, horizontal: SizeConfig.widthMultiplier * 2),
              child: ListView.separated(
                itemCount: 3,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    child: Row(
                      children: [
                        ClipOval(
                            child:data.getProfileImage() != null? Image.network(data.users[index].profileImage,fit: BoxFit.cover,) : Image.asset(ImageUtils.profile,fit: BoxFit.contain, width: SizeConfig.imageSizeMultiplier * 14.8, height: SizeConfig.imageSizeMultiplier * 14.8,)
                        ),
                        SizedBox(width: SizeConfig.widthMultiplier * 3,),
                        Container(
                         child: Text(data.users[index].name),
                        ),
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
