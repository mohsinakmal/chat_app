import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:json_annotation/json_annotation.dart';

part 'message.g.dart';

@JsonSerializable()
class Message {
    Message();

    String message;
    String docID;
    String user;
    Timestamp createdAt;
    
    factory Message.fromJson(Map<String,dynamic> json) => _$MessageFromJson(json);
    Map<String, dynamic> toJson() => _$MessageToJson(this);
}
