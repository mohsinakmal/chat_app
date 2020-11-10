import 'package:json_annotation/json_annotation.dart';

part 'chat.g.dart';

@JsonSerializable()
class Chat {
    Chat();

    List chat;
    String docID;
    List user;
    String createdAt;
    
    factory Chat.fromJson(Map<String,dynamic> json) => _$ChatFromJson(json);
    Map<String, dynamic> toJson() => _$ChatToJson(this);
}
