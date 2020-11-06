// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'users.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Users _$UsersFromJson(Map<String, dynamic> json) {
  return Users()
    ..name = json['name'] as String
    ..email = json['email'] as String
    ..password = json['password'] as String
    ..profileImage = json['profileImage'] as String
    ..id = json['id'] as String
    ..message = json['message'] as String;
}

Map<String, dynamic> _$UsersToJson(Users instance) => <String, dynamic>{
      'name': instance.name,
      'email': instance.email,
      'password': instance.password,
      'profileImage': instance.profileImage,
      'id': instance.id,
      'message': instance.message
    };
