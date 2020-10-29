

import 'package:chat_app/viewmodels/my_base_view_model.dart';

class NavViewModel extends MyBaseViewModel{
  int currentIndex = 0;
  void updateIndex (int index){
    currentIndex = index;
    notifyListeners();
  }
}