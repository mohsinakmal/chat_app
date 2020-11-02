


import 'package:chat_app/viewmodels/my_base_view_model.dart';
import 'package:chat_app/viewmodels/nav_view_model.dart';
import 'package:chat_app/viewmodels/navigation_viewmodel.dart';
import 'package:chat_app/viewmodels/sign_up_in_model.dart';
import 'package:get_it/get_it.dart';

void $initGetIt(GetIt g, {String environment}) {
  g.registerLazySingleton<MyBaseViewModel>(() => MyBaseViewModel());
  g.registerLazySingleton<SignUpViewModel>(() => SignUpViewModel());
  g.registerLazySingleton<NavViewModel>(() => NavViewModel());
  g.registerLazySingleton<NavigationViewModel>(() => NavigationViewModel());
}