
import 'package:chat_app/app/locator.dart';
import 'package:chat_app/utils/image_utils.dart';
import 'package:chat_app/utils/size_config.dart';
import 'package:chat_app/viewmodels/chat_view_model.dart';
import 'package:chat_app/viewmodels/sign_up_in_model.dart';
import 'package:chat_app/widgets/my_back.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class ChatScreen extends StatefulWidget {
  final String id;
  const ChatScreen({Key key,this.id}):super(key:key);
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ChatViewModel>.reactive(
        builder: (context, data, child){
          data.receiver = widget.id;
          return WillPopScope(
              child: Scaffold(
                appBar: AppBar(
                  leading: IconButton(
                    icon: Icon(Icons.arrow_back, color: Colors.white),
                    onPressed: (){
                      data.docID = "";
                      data.chatss.clear();
                      Navigator.of(context).pop();
                    } ,
                  ),
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

                      StreamBuilder(
                          stream:data.getChat(),
                          builder: (context, AsyncSnapshot<QuerySnapshot>snapshot) {
                            if (snapshot.hasData)
                            {
                              if (snapshot.data.size>0)
                              return ListView.builder(
                                reverse: true,
                                itemCount: snapshot.data.size,
                                itemBuilder: (context, index) {
                                return Column(
                                  children: [
                                    SizedBox(height: SizeConfig.heightMultiplier * 2,),
                                    snapshot.data.docs[index]['user']==data.mAuth.currentUser.uid?
                                    Wrap(
                                      children: [
                                        Align(
                                          alignment: Alignment.centerRight,
                                          child: Container(
                                            padding: EdgeInsets.only(
                                              top: SizeConfig.heightMultiplier * 2,
                                              right:SizeConfig.widthMultiplier * 8,
                                              left: SizeConfig.widthMultiplier * 3,
                                              bottom: SizeConfig.heightMultiplier * 2,
                                            ),
                                            //height: SizeConfig.heightMultiplier * 6,
                                            decoration: BoxDecoration(
                                              shape: BoxShape.rectangle,
                                              borderRadius:BorderRadius.circular(12),
                                              color: Colors.greenAccent,
                                            ),
                                            child: Text(snapshot.data.docs[index]['message']),
                                          ),
                                        )
                                      ],
                                    )
                                    :
                                    Wrap(
                                      children: [
                                        Align(
                                          alignment: Alignment.centerLeft,
                                          child: Container(
                                            padding: EdgeInsets.only(
                                                top: SizeConfig.heightMultiplier * 2,
                                                right:SizeConfig.widthMultiplier * 8,
                                                left: SizeConfig.widthMultiplier * 3,
                                                bottom: SizeConfig.heightMultiplier * 2
                                            ),
                                            //height: SizeConfig.heightMultiplier * 6,
                                            decoration: BoxDecoration(
                                              shape: BoxShape.rectangle,
                                              borderRadius:BorderRadius.circular(12),
                                              color: Colors.white,
                                            ),
                                            child: Text(snapshot.data.docs[index]['message']),
                                            //child: Text(''),
                                          ),
                                        )
                                      ],
                                    ),

                                    SizedBox(height: SizeConfig.heightMultiplier * 2,),

                                  ],
                                );
                              },);
                              else
                                {
                                return Container();
                              }
                            }
                            else {
                              return Container();
                            }

                          },
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
                              height: SizeConfig.heightMultiplier * 6,
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
                                bottom: SizeConfig.heightMultiplier * 4,
                                child:GestureDetector(
                                    onTap: (){
                                      data.setChat();
                                    },
                                    child: Icon(Icons.arrow_forward_ios_sharp,))),
                          ],
                        ),
                      ),
                    ],
                  ),
                ) ,
              ),
              onWillPop: () {
                data.docID = "";
                data.chatss.clear();
                Navigator.of(context).pop();
              },
              );
        },
      viewModelBuilder: () => locator<ChatViewModel>(),
      disposeViewModel: false,
    );

  }
}
