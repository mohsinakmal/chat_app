import 'package:json_annotation/json_annotation.dart';

part 'chat.g.dart';

@JsonSerializable()
class Chat {
    Chat();

    String message;
    String docID;
    String user;
    
    factory Chat.fromJson(Map<String,dynamic> json) => _$ChatFromJson(json);
    Map<String, dynamic> toJson() => _$ChatToJson(this);
}
