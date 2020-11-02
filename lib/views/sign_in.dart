import 'package:chat_app/app/locator.dart';
import 'package:chat_app/utils/image_utils.dart';
import 'package:chat_app/utils/size_config.dart';
import 'package:chat_app/viewmodels/sign_up_in_model.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class SignIn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SignUpViewModel>.reactive(
      onModelReady: (data) => data.initializeModel(),
      builder: (context, data, child) {
        return Scaffold(
          appBar: AppBar(
            title: Text("ChatApp"),
            centerTitle: true,
          ),
          body: Container(
            child: Stack(
              children: [
                Container(
                  height: double.infinity,
                  width: double.infinity,
                ),
                SingleChildScrollView(
                  child: Column(
                    children: [
                      Center(
                        child: Container(
                          child: Image.asset(ImageUtils.ast),
                        ),
                      ),
                      SizedBox(
                        height: SizeConfig.heightMultiplier * 2,
                      ),
                      Container(
                        height: SizeConfig.heightMultiplier * 5.5,
                        decoration: BoxDecoration(
                            shape: BoxShape.rectangle,
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(
                              SizeConfig.widthMultiplier * 6,
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: data.isEmailInFocus
                                    ? Color(0xFF20B573).withOpacity(.15)
                                    : Colors.black.withOpacity(.05),
                              ),
                            ]),
                        margin: EdgeInsets.only(
                            top: 2.7 * SizeConfig.heightMultiplier,
                            right: 3.5 * SizeConfig.widthMultiplier,
                            left: 3.5 * SizeConfig.widthMultiplier),
                        child: TextField(
                          focusNode: data.emailFocus,
                          style: TextStyle(
                            fontSize: 2.35 * SizeConfig.textMultiplier,
                          ),
                          controller: data.emailController,
                          obscureText: false,
                          keyboardType: TextInputType.name,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.only(
                                left: 8 * SizeConfig.widthMultiplier,
                                right: 4 * SizeConfig.widthMultiplier),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(width: .5),
                              borderRadius: BorderRadius.circular(
                                  SizeConfig.widthMultiplier * 6),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.green),
                              borderRadius: BorderRadius.circular(
                                SizeConfig.widthMultiplier * 6,
                              ),
                            ),
                            labelStyle: TextStyle(
                                fontSize: 2.1 * SizeConfig.textMultiplier),
                            labelText: 'Email',
                          ),
                        ),
                      ),
                      SizedBox(
                        height: SizeConfig.heightMultiplier * 2,
                      ),
                      Container(
                        height: SizeConfig.heightMultiplier * 5.5,
                        decoration: BoxDecoration(
                            shape: BoxShape.rectangle,
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(
                              SizeConfig.widthMultiplier * 6,
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: data.isPasswordInFocus
                                    ? Color(0xFF20B573).withOpacity(.15)
                                    : Colors.black.withOpacity(.05),
                              ),
                            ]),
                        margin: EdgeInsets.only(
                            top: 2.7 * SizeConfig.heightMultiplier,
                            right: 3.5 * SizeConfig.widthMultiplier,
                            left: 3.5 * SizeConfig.widthMultiplier),
                        child: TextField(
                          focusNode: data.passwordFocus,
                          style: TextStyle(
                            fontSize: 2.35 * SizeConfig.textMultiplier,
                          ),
                          controller: data.passwordController,
                          obscureText: true,
                          keyboardType: TextInputType.visiblePassword,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.only(
                                left: 8 * SizeConfig.widthMultiplier,
                                right: 4 * SizeConfig.widthMultiplier),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(width: .5),
                              borderRadius: BorderRadius.circular(
                                  SizeConfig.widthMultiplier * 6),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.green),
                              borderRadius: BorderRadius.circular(
                                SizeConfig.widthMultiplier * 6,
                              ),
                            ),
                            labelStyle: TextStyle(
                                fontSize: 2.1 * SizeConfig.textMultiplier),
                            labelText: 'Password',
                          ),
                        ),
                      ),
                      SizedBox(
                        height: SizeConfig.heightMultiplier * 2,
                      ),
                      InkWell(
                        onTap: data.busy("isSigningIn")
                            ? null
                            : () {
                                data.signIn();
                              },
                        child: Align(
                          alignment: Alignment.bottomCenter,
                          child: Container(
                            margin: EdgeInsets.only(
                                //bottom: SizeConfig.heightMultiplier * 5.5,
                                top: 3.5 * SizeConfig.heightMultiplier,
                                right: 3.5 * SizeConfig.widthMultiplier,
                                left: 3.5 * SizeConfig.widthMultiplier),
                            height: 6 * SizeConfig.heightMultiplier,
                            decoration: BoxDecoration(
                              shape: BoxShape.rectangle,
                              color: Colors.blue,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(50)),
                            ),
                            child: Center(
                              child: Text(
                                "Sign In",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 2.1 * SizeConfig.textMultiplier),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: SizeConfig.heightMultiplier * 2,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            child: Text("Can't Sign In,"),
                          ),
                          GestureDetector(
                            onTap: (){
                              data.navigateToSignUpScreen();
                            },
                            child: Container(
                              child: Text(" Sign Up?"),
                            ),
                          ),
                        ],
                      ),
                      Container(
                        height: SizeConfig.heightMultiplier * 5,
                        child: Center(
                          child: data.errorMessage != null
                              ? Text(
                                  data.errorMessage,
                                  style: TextStyle(
                                    color: Colors.redAccent,
                                    fontSize: 2 * SizeConfig.textMultiplier,
                                  ),
                                  maxLines: null,
                                  textAlign: TextAlign.center,
                                )
                              : Container(),
                        ),
                      ),
                    ],
                  ),
                ),
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
