

import 'package:chat_app/abstract_class/auth_services.dart';
import 'package:chat_app/models/login_response.dart';
import 'package:chat_app/models/signup_response.dart';
import 'package:chat_app/viewmodels/my_base_view_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';

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
  Future<SignUpResponse> signup(data, profileImage) async{
    try{
      await mAuth.createUserWithEmailAndPassword(email: data.email, password: data.password);
      String userId = mAuth.currentUser.uid;
      storageRef = storageRef.child(userId);
      if(profileImage!=null){
        UploadTask uploadTask =  storageRef.child(DateTime.now().toString()).putFile(profileImage);
        data.profileImage = await(await uploadTask.whenComplete(() => null)).ref.getDownloadURL();
      }
      await firestore.collection("Users").doc(userId).set(data.toJson());
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
  String userId(){
    return mAuth.currentUser.uid;
  }

}