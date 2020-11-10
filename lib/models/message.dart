import 'package:json_annotation/json_annotation.dart';

part 'message.g.dart';

@JsonSerializable()
class Message {
    Message();

    String message;
    String docID;
    String user;
    
    factory Message.fromJson(Map<String,dynamic> json) => _$MessageFromJson(json);
    Map<String, dynamic> toJson() => _$MessageToJson(this);
}
