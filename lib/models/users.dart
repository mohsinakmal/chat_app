import 'package:json_annotation/json_annotation.dart';

part 'users.g.dart';

@JsonSerializable()
class Users {
    Users();

    String name;
    String email;
    String password;
    String profileImage;
    String id;
    String message;
    
    factory Users.fromJson(Map<String,dynamic> json) => _$UsersFromJson(json);
    Map<String, dynamic> toJson() => _$UsersToJson(this);
}
