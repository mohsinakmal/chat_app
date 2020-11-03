
import 'package:chat_app/app/locator.dart';
import 'package:chat_app/utils/image_utils.dart';
import 'package:chat_app/utils/size_config.dart';
import 'package:chat_app/viewmodels/chat_view_model.dart';
import 'package:chat_app/viewmodels/sign_up_in_model.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class ChatScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ChatViewModel>.reactive(
        builder: (context, data, child){
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
            body:Container(
              height: double.infinity,
              width: double.infinity,
              child: Stack(
                children: [
                  Image.asset(
                    ImageUtils.bg,
                    fit: BoxFit.cover,
                    height: double.infinity,
                    width: double.infinity,
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Stack(
                      alignment: AlignmentDirectional.centerEnd,
                      children: [
                        Container(
                          margin: EdgeInsets.only(
                              bottom:SizeConfig.heightMultiplier * 3,
                              right: 8.5 * SizeConfig.widthMultiplier,
                              left: 3.5 * SizeConfig.widthMultiplier
                          ),
                          height: SizeConfig.heightMultiplier * 8,
                          decoration: BoxDecoration(
                              shape: BoxShape.rectangle,
                              borderRadius:BorderRadius.all(Radius.circular(50)),
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color:data.isMessageInFocus ? Color(0xFF20B573).withOpacity(.15)
                                      : Colors.black.withOpacity(.05),
                                ),
                              ]
                          ),
                          child: Stack(
                            alignment: AlignmentDirectional.centerEnd,
                            children: [
                              TextField(
                                controller: data.messageController,
                                obscureText: false,
                                decoration: InputDecoration(
                                    contentPadding: EdgeInsets.only(
                                      left: 8 * SizeConfig.widthMultiplier,
                                      right: 4 * SizeConfig.widthMultiplier,
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          width: .5),
                                      borderRadius: BorderRadius.circular(
                                          SizeConfig.widthMultiplier * 6),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide:
                                      BorderSide(color: Colors.green),
                                      borderRadius: BorderRadius.circular(
                                        SizeConfig.widthMultiplier * 6,
                                      ),
                                    ),
                                    hintText: "Type a message"
                                ),
                              ),
                              Positioned(
                                  right: SizeConfig.widthMultiplier * 3,
                                  child: Icon(Icons.camera_alt,color: Colors.grey,)),
                              Positioned(
                                  right: SizeConfig.widthMultiplier * 15 ,
                                  child:Icon(Icons.attach_file, color: Colors.grey,)),
                              //Icon(Icons.attach_file),
                            ],
                            overflow: Overflow.clip,
                          ),
                        ),
                        Positioned(
                            bottom: SizeConfig.heightMultiplier * 5,
                            child: Icon(Icons.arrow_forward_ios_sharp),),
                      ],
                    ),
                  ),
                ],
              ),
            ) ,
          );
        },
      viewModelBuilder: () => locator<ChatViewModel>(),
      disposeViewModel: false,
    );

  }
}
