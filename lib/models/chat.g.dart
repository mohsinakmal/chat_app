// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Chat _$ChatFromJson(Map<String, dynamic> json) {
  return Chat()
    ..chat = json['chat'] as List
    ..docID = json['docID'] as String
    ..user = json['user'] as List
    ..createdAt = json['createdAt'] as String;
}

Map<String, dynamic> _$ChatToJson(Chat instance) => <String, dynamic>{
      'chat': instance.chat,
      'docID': instance.docID,
      'user': instance.user,
      'createdAt': instance.createdAt
    };
