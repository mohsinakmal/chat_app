
import 'package:chat_app/app/locator.dart';
import 'package:chat_app/viewmodels/sign_up_in_model.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SignUpViewModel>.reactive(
        builder: (context, data, child){
          return Scaffold(
            appBar: AppBar(
              actions: [
                PopupMenuButton<String>(
                  onSelected: (value){
                    switch(value){
                      case "Profile":
                        Text("Profile");
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
              child: Text("Hello"),
            ) ,
          );
        },
      viewModelBuilder: () => locator<SignUpViewModel>(),
      disposeViewModel: false,
    );

  }
}
