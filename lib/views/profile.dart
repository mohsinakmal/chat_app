

import 'package:chat_app/app/locator.dart';
import 'package:chat_app/utils/image_utils.dart';
import 'package:chat_app/utils/size_config.dart';
import 'package:chat_app/viewmodels/sign_up_in_model.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SignUpViewModel>.reactive(
      builder: (context, data, child){
        return Scaffold(
          appBar: AppBar(
            title: Text("Update Profile"),
            centerTitle: true,
          ),
          body: Container(
            height: double.infinity,
            width: double.infinity,
            child: Stack(
              children: [
                Container(
                  child: SingleChildScrollView(
                    physics: BouncingScrollPhysics(),
                    child: Column(
                      children: [
                        SizedBox(height: 6*SizeConfig.heightMultiplier,),
                        Center(
                          child: Container(
                            child: ClipOval(
                                child:Image.asset(ImageUtils.profile,fit: BoxFit.contain, width: SizeConfig.imageSizeMultiplier * 34.8, height: SizeConfig.imageSizeMultiplier * 34.8,)
                            ),
                            decoration: new BoxDecoration(
                                color: Colors.white,
                                shape: BoxShape.circle,
                                boxShadow: [BoxShadow(
                                  color: Colors.black.withOpacity(.16),
                                  blurRadius: 4 *
                                      SizeConfig.imageSizeMultiplier,
                                )
                                ]
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      },
      viewModelBuilder: () => locator<SignUpViewModel>(),
      disposeViewModel: false,
    );

  }
}
