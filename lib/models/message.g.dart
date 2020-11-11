// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Message _$MessageFromJson(Map<String, dynamic> json) {
  return Message()
    ..message = json['message'] as String
    ..docID = json['docID'] as String
    ..user = json['user'] as String
    ..createdAt = json['createdAt'] as Timestamp;
}

Map<String, dynamic> _$MessageToJson(Message instance) => <String, dynamic>{
      'message': instance.message,
      'docID': instance.docID,
      'user': instance.user,
      'createdAt': instance.createdAt
    };
