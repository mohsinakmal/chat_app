

import 'package:chat_app/abstract_class/auth_services.dart';
import 'package:chat_app/models/login_response.dart';
import 'package:chat_app/models/signup_response.dart';
import 'package:chat_app/viewmodels/my_base_view_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthServicesHit extends MyBaseViewModel implements AuthServices{
  @override
  Future<LoginResponse> login({String email, String password}) async{
    try{
      await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);
      return LoginResponse(success: true, message: "Success");
    }
    catch(e){
      return LoginResponse(success: false, message: e.message);
    }
  }

  @override
  Future<SignUpResponse> signup({String name, String email, String password}) async{
    try{
      await mAuth.createUserWithEmailAndPassword(email: email, password: password);
      String userId = mAuth.currentUser.uid;
      firestore.collection("Users").doc(userId).set(
        {
          "name": name,
          "email": email,
          "password": password,

        }
      );
      return SignUpResponse(success: true, message: "success");
    }
    catch(e){
      return SignUpResponse(success: false, message: e.message);
    }
  }

  @override
  Future logout() async{
    await FirebaseAuth.instance.signOut();
  }

}